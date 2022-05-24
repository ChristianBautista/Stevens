const express = require('express')
const router = express.Router()
const users = require('../data/users')
const validation = require('../validation')

// GET /
router.get('/', (req, res) => {
    const user = req.session.user
    try {
        if(user) {
            return res.redirect('/private')
        } else {
            return res.render('pages/login',{"title": "Login", "err": "", "cl": "hide"})
        }
    } catch(e) {
        let err = typeof e === 'string' ? e : e.message
        err = "Error 500: " + err
        return res.render('pages/login',{"title": "Login", "err": err, "cl": ""})
    }
})

// GET /signup
router.get('/signup', (req, res) => {
    const user = req.session.user
    try {
        if(user) {
            return res.redirect('/private')
        } else {
            return res.render('pages/signup',{"title": "Signup", "err": "", "cl": "hide"})
        }
    } catch(e) {
        let err = typeof e === 'string' ? e : e.message
        err = "Error 500: " + err
        return res.render('pages/signup',{"title": "Signup", "err": err, "cl": ""})
    }
})

// POST /signup
router.post('/signup', async (req, res) => {
    let username = req.body["username"]
    let password = req.body["password"]
    try {
        const user = validation.validate(username, password)
        username = user["username"]
        password = user["password"]
    } catch(e) {
        let err = typeof e === 'string' ? e : e.message
        err = "Error 400: " + err
        return res.render('pages/signup',{"title": "Signup", "err": err, "cl": ""})
    }
    try {
        const result = await users.createUser(username, password)
        if(result && result["userInserted"]) {
            return res.redirect('/')
        } else {
            throw 500
        }
    } catch(e) {
        if(e===500) {
            return res.render('pages/signup',{"title": "Signup", "err": "Error 500: Internal Server Error", "cl": ""})
        } else {
            let err = typeof e === 'string' ? e : e.message
            err = "Error 400: " + err
            return res.render('pages/signup',{"title": "Signup", "err": err, "cl": ""})
        }
    }
})

// POST /login
router.post('/login', async (req, res) => {
    let username = req.body["username"]
    let password = req.body["password"]
    let user = {}
    try {
        user = validation.validate(username, password)
        username = user["username"]
        password = user["password"]
    } catch(e) {
        let err = typeof e === 'string' ? e : e.message
        err = "Error 400: " + err
        return res.render('pages/login',{"title": "Login", "err": err, "cl": ""})
    }
    try {
        const result = await users.checkUser(username, password)
        if(result["authenticated"]) {
            req.session.user = user
            return res.redirect('/private')
        } else {
            throw 500
        }
    } catch(e) {
        if(e===500) {
            return res.render('pages/login',{"title": "Login", "err": "Error 500: Internal Server Error", "cl": ""})
        } else {
            let err = typeof e === 'string' ? e : e.message
            err = "Error 400: " + err
            return res.render('pages/login',{"title": "Login", "err": err, "cl": ""})
        }
    }
})

// GET /private
router.get('/private', (req, res) => {
    //render page that dispalys username and hyperlink at the bottom to logout
    const user = req.session.user
    try {
        if(user) {
            return res.render('pages/private',{"title": "Private", "username": user["username"]})
        } else {
            return res.redirect('/')
        }
    } catch(e) {
        let err = typeof e === 'string' ? e : e.message
        err = "Error 500: " + err
        return res.render('pages/private',{"title": "Private", "username": "", "err": err})
    }
})

// GET /logout
router.get('/logout', (req, res) => {
    req.session.destroy()
    res.render('pages/logout',{"title": "Logout"})
})

module.exports = router