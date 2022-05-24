const {ObjectId} = require('mongodb')

function validBand(fn, name, genre, website, recordLabel, bandMembers, yearFormed) {
    if(!name) throw `${fn} error: name not provided`
    if(!genre) throw `${fn} error: genre not provided`
    if(!website) throw `${fn} error: website not provided`
    if(!recordLabel) throw `${fn} error: recordLabel not provided`
    if(!bandMembers) throw `${fn} error: bandMembers not provided`
    if(!yearFormed) throw `${fn} error: yearFormed not provided`
    if(typeof name !== 'string') throw `${fn} error: name is not a string`
    if(!Array.isArray(genre)) throw `${fn} error: genre is not an array`
    if(typeof website !== 'string') throw `${fn} error: website is not a string`
    if(typeof recordLabel !== 'string') throw `${fn} error: recordLabel is not a string`
    if(!Array.isArray(bandMembers)) throw `${fn} error: bandMembers is not an array`
    if(typeof yearFormed !== 'number') throw `${fn} error: yearFormed is not a number`
    name = name.trim()
    if(!name.length) throw `${fn} error: name is empty`
    if(!genre.length) throw `${fn} error: genre is empty`
    let i = 0
    while(i<genre.length && !(!genre[i] || (typeof genre[i] !== 'string') || (!genre[i].trim().length))) {
        genre[i] = genre[i].trim()
        i++
    }
    if(i<genre.length) throw `${fn} error: genre contains an invalid element at index ${i} (${genre[i]})`
    website = website.trim()
    if(!website.length) throw `${fn} error: website is empty`
    website = website.toLowerCase()
    if((website.substring(0,11) !== "http://www.") || (website.substring(website.length-4) !== ".com") || ((website.length-15)<5)) throw `${fn} error: invalid website`
    recordLabel = recordLabel.trim()
    if(!recordLabel.length) throw `${fn} error: recordLabel is empty`
    i = 0
    if(!bandMembers.length) throw `${fn} error: bandMembers is empty`
    while(i<bandMembers.length && !(!bandMembers[i] || (typeof bandMembers[i] !== 'string') || (!bandMembers[i].trim().length))) {
        bandMembers[i] = bandMembers[i].trim()
        i++
    }
    if(i<bandMembers.length) throw `${fn} error: bandMembers contains an invalid element at index ${i} (${bandMembers[i]})`
    if(yearFormed<1900 || yearFormed>2022) throw `${fn} error: invalid year`
    
    let band = {
        "name": name,
        "genre": genre,
        "website": website,
        "recordLabel": recordLabel,
        "bandMembers": bandMembers,
        "yearFormed": yearFormed
    }
    return band
}

function validId(fn, id) {
    if(!id) throw `${fn} error: No argument provided`
    if(typeof id !== 'string') throw `${fn} error: id is not a string`
    id = id.trim()
    if(!id.length) throw `${fn} error: id is empty`
    if(!ObjectId.isValid(id)) throw `${fn} error: invalid id`
    return id
}

function validAlbum(fn, bandId, title, releaseDate, tracks, rating) {
    if(!bandId) throw `${fn} error: bandId not provided`
    if(!title) throw `${fn} error: title not provided`
    if(!releaseDate) throw `${fn} error: releaseDate not provided`
    if(!tracks) throw `${fn} error: tracks not provided`
    if(!rating) throw `${fn} error: rating not provided`
    if(typeof bandId !== 'string') throw `${fn} error: bandId is not a string`
    if(typeof title !== 'string') throw `${fn} error: title is not a string`
    if(typeof releaseDate !== 'string') throw `${fn} error: releaseDate is not a string`
    if(!Array.isArray(tracks)) throw `${fn} error: tracks is not an array`
    if(typeof rating !== 'number') throw `${fn} error: rating is not a number`
    bandId = bandId.trim()
    if(!bandId.length) throw `${fn} error: bandId is empty`
    if(!ObjectId.isValid(bandId)) throw `${fn} error: invalid bandId`
    title = title.trim()
    if(!title.length) throw `${fn} error: title is empty`
    releaseDate = releaseDate.trim()
    if(!releaseDate.length) throw `${fn} error: releaseDate is empty`
    if(releaseDate.length!==10 || releaseDate[2]!=="/" || releaseDate[5]!=="/") throw `${fn} error: invalid releaseDate`
    let m = Number(releaseDate.substring(0,2))
    if(typeof m !== 'number' || isNaN(m) || m<1 || m>12) throw `${fn} error: invalid month in releaseDate`
    let d = Number(releaseDate.substring(3,5))
    let days = [0,31,28,31,30,31,30,31,31,30,31,30,31]
    if(typeof d !== 'number' || isNaN(d) || d<1 || d>days[m]) throw `${fn} error: invalid day in releaseDate`
    let y = Number(releaseDate.substring(6))
    if(typeof y !== 'number' || isNaN(y) || y<1900 || y>2023) throw `${fn} error: invalid year in releaseDate`
    if(!tracks.length) throw `${fn} error: tracks is empty`
    if(tracks.length<3) throw `${fn} error: tracks has less than 3 tracks`
    let i = 0
    while(i<tracks.length && !(!tracks[i] || (typeof tracks[i] !== 'string') || (!tracks[i].trim().length))) {
        tracks[i] = tracks[i].trim()
        i++
    }
    if(i<tracks.length) throw `${fn} error: tracks contains an invalid element at index ${i} (${tracks[i]})`
    if(rating<1 || rating>5) throw `${fn} error: invalid rating`
    rating = Number(rating.toFixed(1))

    let album = {
        "bandId": bandId,
        "title": title,
        "releaseDate": releaseDate,
        "tracks": tracks,
        "rating": rating
    }
    return album
}

module.exports = {
    validBand,
    validId,
    validAlbum
}