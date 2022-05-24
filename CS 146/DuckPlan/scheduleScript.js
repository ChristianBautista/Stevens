var count = 0;
if(localStorage.getItem("count") !== null)
{
    let count_deserialized = JSON.parse(localStorage.getItem("count"));
    count = parseInt(count_deserialized, 10);
}
else
{
    let brk = document.getElementById("brk");
    let dis = document.getElementById("display");
    let clr = document.getElementById("clear");
    brk.remove();
    dis.remove();
    clr.remove();
}
function convertTimeToDecimal(t)
{
    let hour = parseInt(t, 10);
    let min = 0;
    if(t.includes(":30") === true)
    {
        min = .5;
    }
    return hour + min;
}
function convertDecimalToTime(d)
{
    let hour = parseInt(d, 10).toString();
    let min = ":00";
    if((d / .5) % 2 === 1)
    {
        min = ":30";
    }
    return hour + min;
}
function determineTime(t)
{
    let front = "<option value=\"";
    let middle = "\">";
    let back = "</option>";
    let resEnd = "";
    let res = "";
    let opt = "";
    if(t === 12)
    {
        return front + "8:00" + middle + "8:00" + back;
    }
    if(t < 7.5)
    {
        for(j = 1; j < (8.5 - t); j += .5)
        {
            opt = front + convertDecimalToTime(j) + middle + convertDecimalToTime(j) + back;
            resEnd += opt;
        }
    }
    if(t > 7.5)
    {
        t -= 7.5;
    }
    else
    {
        t = 0;
    }
    for(k = 8; k < (12 - t); k += .5)
    {
        opt = front + convertDecimalToTime(k) + middle + convertDecimalToTime(k) + back;
        res += opt;
    }
    return res + resEnd;
}
function createQuestion(c, p, a, t, i)
{
    let q = "<p>Please select a day and time for " + a + " for " + c + " with Professor " + p + ". (Alloted Time: " + t + " hour(s))</p>";
    let day_id = "id=\"d" + i + "\"";
    let time_id = "id=\"t" + i + "\"";
    let mon = "value=\"mon\"";
    let tue = "value=\"tue\"";
    let wed = "value=\"wed\"";
    let thu = "value=\"thu\"";
    let fri = "value=\"fri\"";
    let sat = "value=\"sat\"";
    let sun = "value=\"sun\"";
    let day = "<select " + day_id + "><option value=\"null\">Choose a day</option><option " + mon + ">Monday</option><option " + tue + ">Tuesday</option><option " + wed + ">Wednesday</option><option " + thu + ">Thursday</option><option " + fri + ">Friday</option><option " + sat + ">Saturday</option><option " + sun + ">Sunday</option></select>";
    let time = "<select " + time_id + "><option value=\"null\">Choose a time</option>" + determineTime(t) + "</select>";
    document.getElementById("questions").innerHTML += q;
    document.getElementById("questions").innerHTML += day;
    document.getElementById("questions").innerHTML += time;
}
function createInput()
{
    let course = "";
    let professor = "";
    let assignment_type = "";
    let time = 0;
    for(i = 1; i < count + 1; i++)
    {
        let submission_deserialized = JSON.parse(localStorage.getItem(i));
        let course = submission_deserialized.course;
        let professor = submission_deserialized.professor;
        let assignment_type = submission_deserialized.assignment_type;
        let time = submission_deserialized.time;
        if(parseInt(time, 10) > 12)
        {
            alert("You have alotted too much time for " + assignment_type + " for " + course + " with Professor " + professor + ". Alloted time has been set to 12 hours.");
            time = "12";
        }
        let id = i;
        createQuestion(course, professor, assignment_type, time, id);
    }
}
function clearStorage()
{
    localStorage.clear();
    location.reload();
}
function resetTable()
{
    let days = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];
    for(q = 8; q < 13; q += .5)
    {
        let t = convertDecimalToTime(q);
        let e = document.getElementById(t);
        e.innerHTML = "<th>" + t + "</th>";
        for(r = 0; r < 7; r++)
        {
            e.innerHTML += "<td id=\"" + days[r] + t + "\" type=\"false\"></td>";
        }
    }
    for(u = 1; u < 8; u += .5)
    {
        let t = convertDecimalToTime(u);
        let e = document.getElementById(t);
        e.innerHTML = "<th>" + t + "</th>";
        for(v = 0; v < 7; v++)
        {
            e.innerHTML += "<td id=\"" + days[v] + t + "\" type=\"false\"></td>";
        }
    }
}
function determineOverlap(d, t, s) 
{
    let id = d + t;
    let e = document.getElementById(id);
    let dt = convertTimeToDecimal(t);
    let endDay = 12.5;
    let endNight = 0;
    let carryOver = false;
    let sum = parseFloat(dt) + parseFloat(s);
    if(dt >= 8)
    {
        let mStart = parseFloat(dt) + .5;
        if(sum < 12.5)
        {
            endDay = sum;
        }
        else
        {
            endNight = sum - 12;
            carryOver = true;
        }
        for(o = mStart; o < endDay; o += .5) 
        {
            let dID = d + convertDecimalToTime(o);
            let y = document.getElementById(dID);
            if((y === null) || y.getAttribute("type") === true)
            {
                return true;
            }
        }   
    }
    else
    {
        endNight = sum;
    }
    let nStart = parseFloat(dt) + .5;
    if(carryOver === true)
    {
        nStart = 1;
    }
    for(p = nStart; p < endNight; p += .5)
    {
        let nID = d + convertDecimalToTime(p);
        let z = document.getElementById(nID);
        if((z === null) || z.getAttribute("type") === true)
        {
            return true;
        }
    }
    return false;    
}
function updateTable()
{
    resetTable();
    for(l = 1; l < count + 1; l++)
    {
        let dayID = "d" + l;
        let timeID = "t" + l;
        let dayEl = document.getElementById(dayID);
        let timeEl = document.getElementById(timeID);
        let d = dayEl.options[dayEl.selectedIndex].value;
        let t = timeEl.options[timeEl.selectedIndex].value;
        dayEl.selectedIndex = 0;
        timeEl.selectedIndex = 0;
        let submission_deserialized = JSON.parse(localStorage.getItem(l));
        let c = submission_deserialized.course;
        let p = submission_deserialized.professor;
        let a = submission_deserialized.assignment_type;
        if((d === "null") || (t === "null"))
        {
            
            alert("You have an empty field for " + a + " for " + c + " with Professor " + p + ".\nEvent was not displayed!");
        }
        else
        {
            let s = submission_deserialized.time;
            if(determineOverlap(d, t, s) === false)
            {
                let id = d + t;
                let e = document.getElementById(id);
                let dt = convertTimeToDecimal(t);
                let endDay = 13;
                let endNight = 0;
                let carryOver = false;
                let sum = parseFloat(dt) + parseFloat(s);
                if(dt >= 8)
                {
                    let mStart = parseFloat(dt) + .5;
                    if(sum < 12.5)
                    {
                        endDay = sum;
                    }
                    else
                    {
                        endNight = sum - 12;
                        carryOver = true;
                    }
                    for(m = mStart; m < endDay; m += .5) 
                    {
                        let dID = d + convertDecimalToTime(m);
                        let y = document.getElementById(dID);
                        y.remove();
                    }   
                }
                else
                {
                    endNight = sum;
                }
                let nStart = parseFloat(dt) + .5;
                if(carryOver === true)
                {
                    nStart = 1;
                }
                for(n = nStart; n < endNight; n += .5)
                {
                    let nID = d + convertDecimalToTime(n);
                    let z = document.getElementById(nID);
                    z.remove();
                }
                e.setAttribute("class", a);
                e.setAttribute("rowspan", s*2);
                e.setAttribute("type", "true");
                e.innerHTML = "<h3><strong>" + a + "</strong></h3><p class=\"desc\">" + c + "</p><p class=\"teach\">" + p + "</p>";
            }
            else
            {
                    alert("The " + a + " for " + c + " with Professor " + p + " conflicts with another event.\nEvent was not displayed!");
            }  
        }
    }
}
window.onload = (e) => 
{
    if(count !== 0)
    {
        createInput();
    }
    else
    {
        alert("No data availabe. Please input some events using the survey.");
    }
};