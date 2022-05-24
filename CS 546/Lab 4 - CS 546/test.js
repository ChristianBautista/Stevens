const bands = require('./data/bands')
const connection = require('./config/mongoConnection')

async function main() {
    const db = await connection.connectToDb()
    //await db.dropDatabase()
    
    //create

    //empty args
    try {
        const result = await bands.create()
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create(1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create(1,2)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create(1,2,3)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create(1,2,3,4)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create(1,2,3,4,5)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    //wrong types
    try {
        const result = await bands.create(1,2,3,4,5,6)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create(" ",2,3,4,5,6)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create(" ",[],3,4,5,6)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create(" ",[]," ",4,5,6)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create(" ",[]," "," ",5,6)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create(" ",[]," "," ",[]," ")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    //other errors
    try {
        const result = await bands.create(" ",[]," "," ",[],1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create("test",[]," "," ",[],1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create("test",[,]," "," ",[],1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create("test",[1]," "," ",[],1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create("test",[" "]," "," ",[],1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create("test",["valid",123]," "," ",[],1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create("test",["test"]," "," ",[],1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create("test",["test"],"test"," ",[],1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create("test",["test"],"http://www."," ",[],1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create("test",["test"],"http://www.com"," ",[],1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create("test",["test"],"http://www.12345.com"," ",[],1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create("test",["test"],"http://www.12345.com","test",[],1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create("test",["test"],"http://www.12345.com","test",[,],1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create("test",["test"],"http://www.12345.com","test",[" "],1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create("test",["test"],"http://www.12345.com","test",["valid",123],1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.create("test",["test"],"http://www.12345.com","test",["test"],1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    // //valid
    // try {
    //     const result = await bands.create("1st Band",["1st Genre","2nd Genre"],"http://www.first.com","1st Record Label",["Band Member 1","Band Member 2","Band Member 3"],2001)
    //     console.log(result)
    // } catch(e) {
    //     console.log(e)
    // }
    // try {
    //     const result = await bands.create("2nd Band",["1st Genre","2nd Genre"],"http://www.second.com","2nd Record Label",["Band Member 1","Band Member 2"],2002)
    //     console.log(result)
    // } catch(e) {
    //     console.log(e)
    // }

    //getAll
    try {
        const result = await bands.getAll()
        console.log(result)
    } catch(e) {
        console.log(e)
    }

    //get
    try {
        const result = await bands.get()
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.get(123)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.get(" ")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.get("test")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.get("620bb702ab4b4348eb7809d3")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    //valid
    try {
        const result = await bands.get("620c35dff45bb7028d6e54fa")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.get("620c35dff45bb7028d6e54fb")
        console.log(result)
    } catch(e) {
        console.log(e)
    }

    //remove 
    try {
        const result = await bands.remove()
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.remove(123)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.remove(" ")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.remove("test")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.remove("620bb702ab4b4348eb7809d3")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    //valid
    // try {
    //     const result = await bands.remove("620c35dff45bb7028d6e54fa")
    //     console.log(result)
    // } catch(e) {
    //     console.log(e)
    // }
    // try {
    //     const result = await bands.remove("620c35dff45bb7028d6e54fb")
    //     console.log(result)
    // } catch(e) {
    //     console.log(e)
    // }

    //rename
    try {
        const result = await bands.rename()
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.rename(1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.rename(1,2)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.rename(" ",2)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.rename(" "," ")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.rename("test"," ")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.rename("620bb702ab4b4348eb7809d3","test")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    //valid
    try {
        const result = await bands.rename("620c395ee71f8a2cca099b49","New 1st Band")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await bands.rename("620c395ee71f8a2cca099b4a","New 2nd Band")
        console.log(result)
    } catch(e) {
        console.log(e)
    }

    await connection.closeConnection()
}

main()