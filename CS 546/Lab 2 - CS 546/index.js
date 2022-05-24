const arrayUtils = require('./arrayUtils')
const stringUtils = require('./stringUtils')
const objUtils = require('./objUtils')

//arrayUtils functional testing
/**Testing format:
 * 1. No arg
 * 2. Not array arg (num)
 * 3. Not array arg (str)
 * 4. Empty array
 * 5. Array with non-numbers
 * 6. Array with mixed numbers and non-numbers
 * 7. Array with numbers and NaN
 * 8. Small Input
 * 9. Large Input
 */

//mean
try {
    console.log(arrayUtils.mean())
} catch(e) {
    console.log("mean error: "+e)
}
try {
    console.log(arrayUtils.mean(123))
} catch(e) {
    console.log("mean error: "+e)
}
try {
    console.log(arrayUtils.mean("test"))
} catch(e) {
    console.log("mean error: "+e)
}
try {
    console.log(arrayUtils.mean([]))
} catch(e) {
    console.log("mean error: "+e)
}
try {
    console.log(arrayUtils.mean(["A","B","C"]))
} catch(e) {
    console.log("mean error: "+e)
}
try {
    console.log(arrayUtils.mean([1,2,3,"A","B","C"]))
} catch(e) {
    console.log("mean error: "+e)
}
try {
    console.log(arrayUtils.mean([1,2,3,NaN]))
} catch(e) {
    console.log("mean error: "+e)
}
try {
    console.log(arrayUtils.mean([1,2,3,4,5]))
} catch(e) {
    console.log("mean error: "+e)
}
try {
    console.log(arrayUtils.mean([137,829,725,265,356,527,677,874,352,491]))
} catch(e) {
    console.log("mean error: "+e)
}

//medianSquared
try {
    console.log(arrayUtils.medianSquared())
} catch(e) {
    console.log("medianSquared error: "+e)
}
try {
    console.log(arrayUtils.medianSquared(123))
} catch(e) {
    console.log("medianSquared error: "+e)
}
try {
    console.log(arrayUtils.medianSquared("test"))
} catch(e) {
    console.log("medianSquared error: "+e)
}
try {
    console.log(arrayUtils.medianSquared([]))
} catch(e) {
    console.log("medianSquared error: "+e)
}
try {
    console.log(arrayUtils.medianSquared(["A","B","C"]))
} catch(e) {
    console.log("medianSquared error: "+e)
}
try {
    console.log(arrayUtils.medianSquared([1,2,3,"A","B","C"]))
} catch(e) {
    console.log("medianSquared error: "+e)
}
try {
    console.log(arrayUtils.medianSquared([1,2,3,NaN]))
} catch(e) {
    console.log("medianSquared error: "+e)
}
try {
    console.log(arrayUtils.medianSquared([1,2,3,4,5]))
} catch(e) {
    console.log("medianSquared error: "+e)
}
try {
    console.log(arrayUtils.medianSquared([3,2,5,1,4]))
} catch(e) {
    console.log("medianSquared error: "+e)
}
try {
    console.log(arrayUtils.medianSquared([137,829,725,265,356,527,677,874,352,491]))
} catch(e) {
    console.log("medianSquared error: "+e)
}

//maxElement
try {
    console.log(arrayUtils.maxElement())
} catch(e) {
    console.log("maxElement error: "+e)
}
try {
    console.log(arrayUtils.maxElement(123))
} catch(e) {
    console.log("maxElement error: "+e)
}
try {
    console.log(arrayUtils.maxElement("test"))
} catch(e) {
    console.log("maxElement error: "+e)
}
try {
    console.log(arrayUtils.maxElement([]))
} catch(e) {
    console.log("maxElement error: "+e)
}
try {
    console.log(arrayUtils.maxElement(["A","B","C"]))
} catch(e) {
    console.log("maxElement error: "+e)
}
try {
    console.log(arrayUtils.maxElement([1,2,3,"A","B","C"]))
} catch(e) {
    console.log("maxElement error: "+e)
}
try {
    console.log(arrayUtils.maxElement([1,2,3,NaN]))
} catch(e) {
    console.log("maxElement error: "+e)
}
try {
    console.log(arrayUtils.maxElement([1,2,3,4,5]))
} catch(e) {
    console.log("maxElement error: "+e)
}
try {
    console.log(arrayUtils.maxElement([3,2,5,1,4]))
} catch(e) {
    console.log("maxElement error: "+e)
}
try {
    console.log(arrayUtils.maxElement([137,829,725,265,356,527,677,874,352,491]))
} catch(e) {
    console.log("maxElement error: "+e)
}

