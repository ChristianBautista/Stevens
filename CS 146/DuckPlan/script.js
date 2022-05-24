const course = document.getElementById('course');
const professor = document.getElementById('professor');
const assignment_type = document.getElementById('assignment-types');
const time = document.getElementById('time');
const form = document.getElementById('form');
const errorElement = document.getElementById('error');
const successElement = document.getElementById('success');

errorElement.style.display = "none";
successElement.style.display = "none";

let count = 0;
if(localStorage.getItem("count") !== null)
{
    let count_deserialized = JSON.parse(localStorage.getItem("count"));
    count = parseInt(count_deserialized, 10);
}
form.addEventListener('submit', (e) => {
    let messages = [];
    if (course.value === '' || course.value == null){
        messages.push('Course');
    }
    if (professor.value === '' || professor.value == null){
        messages.push('Professor');
    }
    if (time.value === '' || time.value == null){
        messages.push('Time');
    }
    if (assignment_type.options[assignment_type.selectedIndex].text === 'Choose an assignment type'){
        messages.push('Assignment Type');
    }
    if (messages.length > 0){
        e.preventDefault();
        errorElement.innerText = messages.join(', ')+' is required.';
        errorElement.style.display = "block";
        successElement.style.display = "none";
    }
    if (messages.length == 0){
        e.preventDefault();
        let submission = {
            course:course.value, 
            professor:professor.value, 
            assignment_type:assignment_type.options[assignment_type.selectedIndex].text, 
            time:time.value
        };
        count++;
        let submission_serialized = JSON.stringify(submission);
        localStorage.setItem(count, submission_serialized);
        let count_serialized = JSON.stringify(count);
        localStorage.setItem("count", count_serialized);
        successElement.innerText = 'You successfully entered:\n'+course.value+' as the course\n'+professor.value+' as the professor\n'+assignment_type.options[assignment_type.selectedIndex].text+' as the type of assignment\n'+time.value+' hour(s) as the time taken to complete the assignment';
        successElement.style.display = "block";
        errorElement.style.display = "none";
    }
})