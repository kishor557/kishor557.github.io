document.addEventListener("DOMContentLoaded", function(event) {
    addForm();
});

function addForm() {
  var x1 = document.getElementById("widget");
  x1.innerHTML = "<form id='wform' href='JavaScript:Void(0);'> \
                    <input type='text' maxlength='12' name='phone' id='wphone' required> \
                    <input type='submit' id='wbtn' value='Send me link' onclick='return myFunc()'> \
                 </form>";
}

function myFunc() {
  var val = document.getElementById("wphone").value;
  if (val.length > 0){
    var xhttp = new XMLHttpRequest(); 
    xhttp.open("POST", "http://c8099419.ngrok.io/api/v1/contacts", true);
    xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhttp.send("phone="+ val);
    document.getElementById("wphone").value = "";
  }else {
    alert("Please enter your phone number!");
  }
  return false;
}


/*
var x = document.getElementById("widget");
console.log(x);

var f1 = document.createElement("form");
x.appendChild(f1);

var el = document.createElement("input");
el.type = "text";
el.name = "phone";
el.required = true;

var b1 = document.createElement("input");
b1.type = "submit";
b1.setAttribute('onclick', 'myFunc()');

f1.appendChild(el);
f1.appendChild(b1);
*/

/* Steps to Integrate
  1. Include lt.js line on html page
  2. Place following on users html page where he wants to place this widget (with in the body tag)
     <div id="widget"></div>
  3. Need to implement two methods in the server side
     a. Method1: will get called from the lt.js, should send a message to the user entered phone number
     b. Method2: will get called when user clicks the link in the message, should perform following
         Rails.logger.debug "\n\n\...@@@..#{request.user_agent.inspect}.#{request.user_agent.class}...#{request.user_agent =~ /Mobile|webOS|Android/}.n"
          res = request.user_agent.match(/iPhone OS|Android/)
          Rails.logger.debug res.inspect
          if res.nil?
            redirect_to "http://param-solutions.com"
          elsif res.to_s == "Android"
            redirect_to "https://play.google.com/store/apps/details?id=com.vaco&hl=en"
          elsif res.to_s == "iPhone OS"
            redirect_to "https://itunes.apple.com/us/app/vaco-conf/id1290804163?mt=8"
          end
 
   #TODO:
   1. Phone number validation && formatter
   2. Country specific phone numbers
   3. change method1 url in the lt.js
   4. Integrate third party SMS service into rails app
   5. Send messages from Method1 using SMS service
   6. Implement Method2
   7. Beautify widget form
          
*/