//fill
try {
    console.log(arrayUtils.fill())
} catch(e) {
    console.log("fill error: "+e)
}
try {
    console.log(arrayUtils.fill(true))
} catch(e) {
    console.log("fill error: "+e)
}
try {
    console.log(arrayUtils.fill("test"))
} catch(e) {
    console.log("fill error: "+e)
}
try {
    console.log(arrayUtils.fill(-5))
} catch(e) {
    console.log("fill error: "+e)
}
try {
    console.log(arrayUtils.fill(0))
} catch(e) {
    console.log("fill error: "+e)
}
try {
    console.log(arrayUtils.fill(2.5))
} catch(e) {
    console.log("fill error: "+e)
}
try {
    console.log(arrayUtils.fill(1))
} catch(e) {
    console.log("fill error: "+e)
}
try {
    console.log(arrayUtils.fill(20))
} catch(e) {
    console.log("fill error: "+e)
}
try {
    console.log(arrayUtils.fill(1,"test"))
} catch(e) {
    console.log("fill error: "+e)
}
try {
    console.log(arrayUtils.fill(20,"test"))
} catch(e) {
    console.log("fill error: "+e)
}

//countRepeating
try {
    console.log(arrayUtils.countRepeating())
} catch(e) {
    console.log("countRepeating error: "+e)
}
try {
    console.log(arrayUtils.countRepeating(123))
} catch(e) {
    console.log("countRepeating error: "+e)
}
try {
    console.log(arrayUtils.countRepeating("test"))
} catch(e) {
    console.log("countRepeating error: "+e)
}
try {
    console.log(arrayUtils.countRepeating([]))
} catch(e) {
    console.log("countRepeating error: "+e)
}
try {
    console.log(arrayUtils.countRepeating([1,2,3,4,5]))
} catch(e) {
    console.log("countRepeating error: "+e)
}
try {
    console.log(arrayUtils.countRepeating(["A","B","C","D","E"]))
} catch(e) {
    console.log("countRepeating error: "+e)
}
try {
    console.log(arrayUtils.countRepeating([1,2,2,3,3,3,4,4,4,4,5,5,5,5,5]))
} catch(e) {
    console.log("countRepeating error: "+e)
}
try {
    console.log(arrayUtils.countRepeating([2,5,1,5,5,3,2,4,3,4,4,3,5,5,4]))
} catch(e) {
    console.log("countRepeating error: "+e)
}
try {
    console.log(arrayUtils.countRepeating([2,'5',1,5,'5','3',2,4,3,'4',4,3,'5',5,4]))
} catch(e) {
    console.log("countRepeating error: "+e)
}
try {
    console.log(arrayUtils.countRepeating(['F','F','E',3,'F','F','3',1,2,'F','D','2','D','D','E','E','F','E',3,'E','D']))
} catch(e) {
    console.log("countRepeating error: "+e)
}
try {
    console.log(arrayUtils.countRepeating([7, '7', 13, true, true, true, "Hello","Hello", "hello"]))
} catch(e) {
    console.log("countRepeating error: "+e)
}

