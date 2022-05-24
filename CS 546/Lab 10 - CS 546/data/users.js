const mongoCollections = require('../config/mongoCollections')
const users = mongoCollections.users
//const {ObjectId} = require('mongodb')
const validation = require('../validation')
const bcrypt = require('bcrypt')
const saltRounds = 16

async function createUser(username, password) {
    let user = validation.validate(username, password)
    //check for duplicate username
    const userCollection = await users()
    let exists = await userCollection.findOne({"username": user["username"]})
    if(exists!==null) throw "username already exists"
    user["password"] = await bcrypt.hash(user["password"], saltRounds)
    const insertInfo = await userCollection.insertOne(user)
    if(insertInfo["insertedCount"]===0) throw "user could not be added"
    return {"userInserted": true}
}

async function checkUser(username, password) {
    let user = validation.validate(username, password)
    const userCollection = await users()
    let exists = await userCollection.findOne({"username": user["username"]})
    if(exists===null) throw "Either the username or password is invalid"
    //Potentially put a try/catch here
    const match = await bcrypt.compare(password, exists["password"])
    if(!match) throw "Either the username or password is invalid"
    return {"authenticated": true}
}

module.exports = {
    createUser,
    checkUser
}