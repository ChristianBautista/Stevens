function arrayCheck(array) {
    if(!array) throw "No argument supplied. Please supply an array"
    if(!Array.isArray(array)) throw "Argument supplied is not an array"
    if(!array.length) throw "array is empty"
    for(let i=0; i<array.length; i++) {
        if((typeof array[i] !== 'number') || isNaN(array[i])) {
            throw `Element ${i} of the array (${array[i]}) is not a number`
        }
    }
}

function mean(array) {
    arrayCheck(array)
    let sum = 0
    for(let i=0; i<array.length; i++) {
        sum+=array[i]
    }
    return sum/array.length
}

function medianSquared(array) {
    arrayCheck(array)
    array = array.sort()
    let median = 0
    if(array.length%2===1) {
        median = array[(array.length/2)-.5]
    } else {
        median = (array[(array.length/2)-1] + array[array.length/2])/2
    }
    return (median*median)
}

function maxElement(array) {
    arrayCheck(array)
    let max = array[0]
    let index = 0
    for(let i=1; i<array.length; i++) {
        if(array[i]>max) {
            max = array[i]
            index = i
        }
    }
    let retObj = {}
    retObj[max] = index
    return retObj
}

function fill(end, value) {
    if(!end && end!==0) throw "No argument supplied. Please supply an integer"
    if(typeof end !== 'number' || isNaN(end)) throw "end is not a number"
    if(end<=0) throw "end is not greater than 0"
    if(end%1 !== 0) throw "end is not a positive integer"
    let array = []
    for(let i=0; i<end; i++) {
        array[i] = !value ? i : value
    }
    return array
}

function countRepeating(array) {
    if(!array) throw "No argument supplied. Please supply an array"
    if(!Array.isArray(array)) throw "Argument supplied is not an array"
    let obj = new Object()
    if(!array.length || array.length===1) {
        return obj
    }
    let seen = []
    for(let i=0; i<array.length; i++) {
        seen[i] = false
    }
    for(let i=0; i<array.length-1; i++) {
        if(!seen[i]) {
            seen[i] = true
            let count = 1
            for(let j=i+1; j<array.length; j++) {
                if(!seen[j]) {
                    if(array[i]==array[j]) {
                        seen[j] = true
                        count++
                    }
                }
            }
            if(count>1) {
                obj[array[i]] = count
            }
        }   
    }
    return obj
}

function priority(e) {
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
    } else {
        return 6
    }
}

function shift(array, index) {
    let newArr = []
    let j = 0
    for(let i=0; i<=array.length; i++) {
        if(index!==i) {
            newArr[i] = array[j] 
            j++
        }
    }/*
    for(let i=array.length; i>=index; i--) {
        array[i+1] = array[i]
    }*/
    return newArr
}

function compareArray(array1, array2) {
    if(array1.length>array2.length) {
        return 1
    }
    if(array2.length>array1.length) {
        return 2
    }
    let l = array1.length
    let p = 0
    for(let i=0; i<l; i++) {
        if(priority(array1[i])===priority(array2[i])) {
            p = priority(array1[i])
            if(p>2) {
                if(p===3) {
                    if(array1[i]!==array2[i]) {
                        return e1[i] ? 1 : 2
                    }
                } else if(p===4 || p===5) {
                    if(array1[i]!==array2[i]) {
                        return (array1[i]>array2[i]) ? 1 : 2
                    }
                } else {
                    if(compareArray(array1[i], array2[i])>0) {
                        return compareArray(array1[i], array2[i])
                    }
                }
            }
        } else {
            return (priority(array1[i])>priority(array2[i])) ? 1 : 2
        }
    }
    return 0
}

function compare(e1, e2, p) {
    if(p===1 || p===2) {
        return false
    } else if(p===3) {
        return (!e2 && e1) ? true : false
    } else if(p===4 || p===5) {
        return (e1>e2) ? true : false
    } else {
        //arrays should have been sorted
        return (compareArray(e1,e2)===1) ? true : false
    }
}

//Order: null, undef, bool, num, str, arr
//objs and arrs are sorted by num of elements and then first elements
function sort(array) {
    let newArr = []
    if(!array.length) {
        return newArr
    } 
    if(array.length===1) {
        return array
    }
    newArr[0] = array[0]
    let index = 0
    for(let i=1; i<array.length; i++) {
        index = 0
        while(index<newArr.length && priority(array[i])>priority(newArr[index])) {
            index++
        }
        if(priority(array[i])===6) {
            array[i] = sort(array[i])
        }
        if(index<newArr.length) {
            while(priority(array[i])===priority(newArr[index]) && compare(array[i],newArr[index],priority(array[i]))) {
                index++
            }
            newArr = shift(newArr, index)
        }
        newArr[index] = array[i]
    }
    return newArr
}

function isEqual(arrayOne, arrayTwo) {
    if(!arrayOne) throw "arrayOne not supplied. Please supply an array"
    if(!Array.isArray(arrayOne)) throw "arrayOne argument supplied is not an array"
    if(!arrayTwo) throw "arrayTwo not supplied. Please supply an array"
    if(!Array.isArray(arrayTwo)) throw "arrayTwo argument supplied is not an array"
    if(!arrayOne.length && !arrayTwo.length) {
        return true
    }
    if(arrayOne.length!==arrayTwo.length) {
        return false
    }
    arrayOne = sort(arrayOne)
    arrayTwo = sort(arrayTwo)
    for(let i=0; i<arrayOne.length; i++) {
        if(priority(arrayOne[i])===priority(arrayTwo[i])) {
            if(priority(arrayOne[i])<=5) {
                if(arrayOne[i]!==arrayTwo[i]) {
                    return false
                }
            } else {
                if(!isEqual(arrayOne[i], arrayTwo[i])) {
                    return false
                }
            }
        } else {
            return false
        }
    }
    return true
}

module.exports = {
    mean,
    medianSquared,
    maxElement,
    fill,
    countRepeating,
    isEqual
}