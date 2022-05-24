const protocolRoutes = require('./protocol')

const constructorMethod = (app) => {
    app.use('/', protocolRoutes)
    app.use('*', (req, res) => {
        res.sendStatus(404)
    })
}

module.exports = constructorMethod