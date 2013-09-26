function hideFunction(){
  var element = this;
  var id = element.id
  var parent = element.parentNode;
  console.log(id)
  console.log(element)
  console.log(parent)
  parent.classList.add("hide")
 
  showFunction(id)
 
}
 
function showFunction(id){
  console.log(id)
  id = "hidden-" + id
  console.log(id)
  var elem = document.getElementById(id)
  console.log(elem)
  elem.classList.remove("hide")
  elem.classList.add("show")
 
}
 
var links = document.getElementsByClassName("hide");
function listen(links) {
  for (var i=0; i<links.length; i++) {
    links[i].addEventListener("click",hideFunction,false);
  }
};
 
listen(links);