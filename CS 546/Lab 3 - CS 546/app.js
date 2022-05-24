const people = require('./people')
const stocks = require('./stocks')

async function main() {
    //People function checks
    /**
     * 1. Empty Input
     * 2. Improper Type (number)
     * 3. Improper Type (boolean)
     * 4. Improper Type (array)
     * 5. Empty String
     * 6. Whitespace String
     * 7. Non-Existing but Correct Type Short
     * 8. Non-Existing but Correct Type Long
     * 9. Existing
     * 10. Existing
     */
    
    //getPersonById
    try {
        const result = await people.getPersonById()
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.getPersonById(123)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.getPersonById(false)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.getPersonById(["test"])
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.getPersonById("")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try { 
        const result = await people.getPersonById("    ")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.getPersonById("fake id")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.getPersonById("20035a09-3820-4f49-bb8f-d947cebef528")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.getPersonById("20035a09-3820-4f49-bb8f-d947cebee537")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.getPersonById("63d3b7e2-4f58-452b-b83e-cb446b7607f2")
        console.log(result)
    } catch(e) {
        console.log(e)
    }

    //sameEmail
    try {
        const result = await people.sameEmail()
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameEmail(123)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameEmail(false)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameEmail(["test"])
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameEmail("")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameEmail("     ")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameEmail("fake email")
        console.log(result)
    } catch(e) {
        console.log(e)
    } 
    try {
        const result = await people.sameEmail("RaNDom.12c")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameEmail("4shared.com")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameEmail("uol.com.br")
        console.log(result)
    } catch(e) {
        console.log(e)
    }

    //manipulateIp
    try {
        const result = await people.manipulateIp()
        console.log(result)
    } catch(e) {
        console.log(e)
    }

    //sameBirthday
    try {
        const result = await people.sameBirthday()
        console.log(result)
    } catch(e) {
        console.log(e)
    }    
    try {
        const result = await people.sameBirthday(false)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameBirthday(true, false)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameBirthday("test")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameBirthday("test","test")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameBirthday([1])
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameBirthday([1],[2])
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameBirthday(1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameBirthday(1,0)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameBirthday(13,1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameBirthday(1,32)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameBirthday(1,5)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameBirthday("     0000001   ", "    005      ")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameBirthday(9,18)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await people.sameBirthday("     00009  ","   0018       ")
        console.log(result)
    } catch(e) {
        console.log(e)
    }

    //Stock function checks
    /**
     * 1. Empty Input
     * 2. Improper Type (boolean)
     * 3. Improper Type (number)
     * 4. Improper Type (array)
     * 5. Empty String
     * 6. Whitespace String
     * 7. Non-Existing but Correct Type Short
     * 8. Non-Existing but Correct Type Long
     * 9. Existing
     * 10. Existing
     */

    //listShareholders
    try {
        const result = await stocks.listShareholders()
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listShareholders(false)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listShareholders(123)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listShareholders(["test"])
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listShareholders("")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listShareholders("     ")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listShareholders("fake stock")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listShareholders("Applied Genetic Technologies Company")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listShareholders("Powell Industries, Inc.")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listShareholders("AcelRx Pharmaceuticals, Inc.")
        console.log(result)
    } catch(e) {
        console.log(e)
    }

    //totalShares
    try {
        const result = await stocks.totalShares()
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.totalShares(false)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.totalShares(123)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.totalShares(["test"])
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.totalShares("")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.totalShares("     ")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.totalShares("fake stock")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.totalShares("Applied Genetic Technologies Company")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.totalShares("Powell Industries, Inc.")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.totalShares("The Habit Restaurants, Inc.")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.totalShares("AcelRx Pharmaceuticals, Inc.")
        console.log(result)
    } catch(e) {
        console.log(e)
    }

    //listStocks
    try {
        const result = await stocks.listStocks()
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listStocks(false)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listStocks(false, true)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listStocks(1)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listStocks(1,2)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listStocks([1])
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listStocks([1],[2])
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listStocks("")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listStocks("","")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listStocks("     ")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listStocks("     ","     ")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listStocks("fake","name")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listStocks("Christian","Bautista")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listStocks("Merell","Pecht")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.listStocks("Dody","Keeler")
        console.log(result)
    } catch(e) {
        console.log(e)
    }

    //getStockById
    try {
        const result = await stocks.getStockById()
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.getStockById(123)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.getStockById(false)
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.getStockById(["test"])
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.getStockById("")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try { 
        const result = await stocks.getStockById("    ")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.getStockById("fake id")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.getStockById("20035a09-3820-4f49-bb8f-d947cebef528")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.getStockById("0304c85a-7914-4eb6-b050-b7631491dd2b")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
    try {
        const result = await stocks.getStockById("efcd1502-265b-4e39-9a62-d8fbd96d49bb")
        console.log(result)
    } catch(e) {
        console.log(e)
    }
}

main()