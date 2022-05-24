result = "";
currentOp = "";
buffer = 0;
document.getElementById("output").innerText = "0";
/**
 * Resets the state of the calculator and the display
 */
function resetCalc() {
   result = "";
   currentOp = "";
   buffer = 0;
   document.getElementById("output").innerText = "0";
}

/**
 * Sets the inner text of the div with id="output"
 * @param {String} str the string to set the inner text to
 */
function setDisplay(str) {
   document.getElementById("output").innerText = str;
}

/**
 * Returns the current result of the calculator
 * Hint: you can use a global variable for the result
 */
function getResult() {
   return parseInt(result, 10);
}

/**
 * Update the calculator state with the next number and sets the display
 * @param {Number} num the number that was pressed
 */
function pressNum(num) {
   result = result.toString();
   result += num;
   if(result.length > 9)
   {
      result = "999999999";
   }
   setDisplay(result);
   result = getResult();
}

/**
 * Operation is pressed, move the current result value to a temporary buffer and
 * set the current result to zero.
 * @param {String} op the operation pressed, either: +,-,*,/
 */
function pressOp(op) {
   if(currentOp === "")
   {
      buffer = getResult();
      result = "";
   }
   currentOp = op;
}

/**
 * Should compute the current operation with the buffer value and current
 * result value based on the current operation. If there is no current
 * operation, do nothing.
 */
function pressEquals() {
   if((result === 0) && (currentOp === "/"))
   {
      buffer = "ERROR"
      result = 0;
   }
   else if(currentOp === "+")
   {
      buffer += result;
   }
   else if(currentOp === "-")
   {
      buffer -= result;
   }
   else if(currentOp === "*")
   {
      buffer *= result;
   }
   else
   {
      buffer /= result;
   }
   if(buffer > 999999999)
   {
      buffer = 999999999;
   }
   if(buffer < -999999999)
   {
      buffer = -999999999;
   }
   if(buffer !== "ERROR")
   {
      result = buffer;
   }
   setDisplay(buffer.toString());
}