const axios = require('axios')

async function getPeople() {
    const {data} = await axios.get("https://gist.githubusercontent.com/graffixnyc/31e9ef8b7d7caa742f56dc5f5649a57f/raw/43356c676c2cdc81f81ca77b2b7f7c5105b53d7f/people.json")
    return data
}

async function getWork() {
    const {data} = await axios.get("https://gist.githubusercontent.com/graffixnyc/febcdd2ca91ddc685c163158ee126b4f/raw/c9494f59261f655a24019d3b94dab4db9346da6e/work.json")
    return data
}

async function getPersonById(id) {
    if(!id) throw "getPersonById error: No id given"
    id = Number(id)
    if(typeof id !== 'number' || isNaN(id) || id<0) throw "getPersonById error: id not valid"
    const people = await getPeople()
    let i=0
    while(i<people.length && people[i]["id"]!==id) {
        i++   
    }
    if(i>=people.length) throw `getPersonById error: person (${id}) not found`
    return people[i]
}

async function getWorkById(id) {
    if(!id) throw "getWorkById error: No id given"
    id = Number(id)
    if(typeof id !== 'number' || isNaN(id) || id<0) throw "getWorkById error: id not valid"
    const work = await getWork()
    let i=0
    while(i<work.length && work[i]["id"]!==id) {
        i++   
    }
    if(i>=work.length) throw `getWorkById error: work (${id}) not found`
    return work[i]
}

module.exports = {
    getPeople,
    getWork,
    getPersonById,
    getWorkById
}