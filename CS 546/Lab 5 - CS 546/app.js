const express = require('express')
const app = express()
const configRoutes = require('./routes')

configRoutes(app)

function serverLog() {
    console.log("Server is running!")
}

app.listen(3000, serverLog())