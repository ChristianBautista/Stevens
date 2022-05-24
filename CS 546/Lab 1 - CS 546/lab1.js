const questionOne = function questionOne(arr) {
    let sum = 0;
    for(let i=0; i<arr.length; i++) {
        sum+=(arr[i]*arr[i]);
    }
    return sum;
}

const questionTwo = function questionTwo(num) { 
    if(num<1) {
        return 0;
    }
    let fib = 1, prev = 0, temp = 0;
    for(let i=2; i<=num; i++) {
        temp = fib;
        fib+=prev;
        prev = temp;
    }
    return fib;
}

const questionThree = function questionThree(text) {
    let cnt = 0;
    let str = text.toLowerCase();
    for(let i=0; i<str.length; i++) {
        if(str[i]==='a' || str[i]==='e' || str[i]==='i' || str[i]==='o' || str[i]==='u') {
            cnt++;
        }
    }
    return cnt;
}

const questionFour = function questionFour(num) {
    if(num<0) {
        return NaN;
    }
    let fact = 1;
    for(let i=num; i>1; i--) {
        fact*=i;
    }
    return fact;
}

module.exports = {
    firstName: "CHRISTIAN", 
    lastName: "BAUTISTA", 
    studentId: "10450958",
    questionOne,
    questionTwo,
    questionThree,
    questionFour
};