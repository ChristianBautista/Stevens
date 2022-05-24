const express = require('express')
const router = express.Router()
const data = require('../data')
const showData = data.shows

router.get('/', async (req,res) => {
    return res.render('pages/index',{"title": "Show Finder"})    
})

router.post('/searchshows', async (req,res) => {
    let showSearchTerm = req.body.showSearchTerm

    try {
        if(!showSearchTerm) throw "No search term provided"
        showSearchTerm = showSearchTerm.trim()
        if(!showSearchTerm.length) throw "Search term is empty"
    } catch(e) {
        return res.status(400).render('pages/error400',{"title": "Shows Found", "error":e})
    }

    try {
        const results = await showData.showSearch(showSearchTerm)
        return res.render('pages/results',{"title": "Shows Found", "showSearchTerm": showSearchTerm, "results": results})
    } catch(e) {
        return res.status(500).render('pages/error400',{"title": "Shows Found", "error":e})
    }
})

router.get('/show/:id', async (req,res) => {
    let id = req.params.id

    try {
        if(!id) throw "No id provided"
        id = Number(id)
        if(typeof id !== 'number' || isNaN(id)) throw "id is not a number"
        if(id%1 !== 0) throw "id is not a whole number"
        id = parseInt(id)
    } catch(e) {
        return res.status(400).render('pages/error400',{"title": "Unknown Show", "error":e})
    }

    try {
        //name, img, language, genres, ratingAverage, networkName, summary
        const show = await showData.showLookup(id)
        return res.render('pages/show',{"title": show["name"], "img": show["img"], "language": show["language"], "genres": show["genres"], "ratingAverage": show["ratingAverage"], "networkName": show["networkName"], "summary": show["summary"]})
    } catch(e) {
        return res.status(500).render('pages/error404',{"title": "Unknown Show", "error":e})
    }
})

module.exports = router