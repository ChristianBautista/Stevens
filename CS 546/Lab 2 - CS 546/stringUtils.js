function stringCheck(string) {
    if(!string) throw "No argument supplied. Please supply a string"
    if(typeof string !== 'string') throw "Argument supplied is not a string"
    string = string.trim()
    if(!string.length) throw "string is empty"
}

//TODO: function to check if something is a letter
/*
function isLetter(char) {
    let letters = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    for(let i=0; i<26; i++) {
        if(char.toLowerCase()===letters[i]) {
            return true
        }
    }
    return false
}
*/

function camelCase(string) {
    stringCheck(string)
    string = string.trim()
    let result = ""
    let word = ""
    let first = ""
    let initial = true
    let empty = false
    while(!empty) {
        if(string.indexOf(" ")!==-1) {
            word = string.substring(0,string.indexOf(" "))
            string = string.substring(string.indexOf(" ")+1).trim()
        } else {
            word = string
            empty = true
        }
        if(!initial) {
            first = word[0].toUpperCase()
            result+=first
            result+=word.substring(1)
        } else {
            initial = false
            first = word[0].toLowerCase()
            result+=first
            result+=word.substring(1)
        }
    }
    return result
    /*
    let capital = false
    let initial = true
    for(let i=0; i<string.length; i++) {
        if(string[i]===' ') {
            capital = true
        } else if(isLetter(string[i])) {
            if(capital && !initial) {
                capital = false
                result+=string[i].toUpperCase()
            } else {
                if(initial) {
                    initial = false
                    capital = false
                }
                result+=string[i].toLowerCase()
            }
        } else {
            result+=string[i]
        }
    }
    return result
    */
}

function replaceChar(string) {
    stringCheck(string)
    string = string.trim()
    let c = string[0].toLowerCase()
    let result = ""
    let alt = false //false = *; true  = $
    for(let i=0; i<string.length; i++) {
        if(string[i]===c) {
            result += alt ? "$" : "*"
            alt = !alt
        } else {
            result+=string[i]
        }
    }
    return result
}

//Determine whether to keep whitespaces or not (in beginning and end)
function mashUp(string1, string2) {
    if(!string1) throw "string1 argument not supplied. Please supply a string"
    if(typeof string1 !== 'string') throw "string1 is not a string"
    if(!string2) throw "string2 argument not supplied. Please supply a string"
    if(typeof string2 !== 'string') throw "string2 is not a string"
    string1 = string1.trim()
    string2 = string2.trim()
    if(string1.length<2) {
        throw "string1 does not contain at least 2 non-whitespace characters"
    }
    if(string2.length<2) {
        throw "string2 does not contain at least 2 non-whitespace characters"
    }
    let s1First = string1.substring(0,2)
    let s2First = string2.substring(0,2)
    let result = s2First + string1.substring(2) + " " + s1First + string2.substring(2)
    return result
}

module.exports = {
    camelCase,
    replaceChar,
    mashUp
}