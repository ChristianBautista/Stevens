const express = require('express')
const router = express.Router()
const data = require('../data')

router.route('/people').get(async (req,res) => {
    try {
        const people = await data.getPeople()
        res.json(people)
    } catch(e) {
        res.status(500).send(e)
    }
})

router.route('/work').get(async (req,res) => {
    try {
        const work = await data.getWork()
        res.json(work)
    } catch(e) {
        res.status(500).send(e)
    }
})

router.route('/people/:id').get(async (req,res) => {
    try {
        const person = await data.getPersonById(req.params.id)
        res.json(person)
    } catch(e) {
        res.status(404).json({"error":e})
    }
})

router.route('/work/:id').get(async (req,res) => {
    try {
        const work = await data.getWorkById(req.params.id)
        res.json(work)
    } catch(e) {
        res.status(404).json({"error":e})
    }
})

module.exports = router