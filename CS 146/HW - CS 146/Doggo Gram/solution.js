// Here are the paths to the images
const fileLocations = {
   woofer: './img/woofer.jpg',
   pupper: './img/pupper.jpg',
   clouds: './img/clouds.jpg',
   snek: './img/snek.jpg'
};

/**
 * This function will get the values of the following elements:
 * 		formUsername, formCaption, formImg
 * Then, this will pass those values to the addNewPost function.
 * @param {Event} event the submit event of the #postForm form
 */
function handleFormSubmit(event) {
   // This next line prevents the reload of the form
   event.preventDefault();
   // Get values of inputs
   let u = document.getElementById("formUsername").value;
   let c = document.getElementById("formCaption").value;
   let i = document.getElementById("formImg").value;
   if(i === "woofer")
   {
      i = fileLocations.woofer;
   }
   else if(i === "pupper")
   {
      i = fileLocations.pupper;
   }
   else if(i === "clouds")
   {
      i = fileLocations.clouds;
   }
   else
   {
      i = fileLocations.snek;
   }
   // Pass values to addNewPost()
   addNewPost(u, c, i);
}

/**
 * This function create the following div and append it to the #postList element
	<div class="post">
		<span>{username}</span>
		<img src="{imgLocation}" alt="{caption}">
		<div class="postOverlay">
			{caption}
		</div>
	</div>
 * 
 * Also, add a mouseover and mouseleave events to the post div element
 * @param {String} username username of the post
 * @param {String} caption caption of the post
 * @param {String} imgLocation location of the post image
 */
function addNewPost(username, caption, imgLocation) {
   // Create the parent post div
   let p = document.createElement("div");
   p.className = "post";
   // Create a span for the user
   let s = document.createElement("span");
   s.innerHTML = username;
   // Create image element
   let i = document.createElement("img");
   i.src = imgLocation;
   i.alt = caption;
   // Create overlay element
   let o = document.createElement("div");
   o.className = "postOverlay";
   o.innerHTML = caption;
   // Add all child elements (order matters)
   p.appendChild(s);
   p.appendChild(i);
   p.appendChild(o);
   // Add event listeners to post
   p.addEventListener("mouseover", function(){
      o.style.opacity = "1";
   })
   p.addEventListener("mouseleave", function(){
      o.style.opacity = "0";
   })
   // Add post element to post list
   document.getElementById("postList").appendChild(p);
}

window.onload = () => {
   // Once our window is loaded, we add the event listener for our post form
   postForm.addEventListener('submit', handleFormSubmit);
};