//isEqual
try {
    console.log(arrayUtils.isEqual())
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual(123))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual("test"))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual(123,123))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual("test","test"))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([]))
} catch(e) {
    console.log("isEqual error: "+e)
}
//Return values start here
try {
    console.log(arrayUtils.isEqual([],[]))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([null, null],[null, null]))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([null, null],[null, undefined]))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([null, undefined],[undefined, null]))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([false, true, false],[true, false, false]))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([null, null, null, null, undefined, undefined, undefined, false, false, false, true],[undefined, null, null, false, undefined, false, false, null, null, true, undefined]))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([1, 2, 3], [3, 1, 2]))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([ 'Z', 'R', 'B', 'C', 'A' ], ['R', 'B', 'C', 'A', 'Z']))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([1, 2, 3], [4, 5, 6]))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([1, 3, 2], [1, 2, 3, 4]))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([1, 2], [1, 2, 3]))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([[ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ]], [[ 3, 1, 2 ], [ 5, 4, 6 ], [ 9, 7, 8 ]]))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([[ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ]], [[ 3, 1, 2 ], [ 5, 4, 11 ], [ 9, 7, 8 ]]))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([null, null, undefined, false, false, true, 1, 2, 3, 4, 5, "A", "B", "C", "D"],["B", 4, 2, true, null, "C", null, 1, 3, "D", false, 5, false, "A", undefined]))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([null, null, undefined, false, false, true, 1, 2, 3, 4, 5, "A", "B", "C", "D"],["B", 4, 2, true, null, "C", null, 1, 4, "D", false, 5, false, "A", undefined]))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([null, [undefined, false, false], false, true, [false, null, 1, 2, "A"], 3, 4, "B", [[null, undefined, 1, 2, 3], false, true, "E", "F", 5]], [null, [undefined, false, false], false, true, [false, null, 1, 2, "A"], 3, 4, "B", [[null, undefined, 1, 2, 3], false, true, "E", "F", 5]]))
} catch(e) {
    console.log("isEqual error: "+e)
}
try {
    console.log(arrayUtils.isEqual([null, [undefined, false, false], false, true, [false, null, 1, 2, "A"], 3, 4, "B", [[null, undefined, 1, 2, 3], false, true, "E", "F", 5]], [null, [undefined, false, false], false, true, [false, null, 1, 2, "A"], 3, 4, "B", [[null, undefined, 1, 2, 4], false, true, "E", "F", 5]]))
} catch(e) {
    console.log("isEqual error: "+e)
}

//stringUtils functional testing
/**Testing format:
 * 1. No arg
 * 2. Not string arg (num)
 * 3. Not string arg (array)
 * 4. Empty string
 * 5. Whitespace string
 * 6. Short string
 * 7. Long string
 * 8. Short string with special characters
 * 9. Long string with special characters
 */

//camelCase
try {
    console.log(stringUtils.camelCase())
} catch(e) {
    console.log("camelCase error: "+e)
}
try {
    console.log(stringUtils.camelCase(123))
} catch(e) {
    console.log("camelCase error: "+e)
}
try {
    console.log(stringUtils.camelCase(["test"]))
} catch(e) {
    console.log("camelCase error: "+e)
}
try {
    console.log(stringUtils.camelCase(""))
} catch(e) {
    console.log("camelCase error: "+e)
}
try {
    console.log(stringUtils.camelCase("   "))
} catch(e) {
    console.log("camelCase error: "+e)
}
try {
    console.log(stringUtils.camelCase("test test"))
} catch(e) {
    console.log("camelCase error: "+e)
}
try {
    console.log(stringUtils.camelCase("Mary had a little lamb"))
} catch(e) {
    console.log("camelCase error: "+e)
}
try {
    console.log(stringUtils.camelCase("test $%test"))
} catch(e) {
    console.log("camelCase error: "+e)
}
try {
    console.log(stringUtils.camelCase("Mary &^had #a little lamb"))
} catch(e) {
    console.log("camelCase error: "+e)
}

//replaceChar
try {
    console.log(stringUtils.replaceChar())
} catch(e) {
    console.log("replaceChar error: "+e)
}
try {
    console.log(stringUtils.replaceChar(123))
} catch(e) {
    console.log("replaceChar error: "+e)
}
try {
    console.log(stringUtils.replaceChar(["test"]))
} catch(e) {
    console.log("replaceChar error: "+e)
}
try {
    console.log(stringUtils.replaceChar(""))
} catch(e) {
    console.log("replaceChar error: "+e)
}
try {
    console.log(stringUtils.replaceChar("   "))
} catch(e) {
    console.log("replaceChar error: "+e)
}
try {
    console.log(stringUtils.replaceChar("Daddy"))
} catch(e) {
    console.log("replaceChar error: "+e)
}
try {
    console.log(stringUtils.replaceChar("Mommy"))
} catch(e) {
    console.log("replaceChar error: "+e)
}
try {
    console.log(stringUtils.replaceChar("Hello, bashing wheel, from boxhaul archery"))
} catch(e) {
    console.log("replaceChar error: "+e)
}

