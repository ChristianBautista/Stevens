const axios = require('axios')

async function getPeople() {
    const {data} = await axios.get("https://gist.githubusercontent.com/graffixnyc/a1196cbf008e85a8e808dc60d4db7261/raw/9fd0d1a4d7846b19e52ab3551339c5b0b37cac71/people.json")
    return data
}

async function getPersonById(id) {
    if(!id)  throw "getPersonById error: No argument supplied. Please supply an id"
    if(typeof id !== 'string') throw "getPersonById error: Argument supplied is not a string"
    id = id.trim()
    if(!id.length) throw "getPersonById error: id is empty"
    const people = await getPeople()
    let i=0
    while(i<people.length && people[i]["id"]!==id) {
        i++   
    }
    if(i>=people.length) throw `getPersonById error: person (${id}) not found`
    return people[i]
}

async function sameEmail(emailDomain) {
    if(!emailDomain)  throw "sameEmail error: No argument supplied. Please supply an emailDomain"
    if(typeof emailDomain !== 'string') throw "sameEmail error: Argument supplied is not a string"
    emailDomain = emailDomain.trim()
    if(!emailDomain.length) throw "sameEmail error: emailDomain is empty"
    if(!emailDomain.includes('.')) throw `sameEmail error: invalid emailDomain (${emailDomain} does not have a period)`
    emailDomain = emailDomain.toLowerCase()
    let count = 0
    let i = emailDomain.length-1
    let letters = "abcdefghijklmnopqrstuvwxyz"
    while(i>=0 && emailDomain[i]!=='.') {
        if(letters.includes(emailDomain[i].toLowerCase())) {
            count++
        }
        i--
    }
    if(count<2) throw `sameEmail error: invalid emailDomain (${emailDomain} contains an invalid TLD)`
    const people = await getPeople()
    i=0
    count=0
    let matches = []
    let email = ""
    while(i<people.length) {
        email = people[i]["email"]
        email = email.trim()
        email = email.toLowerCase()
        email = email.substring(email.length-emailDomain.length)
        if(email===emailDomain) {
            matches[count] = people[i]
            count++
        }
        i++
    }
    if(count<2) throw `sameEmail error: ${emailDomain} is not associated with 2 or more people`
    return matches
}

async function manipulateIp() {
    const people = await getPeople()
    if(people.length<1) throw "manipulateIp error: No data"
    let min = 0 
    let max = 0
    let minFirst = ""
    let minLast = ""
    let maxFirst = ""
    let maxLast = ""
    let sum = 0
    let count = 0
    let ip = ""
    let ipFiltered = ""
    let ipSorted = 0
    let ipMin = 0
    let ipLength = 0
    let index = 0
    let initial  = true
    for(let i=0; i<people.length; i++) {
        ip = people[i]["ip_address"]
        ipFiltered = ""
        for(let j=0; j<ip.length; j++) {
            if(ip[j]!=='.' && ip[j]!=='0') {
                ipFiltered+=ip[j]
            }
        }
        // ip = ip.replaceAll('.','')
        // ip = ip.replaceAll('0','')
        if(!ipFiltered.length) {
            ipSorted = 0
        } else {
            ipSorted = ""
            ipLength = ipFiltered.length
            while(ipSorted.length<ipLength) {
                ipMin = ipFiltered[0]
                index = 0
                for(let k=1; k<ipFiltered.length; k++) {
                    if(parseInt(ipFiltered[k])<parseInt(ipMin)) {
                        ipMin = ipFiltered[k]
                        index = k
                    }
                }
                ipSorted+=ipMin.toString()
                ipFiltered = ipFiltered.substring(0,index) + ipFiltered.substring(index+1,ipFiltered.length)
            }
            ipSorted = parseInt(ipSorted)
        }
        if(initial) {
            min = ipSorted
            max = ipSorted
            minFirst = people[i]["first_name"]
            maxFirst = people[i]["first_name"]
            minLast = people[i]["last_name"]
            maxLast = people[i]["last_name"]
            initial = false
        } else {
            if(ipSorted<min) {
                min = ipSorted
                minFirst = people[i]["first_name"]
                minLast = people[i]["last_name"]
            }
            if(ipSorted>max) {
                max = ipSorted
                maxFirst = people[i]["first_name"]
                maxLast = people[i]["last_name"]
            }
        }
        sum+=ipSorted
        count++
    }
    let highObj = {"firstName":maxFirst,"lastName":maxLast}
    let lowObj = {"firstName":minFirst,"lastName":minLast}
    let retObj = {"highest":highObj,"lowest":lowObj,average:Math.floor(sum/count)}
    return retObj
}

async function sameBirthday(month, day) {
    if(!month) throw "sameBirthday error: No arguments supplied. Please supply a month and a day"
    if(!day) throw "sameBirthday error: day argument not supplied. Please supply BOTH a month and a day"
    month = parseInt(month)
    if(typeof month !== 'number' || isNaN(month)) throw "sameBirthday error: month is not a number"
    day = parseInt(day)
    if(typeof day !== 'number' || isNaN(day)) throw "sameBirthday error: day is not a number"
    if(month<1 || month>12) throw "sameBirthday error: Invalid month"
    let days = [0,31,28,31,30,31,30,31,31,30,31,30,31]
    if(day<1 || day>days[month]) throw `sameBirthday error: Invalid day (${day}) for month ${month}`
    const people = await getPeople()
    if(people.length<1) throw "sameBirthday error: No data"
    let names = []
    let index = 0
    let birthday = ""
    let m = 0
    let d = 0
    for(let i=0; i<people.length; i++) {
        birthday = people[i]["date_of_birth"]
        m = parseInt(birthday.substring(0,birthday.indexOf('/')))
        birthday = birthday.substring(birthday.indexOf('/')+1)
        d = parseInt(birthday.substring(0,birthday.indexOf('/')))
        if(m===month && d===day) {
            names[index] = people[i]["first_name"] + " " + people[i]["last_name"]
            index++
        }
    }
    if(!names.length) throw `sameBirthday error: Nobody has a birthday on ${month}/${day}`
    return names
}

module.exports = {
    getPersonById,
    sameEmail,
    manipulateIp,
    sameBirthday
}