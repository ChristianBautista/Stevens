const mongoCollections = require('../config/mongoCollections');
const bands = mongoCollections.bands;
const {ObjectId} = require('mongodb');

async function create(name, genre, website, recordLabel, bandMembers, yearFormed) {
    if(!name) throw new Error("create error: No arguments provided")
    if(!genre) throw new Error("create error: genre not provided")
    if(!website) throw new Error("create error: website not provided")
    if(!recordLabel) throw new Error("create error: recordLabel not provided")
    if(!bandMembers) throw new Error("create error: bandMembers not provided")
    if(!yearFormed) throw new Error("create error: yearFormed not provided")
    if(typeof name !== 'string') throw new Error("create error: name is not a string")
    if(!Array.isArray(genre)) throw new Error("create error: genre is not an array")
    if(typeof website !== 'string') throw new Error("create error: website is not a string")
    if(typeof recordLabel !== 'string') throw new Error("create error: recordLabel is not a string")
    if(!Array.isArray(bandMembers)) throw new Error("create error: bandMembers is not an array")
    if(typeof yearFormed !== 'number') throw new Error("create error: yearFormed is not a number")
    name = name.trim()
    if(!name.length) throw new Error("create error: name is empty")
    if(!genre.length) throw new Error("create error: genre is empty")
    let i = 0
    while(i<genre.length && !(!genre[i] || (typeof genre[i] !== 'string') || (!genre[i].trim().length))) {
        i++
    }
    if(i<genre.length) throw new Error(`create error: genre contains an invalid element at index ${i} (${genre[i]})`)
    website = website.trim()
    if(!website.length) throw new Error("create error: website is empty")
    website = website.toLowerCase()
    if((website.substring(0,11) !== "http://www.") || (website.substring(website.length-4) !== ".com") || ((website.length-15)<5)) throw new Error("create error: invalid website")
    recordLabel = recordLabel.trim()
    if(!recordLabel.length) throw new Error("create error: recordLabel is empty")
    i = 0
    if(!bandMembers.length) throw new Error("create error: bandMembers is empty")
    while(i<bandMembers.length && !(!bandMembers[i] || (typeof bandMembers[i] !== 'string') || (!bandMembers[i].trim().length))) {
        i++
    }
    if(i<bandMembers.length) throw new Error(`create error: bandMembers contains an invalid element at index ${i} (${bandMembers[i]})`)
    if(yearFormed<1900 || yearFormed>2022) throw new Error("create error: invalid year")
    
    const bandCollection = await bands()
    let newBand = {
        "name": name,
        "genre": genre,
        "website": website,
        "recordLabel": recordLabel,
        "bandMembers": bandMembers,
        "yearFormed": yearFormed
    }
    const insertInfo = await bandCollection.insertOne(newBand)
    if(!insertInfo["acknowledged"] || !insertInfo["insertedId"]) throw new Error("create error: band was not inserted")
    const id = insertInfo["insertedId"].toString()
    const band = await get(id)
    return band
}

async function getAll() {
    const bandCollection = await bands()
    const bandList = await bandCollection.find().toArray()
    if(!bandList) throw new Error("getAll error: could not get all bands")
    bandList.map(x => x["_id"] = x["_id"].toString())
    return bandList
}

async function get(id) {
    if(!id) throw new Error("get error: No argument provided")
    if(typeof id !== 'string') throw new Error("get error: id is not a string")
    id = id.trim()
    if(!id.length) throw new Error("get error: id is empty")
    if(!ObjectId.isValid(id)) throw new Error("get error: invalid id")
    const bandCollection = await bands()
    const band = await bandCollection.findOne({_id: ObjectId(id)})
    if(band===null) throw new Error("get error: no band has that id")
    band["_id"] = band["_id"].toString()
    return band
}

async function remove(id) {
    if(!id) throw new Error("remove error: No argument provided")
    if(typeof id !== 'string') throw new Error("remove error: id is not a string")
    id = id.trim()
    if(!id.length) throw new Error("remove error: id is empty")
    if(!ObjectId.isValid(id)) throw new Error("remove error: invalid id")
    let band = await get(id)
    let name = band["name"]
    const bandCollection = await bands()
    const info = await bandCollection.deleteOne({_id:ObjectId(id)})
    if(info["deletedCount"]===0) throw new Error("remove error: could not delete band")
    return `${name} has been successfully deleted!`
}

async function rename(id, newName) {
    if(!id) throw new Error("rename error: No arguments provided")
    if(!newName) throw new Error("rename error: newName not provided")
    if(typeof id !== 'string') throw new Error("rename error: id is not a string")
    if(typeof newName !== 'string') throw new Error("rename error: newName is not a string")
    id = id.trim()
    if(!id.length) throw new Error("rename error: id is empty")
    newName = newName.trim()
    if(!newName.length) throw new Error("rename error: newName is empty")
    if(!ObjectId.isValid(id)) throw new Error("rename error: invalid id")
    let band = await get(id)
    if(band["name"]===newName) throw new Error("rename error: newName is the same as the current name") 
    const bandCollection = await bands()
    let newBand = {"name": newName}
    const info = await bandCollection.updateOne(
        {_id: ObjectId(id)},
        {$set: newBand}
    )
    if(info["modifiedCount"]===0) throw new Error("rename error: band could not be updated")
    return await get(id)
}

module.exports = {
    create,
    getAll,
    get,
    remove,
    rename
}