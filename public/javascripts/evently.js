function hideFunction(){
  var parent = this.parentNode;
  var id = parent.id;
  parent.classList.add("hide");
  parent.classList.remove("show");
  showFunction(id);
  parent.id = "hidden-" + id;
}
 
function showFunction(id){
  var elem = document.getElementById("hidden-" + id);
  elem.classList.add("show");
  elem.classList.remove("hide");
  elem.id = id;
}
 
var hide_links = document.getElementsByClassName("hide");
var show_links = document.getElementsByClassName("show");

function listen(links, doFunction) {
  for (var i=0; i<links.length; i++) {
    links[i].addEventListener("click",doFunction,false);
  }
}

listen(hide_links, hideFunction);
listen(show_links, hideFunction);