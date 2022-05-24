const express = require('express')
const router = express.Router()
const data = require('../data')
const bandData = data.bands
const validation = require('../validation')

router.get('/', async (req,res) => {
    try {
        let bandList = await bandData.getAll()
        if(bandList.length>0) {
            bandList.map(function(x) {
                return {"_id": x["_id"], "name": x["name"]}
            })
        }
        res.json(bandList)
    } catch(e) {
        res.sendStatus(500)
    }
})

router.post('/', async (req,res) => {
    let bandInfo = req.body
    let name = bandInfo["name"]
    let genre = bandInfo["genre"]
    let website = bandInfo["website"]
    let recordLabel = bandInfo["recordLabel"]
    let bandMembers = bandInfo["bandMembers"]
    let yearFormed = bandInfo["yearFormed"]

    try {
        bandInfo = validation.validBand("post",name,genre,website,recordLabel,bandMembers,yearFormed)
        name = bandInfo["name"]
        genre = bandInfo["genre"]
        website = bandInfo["website"]
        recordLabel = bandInfo["recordLabel"]
        bandMembers = bandInfo["bandMembers"]
        yearFormed = bandInfo["yearFormed"]
    } catch(e) {
        return res.status(400).json({error:e})
    }

    try {
        const result = await bandData.create(name,genre,website,recordLabel,bandMembers,yearFormed)
        return res.json(result)
    } catch(e) {
        res.sendStatus(500)
    }
})

router.get('/:id', async (req,res) => {
    let id = req.params.id

    try {
        id = validation.validId("get",id)
    } catch(e) {
        return res.status(400).json({error:e})
    }

    try {
        const result = await bandData.get(id)
        res.json(result)
    } catch(e) {
        return res.status(404).json({error:e})
    }
})

router.put('/:id', async (req,res) => {
    let id = req.params.id
    let bandInfo = req.body
    let name = bandInfo["name"]
    let genre = bandInfo["genre"]
    let website = bandInfo["website"]
    let recordLabel = bandInfo["recordLabel"]
    let bandMembers = bandInfo["bandMembers"]
    let yearFormed = bandInfo["yearFormed"]

    try {
        id = validation.validId("put",id)
        bandInfo = validation.validBand("put",name,genre,website,recordLabel,bandMembers,yearFormed)
        name = bandInfo["name"]
        genre = bandInfo["genre"]
        website = bandInfo["website"]
        recordLabel = bandInfo["recordLabel"]
        bandMembers = bandInfo["bandMembers"]
        yearFormed = bandInfo["yearFormed"]
    } catch(e) {
        return res.status(400).json({error:e})
    }

    try {
        const result = await bandData.update(id,name,genre,website,recordLabel,bandMembers,yearFormed)
        res.json(result)
    } catch(e) {
        return res.status(404).json({error:e})
    }
})

router.delete('/:id', async (req,res) => {
    let id = req.params.id

    try {
        id = validation.validId("delete",id)
    } catch(e) {
        return res.status(400).json({error:e})
    }

    try {
        let result = await bandData.remove(id)
        result = {
            "bandId": id,
            "deleted": true
        }
        res.json(result)
    } catch(e) {
        return res.status(404).json({error:e})
    }
})

module.exports = router