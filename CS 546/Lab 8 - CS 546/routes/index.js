const showRoutes = require('./shows')

function constructorMethod(app) {
    app.use('/', showRoutes)

    app.use('*', (req, res) => {
        res.status(404).json({error: "Not found"})
    })
}

module.exports = constructorMethod