//mashUp
try {
    console.log(stringUtils.mashUp())
} catch(e) {
    console.log("mashUp error: "+e)
}
try {
    console.log(stringUtils.mashUp(123))
} catch(e) {
    console.log("mashUp error: "+e)
}
try {
    console.log(stringUtils.mashUp(123,456))
} catch(e) {
    console.log("mashUp error: "+e)
}
try {
    console.log(stringUtils.mashUp(["test"]))
} catch(e) {
    console.log("mashUp error: "+e)
}
try {
    console.log(stringUtils.mashUp(["test"],["test"]))
} catch(e) {
    console.log("mashUp error: "+e)
}
try {
    console.log(stringUtils.mashUp(""))
} catch(e) {
    console.log("mashUp error: "+e)
}
try {
    console.log(stringUtils.mashUp("",""))
} catch(e) {
    console.log("mashUp error: "+e)
}
try {
    console.log(stringUtils.mashUp("   "))
} catch(e) {
    console.log("mashUp error: "+e)
}
try {
    console.log(stringUtils.mashUp("   ","   "))
} catch(e) {
    console.log("mashUp error: "+e)
}
try {
    console.log(stringUtils.mashUp("ha","it"))
} catch(e) {
    console.log("mashUp error: "+e)
}
try {
    console.log(stringUtils.mashUp("space","place"))
} catch(e) {
    console.log("mashUp error: "+e)
}
try {
    console.log(stringUtils.mashUp("make it rain","show me the money"))
} catch(e) {
    console.log("mashUp error: "+e)
}
try {
    console.log(stringUtils.mashUp("%#!*","*!%$@"))
} catch(e) {
    console.log("mashUp error: "+e)
}
try {
    console.log(stringUtils.mashUp("     space     ","     place     "))
} catch(e) {
    console.log("mashUp error: "+e)
}

//objUtils functional testing

//makeArrays
try {
    console.log(objUtils.makeArrays())
} catch(e) {
    console.log("makeArrays error: "+e)
}
try {
    console.log(objUtils.makeArrays(123))
} catch(e) {
    console.log("makeArrays error: "+e)
}
try {
    console.log(objUtils.makeArrays("test"))
} catch(e) {
    console.log("makeArrays error: "+e)
}
try {
    console.log(objUtils.makeArrays([]))
} catch(e) {
    console.log("makeArrays error: "+e)
}
try {
    console.log(objUtils.makeArrays([1,2,3]))
} catch(e) {
    console.log("makeArrays error: "+e)
}
try {
    console.log(objUtils.makeArrays(["A","B","C"]))
} catch(e) {
    console.log("makeArrays error: "+e)
}
try {
    console.log(objUtils.makeArrays([{}]))
} catch(e) {
    console.log("makeArrays error: "+e)
}
try {
    console.log(objUtils.makeArrays([{},{}]))
} catch(e) {
    console.log("makeArrays error: "+e)
}
try {
    console.log(objUtils.makeArrays([{1:1},{2:3},0]))
} catch(e) {
    console.log("makeArrays error: "+e)
}
try {
    console.log(objUtils.makeArrays([{a:1, b:2, c:3}, {d:4, e:5, f:6}]))
} catch(e) {
    console.log("makeArrays error: "+e)
}
try {
    console.log(objUtils.makeArrays([{0:"Mary", 1:"had"},{a:"a",l:"little",b:"lamb"},{5:"whose",7:"fleece",4:"white",2:"as"},{t:"as",z:"snow"}]))
} catch(e) {
    console.log("makeArrays error: "+e)
}

