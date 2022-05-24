function validate(username, password) {
    if(!username) throw "username not provided"
    if(!password) throw "password not provided"
    if(typeof username !== 'string') throw "username is not a string"
    if(typeof password !== 'string') throw "password is not a string"
    username = username.trim()
    if(!username.length) throw "username is empty"
    if(!password.length) throw "password is empty"
    if(username.length<4) throw "username is too short"
    if(password.length<6) throw "password is too short"
    username = username.toLowerCase()
    let alphanumeric = "abcdefghijklmnopqrstuvwxyz0123456789"
    for(let i=0; i<username.length; i++) {
        //check for alphanumeric characters
        if(!alphanumeric.includes(username[i])) throw "username contains invalid characters"
    }
    for(let i=0; i<password.length; i++) {
        if(password[i]===' ') throw "password contains spaces"
    }
    let user = {
        "username": username,
        "password": password
    }
    return user
}

module.exports = {validate}