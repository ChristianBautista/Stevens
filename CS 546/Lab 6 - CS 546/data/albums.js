const mongoCollections = require('../config/mongoCollections')
const bands = mongoCollections.bands
const {ObjectId} = require('mongodb')
const validation = require('../validation')

async function create(bandId, title, releaseDate, tracks, rating) {
    let album = validation.validAlbum("create",bandId,title,releaseDate,tracks,rating)
    bandId = album["bandId"]
    delete album["bandId"]
    album["_id"] = new ObjectId()
    const bandCollection = await bands()
    let band = await bandCollection.findOne({_id: ObjectId(bandId)})
    if(band===null) throw "create error: no band has that id"
    band["albums"].push(album)
    let updatedBand = {
        "albums": band["albums"],
        "overallRating": Number((((band["overallRating"]*(band["albums"].length-1))+rating)/band["albums"].length).toFixed(1))
    }
    const info = await bandCollection.updateOne(
        {_id: ObjectId(bandId)},
        {$set: updatedBand}
    )
    if(info["modifiedCount"]===0) throw "create error: album could not be inserted"
    album["_id"] = album["_id"].toString()
    return album
}

async function getAll(bandId) {
    bandId = validation.validId("getAll",bandId)

    const bandCollection = await bands()
    const band = await bandCollection.findOne({_id: ObjectId(bandId)})
    if(band===null) throw "getAll error: no band has that id"
    band["albums"].map(x => x["_id"] = x["_id"].toString())
    return band["albums"]
}

async function get(albumId) {
    albumId = validation.validId("get",albumId)

    const bandCollection = await bands()
    const band = await bandCollection.findOne({'albums._id': ObjectId(albumId)},{"albums.$": 1})
    if(band===null) throw "get error: no album has that id"
    let album = band["albums"].filter(x => x["_id"].toString()===albumId)
    album = album[0]
    album["_id"] = album["_id"].toString()
    return album
}

async function remove(albumId) {
    albumId = validation.validId("get",albumId)

    const bandCollection = await bands()
    let band = await bandCollection.findOne({'albums._id': ObjectId(albumId)})
    if(band===null) throw "remove error: no album has that id"
    let album = band["albums"].filter(x => x["_id"].toString()===albumId)
    album = album[0]
    let bandId = band["_id"].toString()
    let rating = Number((((band["overallRating"]*band["albums"].length)-album["rating"])/(band["albums"].length-1)).toFixed(1))
    let updatedBand = {
        "albums": band["albums"].filter(x => x["_id"].toString()!==albumId),
        "overallRating": rating
    }
    const info = await bandCollection.updateOne(
        {_id: ObjectId(band["_id"])},
        {$set: updatedBand}
    )
    if(info["modifiedCount"]===0) throw "remove error: album could not be removed"
    band = await bandCollection.findOne({_id: ObjectId(bandId)})
    if(band===null) throw "remove error: no band has that id"
    return band
}

module.exports = {
    create,
    getAll,
    get,
    remove
}