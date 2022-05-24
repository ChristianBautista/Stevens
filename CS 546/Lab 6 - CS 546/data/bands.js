const mongoCollections = require('../config/mongoCollections')
const bands = mongoCollections.bands
const {ObjectId} = require('mongodb')
const validation = require('../validation')


async function create(name, genre, website, recordLabel, bandMembers, yearFormed) {
    let newBand = validation.validBand("create",name,genre,website,recordLabel,bandMembers,yearFormed)
    newBand["albums"] = []
    newBand["overallRating"] = 0

    const bandCollection = await bands()
    const insertInfo = await bandCollection.insertOne(newBand)
    if(!insertInfo["acknowledged"] || !insertInfo["insertedId"]) throw "create error: band was not inserted"
    const id = insertInfo["insertedId"].toString() 
    return await get(id)
}

async function getAll() {
    const bandCollection = await bands()
    const bandList = await bandCollection.find().toArray()
    if(!bandList) throw "getAll error: could not get all bands"
    bandList.map(x => x["_id"] = x["_id"].toString())
    //TODO: map through all albums and make their ids strings
    bandList.map(x => x["albums"].map(y => y["_id"] = y["_id"].toString()))

    return bandList
}

async function get(id) {
    id = validation.validId("get",id)
    const bandCollection = await bands()
    const band = await bandCollection.findOne({_id: ObjectId(id)})
    if(band===null) throw "get error: no band has that id"
    band["_id"] = band["_id"].toString()
    //TODO: map through all albums and make their ids strings
    band["albums"].map(x => x["_id"] = x["_id"].toString())
    return band
}

async function remove(id) {
    id = validation.validId("remove",id)
    let band = await get(id)
    let name = band["name"]
    const bandCollection = await bands()
    const info = await bandCollection.deleteOne({_id:ObjectId(id)})
    if(info["deletedCount"]===0) throw "remove error: could not delete band"
    return `${name} has been successfully deleted!`
} 

async function update(id, name, genre, website, recordLabel, bandMembers, yearFormed) {
    let updatedBand = validation.validBand("update",name,genre,website,recordLabel,bandMembers,yearFormed)
    const bandCollection = await bands()
    const info = await bandCollection.updateOne(
        {_id: ObjectId(id)},
        {$set: updatedBand}
    )
    if(info["modifiedCount"]===0) throw "update error: band could not be updated"
    return await get(id)
}

module.exports = {
    create,
    getAll,
    get,
    remove,
    update
}