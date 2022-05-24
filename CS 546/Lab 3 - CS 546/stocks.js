const axios = require('axios')
const { getPersonById } = require('./people')

async function getPeople() {
    const {data} = await axios.get("https://gist.githubusercontent.com/graffixnyc/a1196cbf008e85a8e808dc60d4db7261/raw/9fd0d1a4d7846b19e52ab3551339c5b0b37cac71/people.json")
    return data
}
async function getStocks() {
    const {data} = await axios.get("https://gist.githubusercontent.com/graffixnyc/8c363d85e61863ac044097c0d199dbcc/raw/7d79752a9342ac97e4953bce23db0388a39642bf/stocks.json")
    return data
}

async function listShareholders(stockName) {
    if(!stockName) throw "listShareholders error: No argument supplied. Please supply a stockName"
    if(typeof stockName !== 'string') throw "listShareholders error: Argument supplied is not a string"
    stockName = stockName.trim()
    if(!stockName.length) throw "listShareholders error: stockName is empty"
    const stocks = await getStocks()
    let i=0
    let found = false
    let stock = {}
    while(i<stocks.length && !found) {
        stock = stocks[i]
        if(stock["stock_name"].toLowerCase()===stockName.toLowerCase()) {
            found = true
        } else {
            i++
        }
    }
    if(i>=stocks.length) throw `listShareholders error: stock (${stockName}) not found`
    let shareholders = []
    let person = {}
    for(i=0; i<stock["shareholders"].length; i++) {
        person = await getPersonById(stock["shareholders"][i]["userId"])
        shareholders[i] = {"first_name":person["first_name"],"last_name":person["last_name"],"number_of_shares":stock["shareholders"][i]["number_of_shares"]}
    }
    let retObj = {"id":stock["id"],"stock_name":stock["stock_name"],"shareholders":shareholders}
    return retObj
}

async function totalShares(stockName) {
    if(!stockName) throw "totalShares error: No argument supplied. Please supply a stockName"
    if(typeof stockName !== 'string') throw "totalShares error: Argument supplied is not a string"
    stockName = stockName.trim()
    if(!stockName.length) throw "totalShares error: stockName is empty"
    const stocks = await getStocks()
    let i=0
    let found = false
    let stock = {}
    while(i<stocks.length && !found) {
        stock = stocks[i]
        if(stock["stock_name"].toLowerCase()===stockName.toLowerCase()) {
            found = true
        } else {
            i++
        }
    }
    if(i>=stocks.length) throw `totalShares error: stock (${stockName} not found)`
    let sum = 0
    if(!stock["shareholders"].length) return `${stock["stock_name"]} currently has no shareholders`
    for(i=0; i<stock["shareholders"].length; i++) {
        sum+=stock["shareholders"][i]["number_of_shares"]
    }
    let sho = (stock["shareholders"].length===1) ? "shareholder that owns" : "shareholders that own"
    let s = (sum===1) ? "share" : "shares"
    return `${stock["stock_name"]}, has ${stock["shareholders"].length} ${sho} a total of ${sum} ${s}`
}

async function listStocks(firstName, lastName) {
    if(!firstName) throw "listStocks error: No argument supplied. Please supply a firstName and a lastName"
    if(!lastName) throw "listStocks error: lastName argument not supplied. Please supply a firstName and a lastName"
    if(typeof firstName !== 'string') throw "listStocks error: firstName is not a string"
    if(typeof lastName !== 'string') throw "listStocks error: lastName is not a string"
    firstName = firstName.trim()
    if(!firstName.length) throw "listStocks error: firstName is empty"
    lastName = lastName.trim()
    if(!lastName.length) throw "listStocks error: lastName is empty"
    const people = await getPeople()
    let i=0
    let exists = false
    while(i<people.length && !exists) {
        if(people[i]["first_name"]===firstName && people[i]["last_name"]===lastName) {
            exists = true
        } else {
            i++
        }
    }
    if(!exists) throw `listStocks error: person (${firstName} ${lastName}) not found`
    let id = people[i]["id"]
    const stocks = await getStocks()
    let stockList = []
    let index = 0
    let sum = 0
    for(i=0; i<stocks.length; i++) {
        sum = 0
        for(let j=0; j<stocks[i]["shareholders"].length; j++) {
            if(id===stocks[i]["shareholders"][j]["userId"]) {
                sum+=stocks[i]["shareholders"][j]["number_of_shares"]
            }
        }
        if(sum>0) {
            stockList[index] = {"stock_name":stocks[i]["stock_name"],"number_of_shares":sum}
            index++
        }
    }
    if(index<1) throw `listStocks error: ${firstName} ${lastName} does not own any stocks`
    return stockList
}

async function getStockById(id) {
    if(!id)  throw "getStockById error: No argument supplied. Please supply an id"
    if(typeof id !== 'string') throw "getStockById error: Argument supplied is not a string"
    id = id.trim()
    if(!id.length) throw "getStockById error: id is empty"
    const stocks = await getStocks()
    let i=0
    while(i<stocks.length && stocks[i]["id"]!==id) {
        i++   
    }
    if(i>=stocks.length) throw `getStockById error: stock (${id}) not found`
    return stocks[i]
}

module.exports = {
    listShareholders,
    totalShares,
    listStocks,
    getStockById
}