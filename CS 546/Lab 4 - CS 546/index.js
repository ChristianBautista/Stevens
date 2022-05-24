const bands = require('./data/bands')
const connection = require('./config/mongoConnection')

async function main() {
    const db = await connection.connectToDb()
    await db.dropDatabase()

    // 1 & 2
    try {
        const result = await bands.create("The Beatles",["Rock","Pop"],"http://www.thebeatles.com","Parlophone",["John Lennon","Paul McCartney","Ringo Starr","George Harrison"],1960)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    // 3
    try {
        const result = await bands.create("Queen",["Rock"],"http://www.queenonline.com","EMI",["Freddie Mercury","Brian May","Roger Taylor","John Deacon"],1970)
        //console.log(result)
    } catch(e) {
        console.log(e)
    }
    // 4
    let allBands = []
    try {
        allBands = await bands.getAll()
        console.log(allBands)
    } catch(e) {
        console.log(e)
    }
    // 5 & 6
    try {
        const result = await bands.create("The Beach Boys",["Rock","Pop","Surf"],"http://www.thebeachboys.com","Candix",["Brian Wilson","Mike Love","Al Jardine","Carl Wilson","Dennis Wilson"],1961)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    // 7 & 8
    try {
        const result = await bands.rename(allBands[0]["_id"].toString(),"The Quarrymen")
        console.log(result)
    } catch(e) {
        console.log(e)
    }   
    // 9 
    try {
        const result = await bands.remove(allBands[1]["_id"].toString())
        //console.log(result)
    } catch(e) {
        console.log(e)
    }
    // 10
    try {
        allBands = await bands.getAll()
        console.log(allBands)
    } catch(e) {
        console.log(e)
    }
    // 11 
    try {
        const result = await bands.create("Fake Band",["Fake Genre"],"This should fail","Crappy Records",["Nobody"],2000)
        //console.log(allBands)
    } catch(e) {
        console.log(e)
    }
    // 12 
    try {
        const result = await bands.remove("620c395ee71f8a2cca099b4a")
        //console.log(allBands)
    } catch(e) {
        console.log(e)
    }
    // 13
    try {
        const result = await bands.rename("620c395ee71f8a2cca099b4a","The Worst Band Ever")
        //console.log(allBands)
    } catch(e) {
        console.log(e)
    }
    // 14
    try {
        const result = await bands.rename(allBands[0]["_id"],"   ")
        //console.log(allBands)
    } catch(e) {
        console.log(e)
    }
    // 15
    try {
        const result = await bands.get("620c395ee71f8a2cca099b4a")
        //console.log(allBands)
    } catch(e) {
        console.log(e)
    }

    await connection.closeConnection()
}

main()