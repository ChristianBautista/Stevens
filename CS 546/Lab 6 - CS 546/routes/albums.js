const express = require('express')
const router = express.Router()
const data = require('../data')
const albumData = data.albums
const bandData = data.bands
const validation = require('../validation')

router.get('/:bandId', async (req,res) => {
    let bandId = req.params.bandId

    try {
        bandId = validation.validId("get",bandId)
    } catch(e) {
        return res.status(400).json({error:e})
    }

    try {
        const result = await albumData.getAll(bandId)
        if(!result.length) throw "get error: band does not have any albums"
        res.json(result)
    } catch(e) {
        return res.status(404).json({error:e})
    }
})

router.post('/:bandId', async (req,res) => {
    let bandId = req.params.bandId
    let albumInfo = req.body
    let title = albumInfo["title"]
    let releaseDate = albumInfo["releaseDate"]
    let tracks = albumInfo["tracks"]
    let rating = albumInfo["rating"]

    try {
        bandId = validation.validId("post",bandId)
    } catch(e) {
        return res.status(400).json({error:e})
    }

    try {
        await bandData.get(bandId)
    } catch(e) {
        return res.status(404).json({error:e})
    }

    try {
        albumInfo = validation.validAlbum("post",bandId,title,releaseDate,tracks,rating)
        bandId = albumInfo["bandId"]
        title = albumInfo["title"]
        releaseDate = albumInfo["releaseDate"]
        tracks = albumInfo["tracks"]
        rating = albumInfo["rating"]
    } catch(e) {
        return res.status(400).json({error:e})
    }

    try {
        const insertAlbum = await albumData.create(bandId,title,releaseDate,tracks,rating)
        const result = await bandData.get(bandId)
        res.json(result)
    } catch(e) {
        return res.status(404).json({error:e})
    }
})

router.get('/album/:albumId', async (req,res) => {
    let albumId = req.params.albumId

    try {
        albumId = validation.validId("get",albumId)
    } catch(e) {
        return res.status(400).json({error:e})
    }

    try {
        const result = await albumData.get(albumId)
        res.json(result)
    } catch(e) {
        return res.status(404).json({error:e})
    }
})

router.delete('/:albumId', async (req,res) => {
    let albumId = req.params.albumId

    try {
        albumId = validation.validId("get",albumId)
    } catch(e) {
        return res.status(400).json({error:e})
    }

    try {
        let result = await albumData.remove(albumId)
        result = {
            "albumId": albumId,
            "deleted": true
        }
        res.json(result)
    } catch(e) {
        return res.status(404).json({error:e})
    }
})

module.exports = router