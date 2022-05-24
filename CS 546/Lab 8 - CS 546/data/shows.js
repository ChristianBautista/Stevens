const axios = require('axios')

async function showSearch(showSearchTerm) {
    if(!showSearchTerm) throw "No search term provided"
    showSearchTerm = showSearchTerm.trim()
    if(!showSearchTerm.length) throw "Search term is empty"
    const url = "http://api.tvmaze.com/search/shows?q="+showSearchTerm
    const {data} = await axios.get(url)
    let results = []
    if(data.length>5) {
        for(let i=0; i<5; i++) {
            results[i] = data[i]
        }
    }
    for(let i=0; i<results.length; i++) {
        results[i] = results[i]["show"]
    }

    return results
}

async function showLookup(id) {
    if(!id) throw "No id provided"
    id = Number(id)
    if(typeof id !== 'number' || isNaN(id)) throw "id is not a number"
    if(id%1 !== 0) throw "id is not a whole number"
    id = parseInt(id)
    const url = "http://api.tvmaze.com/shows/"+id
    const {data} = await axios.get(url)
    let show = {
        "name": (!data["name"]) ? "N/A" : data["name"],
        "img": (!data["image"] || !data["image"]["medium"]) ? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg" : data["image"]["medium"],
        "language": (!data["language"]) ? "N/A" : data["language"],
        "genres": (!data["genres"]) ? [] : data["genres"],
        "ratingAverage": (!data["rating"] || !data["rating"]["average"]) ? "N/A" : data["rating"]["average"],
        "networkName": (!data["network"] || !data["network"]["name"]) ? "N/A" : data["network"]["name"],
        "summary": (!data["summary"]) ? "N/A" : data["summary"]
    }
    return show
}

module.exports = {
    showSearch,
    showLookup
}