//isDeepEqual
try {
    console.log(objUtils.isDeepEqual())
} catch(e) {
    console.log("isDeepEqual error: "+e)
}
try {
    console.log(objUtils.isDeepEqual(123))
} catch(e) {
    console.log("isDeepEqual error: "+e)
}
try {
    console.log(objUtils.isDeepEqual(123,123))
} catch(e) {
    console.log("isDeepEqual error: "+e)
}
try {
    console.log(objUtils.isDeepEqual("test"))
} catch(e) {
    console.log("isDeepEqual error: "+e)
}
try {
    console.log(objUtils.isDeepEqual("test","test"))
} catch(e) {
    console.log("isDeepEqual error: "+e)
}
try {
    console.log(objUtils.isDeepEqual({}))
} catch(e) {
    console.log("isDeepEqual error: "+e)
}
try {
    console.log(objUtils.isDeepEqual({},{}))
} catch(e) {
    console.log("isDeepEqual error: "+e)
}
try {
    console.log(objUtils.isDeepEqual({a:1, b:2, c:3}, {c:3, b:2, a:1}))
} catch(e) {
    console.log("isDeepEqual error: "+e)
}
try {
    console.log(objUtils.isDeepEqual({a:1, b:2, c:3}, {d:4, a:1, b:2}))
} catch(e) {
    console.log("isDeepEqual error: "+e)
}
try {
    console.log(objUtils.isDeepEqual({0:null, 1:undefined, 2:false, 3:true, 4:10, 5:"test", 6:[null, undefined, [1,2,3]]}, {6:[[1,3,2],null,undefined], 3:true, 2:false, 5:"test", 0:null, 4:10, 1:undefined}))
} catch(e) {
    console.log("isDeepEqual error: "+e)
}
try {
    console.log(objUtils.isDeepEqual({0:null, 1:undefined, 2:false, 3:true, 4:10, 5:"test", 6:[null, undefined, [1,2,3]]}, {6:[[1,4,3],null,undefined], 3:true, 2:false, 5:"test", 0:null, 4:10, 1:undefined}))
} catch(e) {
    console.log("isDeepEqual error: "+e)
}
try {
    console.log(objUtils.isDeepEqual({a: {sA: "Hello", sB: "There", sC: "Class"}, b: 7, c: true, d: "Test"}, {c: true, b: 7, d: "Test", a: {sB: "There", sC: "Class", sA: "Hello"}}))
} catch(e) {
    console.log("isDeepEqual error: "+e)
}

//computeObject
try {
    console.log(objUtils.computeObject())
} catch(e) {
    console.log("computeObject error: "+e)
}
try {
    console.log(objUtils.computeObject(123))
} catch(e) {
    console.log("computeObject error: "+e)
}
try {
    console.log(objUtils.computeObject(123,123))
} catch(e) {
    console.log("computeObject error: "+e)
}
try {
    console.log(objUtils.computeObject("test"))
} catch(e) {
    console.log("computeObject error: "+e)
}
try {
    console.log(objUtils.computeObject("test","test"))
} catch(e) {
    console.log("computeObject error: "+e)
}
try {
    console.log(objUtils.computeObject({}))
} catch(e) {
    console.log("computeObject error: "+e)
}
try {
    console.log(objUtils.computeObject({},"func"))
} catch(e) {
    console.log("computeObject error: "+e)
}
try {
    console.log(objUtils.computeObject({1:"a", 2:"b", 3:"c"}, n => n*2))
} catch(e) {
    console.log("computeObject error: "+e)
}
try {
    console.log(objUtils.computeObject({a:1, b:2, c:NaN}, n => n*2))
} catch(e) {
    console.log("computeObject error: "+e)
}
try {
    console.log(objUtils.computeObject({a:1, b:2, c:3}, n => n-1))
} catch(e) {
    console.log("computeObject error: "+e)
}
try {
    console.log(objUtils.computeObject({a:1, b:2, c:3}, n => n*n))
} catch(e) {
    console.log("computeObject error: "+e)
}
try {
    console.log(objUtils.computeObject({a:1, b:2, c:3}, n => 24/n))
} catch(e) {
    console.log("computeObject error: "+e)
}