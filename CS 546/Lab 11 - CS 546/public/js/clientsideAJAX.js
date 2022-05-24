(function($) {
    var showList = $('#showList')
    var show = $('#show')
    var searchForm = $('#searchForm')
    var search_term = $('#search_term')
    var homeLink = $('#homeLink')
    var requestConfig

    if(!requestConfig) {
        requestConfig = {
            method: "GET",
            url: "http://api.tvmaze.com/shows"
        }
    }
    
    //function to display show
    function displayShow(showLink) {
        requestConfig = {
            method: "GET",
            url: showLink
        }
        $.ajax(requestConfig).then(function(data) {
            //validate all show data: name, image, language, genres, ratingAverage, networkName, summary
            let showData = {
                "name": (!data["name"]) ? "N/A" : data["name"],
                "image": (!data["image"] || !data["image"]["medium"]) ? "/public/no_image.jpeg" : data["image"]["medium"],
                "language": (!data["language"]) ? "N/A" : data["language"],
                "genres": (!data["genres"]) ? ["N/A"] : data["genres"],
                "ratingAverage": (!data["rating"] || !data["rating"]["average"]) ? "N/A" : data["rating"]["average"],
                "networkName": (!data["network"] || !data["network"]["name"]) ? "N/A" : data["network"]["name"],
                "summary": (!data["summary"]) ? "N/A" : data["summary"]
            }

            show.append(`
                <h1>${showData["name"]}</h1>
                <img alt="${showData["name"]}" src="${showData["image"]}">
                <dl>
                    <dt>Language</dt>
                    <dd>${showData["language"]}</dd>
                    <dt>Genres</dt>
                    <ul>
                        ${showData["genres"].map((genre) => `<li>${genre}</li>`).join("")}
                    </ul>
                    <dt>Average Rating</dt>
                    <dd>${showData["ratingAverage"]}</dd>
                    <dt>Network</dt>
                    <dd>${showData["networkName"]}</dd>
                    <dt>Summary</dt>
                    <dd>${showData["summary"]}</dd>
                </dl>
            `)
        })
    }

    //function for page load
    function loadPage(responseMessage,homePage) {
        //hide all elements except searchForm and search_term
        showList.hide()
        show.hide()
        homeLink.hide()
        //empty showList and show in case it wasn't empty
        showList.empty()
        show.empty()
        //link text will be the name of the show
        //href attribute will be set to the url for that show from the tv maze api
        //url for link in _links.self.href
        if(homePage) {
            $.each(responseMessage, function() {
                showList.append(`<li><a class="link" href="${this._links.self.href}">${this.name}</a></li>`)
            })
        }
        else {
            $.each(responseMessage, function() {
                showList.append(`<li><a class="link" href="${this.show._links.self.href}">${this.show.name}</a></li>`)
            })
        }
        showList.show()
        //check if a link is clicked 
        $('a.link').on('click', function(event) {
            event.preventDefault()
            //hide and empty showList
            showList.hide()
            showList.empty()
            //empty show in case it wasn't empty
            show.empty()
            //call display function
            displayShow(event.target.href)
            //show show and homelink
            show.show()
            homeLink.show()
        })
    }
    
    // 1. Page Load
    $.ajax(requestConfig).then(function(responseMessage) {
        loadPage(responseMessage, true)
    })

    // 2. Search Form Submission
    searchForm.submit(function(event) {
        event.preventDefault()
        //validate search_term
        let search_term_val = search_term.val()
        if(!search_term_val) {
            alert("No search term provided")
        } else {
            search_term_val = search_term_val.trim()
            if(!search_term_val.length) {
                alert("No search term provided")
            } else {
                requestConfig = {
                    method: "GET",
                    url: `http://api.tvmaze.com/search/shows?q=${search_term_val}`
                }
                $.ajax(requestConfig).then(function(responseMessage) {
                    loadPage(responseMessage, false)
                })
            }
        }
    })
})(window.jQuery)