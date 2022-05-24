const { isEqual } = require("./arrayUtils")

function makeArrays(objects) {
    if(!objects) throw "No argument supplied. Please supply an array of objects"
    if(!Array.isArray(objects)) throw "Argument supplied is not an array"
    if(!objects.length) throw "array is empty"
    if(objects.length<2) throw "array does not have at least 2 objects"
    for(let i=0; i<objects.length; i++) {
        if(typeof objects[i] !== 'object') throw `Element ${i} of the array (${objects[i]}) is not an object`
        if(Object.keys(objects[i]).length===0) throw `Object ${i} of the array is empty`
    }
    let newArr = []
    let keys = []
    let index = 0
    for(let i=0; i<objects.length; i++) {
        keys = Object.keys(objects[i])
        for(let j=0; j<keys.length; j++) {
            let kv = [keys[j], objects[i][keys[j]]]
            newArr[index] = kv
            index++
        }
    }
    return newArr
}

//Order: null, undef, bool, num, str, arr, obj
function type(e) {
    if(e===null) {
        return 1
    } else if(e===undefined) {
        return 2
    } else if(typeof e === 'boolean') {
        return 3
    } else if(typeof e === 'number') {
        return 4
    } else if(typeof e === 'string') {
        return 5
    } else if(Array.isArray(e)) {
        return 6
    } else {
        return 7
    }
}

function equals(e1, e2, t) {
    if(t===1 || t===2) {
        return true
    } else if(t<6) {
        return (e1===e2) ? true : false
    } else if(t===6) {
        //import isEqual function for arrays
        return isEqual(e1,e2)
    } else {
        return isDeepEqual(e1,e2)
    }
}

function isDeepEqual(obj1, obj2) {
    if(!obj1) throw "No argument supplied. Please supply 2 objects"
    if(!obj2) throw "obj2 argument not supplied. Please supply 2 objects"
    if(typeof obj1 !== 'object') throw "obj1 argument supplied is not an object"
    if(typeof obj2 !== 'object') throw "obj2 argument supplied is not an object"
    let keys1 = Object.keys(obj1).sort()
    let keys2 = Object.keys(obj2).sort()
    if(keys1.length!==keys2.length) {
        return false
    }
    if(keys1.length===keys2.length===0) {
        return true
    }
    let l = keys1.length
    for(let i=0; i<l; i++) {
        if(keys1[l]!==keys2[l]) {
            return false
        }
    }
    let t = 0
    for(let i=0; i<l; i++) {
        if(type(obj1[keys1[i]])===type(obj2[keys2[i]])) {
            t = type(obj1[keys1[i]])
            if(!equals(obj1[keys1[i]],obj2[keys2[i]],t)) {
                return false
            }
        } else {
            return false
        }
    }
    return true
}

function computeObject(object, func) {
    if(!object) throw "No argument supplied. Please supply an object and function"
    if(!func) throw "func argument not supplied. Please supply an object and function"
    if(typeof object !== 'object') throw "object argument supplied is not an object"
    if(typeof func !== 'function') throw "function argument supplied is not a function"
    let keys = Object.keys(object)
    for(let i=0; i<keys.length; i++) {
        if(typeof object[keys[i]] !== 'number' || isNaN(object[keys[i]])) throw `Value ${object[keys[i]]} for key ${keys[i]} is not a number`
    }
    let newObj = {}
    for(let i=0; i<keys.length; i++) {
        newObj[keys[i]] = func(object[keys[i]])
    }
    return newObj
}

module.exports = {
    makeArrays,
    isDeepEqual,
    computeObject
}