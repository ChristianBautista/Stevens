const userApiRoutes = require('./userApi')

function constructorMethod(app) {
    app.use('/', userApiRoutes)

    app.use('*', (req, res) => {
        res.status(404).json({error: "Not found"})
    })
}

module.exports = constructorMethod