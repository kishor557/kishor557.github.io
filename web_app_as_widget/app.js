document.addEventListener("DOMContentLoaded", function(event) {
    addForm();
});

function addForm() {
  var head = document.getElementsByTagName("head")[0];
  console.log(head);
  var link = document.createElement('link');
  link.href = './app.css';
  link.media = 'all';
  link.type = 'text/css';
  link.rel  = 'stylesheet';
  head.appendChild(link);

  var x1 = document.getElementById("widget");
  x1.innerHTML = "<div id='my_widget_div' style=''><a href='https://www.worldtimebuddy.com/' target='_blank' style=''>Click Me</a> </div>";
}


