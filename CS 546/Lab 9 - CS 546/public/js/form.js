(function() {
    function isPrime(x) {
        if(x<2) {
            return false
        }
        for(let i=2; i<x; i++) {
            if(x%i===0) {
                return false
            }
        }
        return true
    }

    const staticForm = document.getElementById('static-form')
    if(staticForm) {
        const nInput = document.getElementById('n')
        const err = document.getElementById('err')
        const attempts = document.getElementById('attempts')
        staticForm.addEventListener('submit', (event) => {
            event.preventDefault()
            try {
                err.classList.add('hide')
                //Parse n to number then int then check if it's prime
                let n = nInput.value
                if(!n) throw "No input provided"
                if(typeof n !== 'number' && typeof n !== 'string') throw "Input is not a number"
                if(typeof n === 'string') {
                    n = n.trim()
                    if(!n.length) throw "Input is empty"
                }
                n = Number(n)
                if(!Number.isInteger(n)) throw "Input is not an integer"
                n = parseInt(n)
                const res = isPrime(n)
                let li = document.createElement('li')
                if(res) {
                    li.innerHTML = `${n} is a prime number`
                    li.className = "is-prime"
                } else {
                    li.innerHTML = `${n} is NOT a prime number`
                    li.className = "not-prime"
                }
                attempts.appendChild(li)
                nInput.value = ""
            } catch(e) {
                const msg = typeof e === 'string' ? e : e.message
                err.textContent = msg
                err.classList.remove('hide')
                nInput.value = ""
            }
        })
    }
})()