window.onload = function() {
  bindListeners('.plus_button', 'click', showDiv)
  bindListeners('.x_button', 'click', hideDiv)
}

function showDiv () {
  var plusId = this.id
  var idNum = plusId.match(/\d+/);
  var previewDiv = document.querySelector('#preview-'+ idNum)
  previewDiv.classList.remove('hidden');
}

function bindListeners(className, eventType, eventCall){
  var collection = document.querySelectorAll(className)
  for(i = 0; i < collection.length; i++)
  {
    collection[i].addEventListener(eventType, eventCall, false)
  }
}

function hideDiv() {
  var xId = this.id
  var idNum = xId.match(/\d+/);
  var previewDiv = document.querySelector('#preview-'+ idNum)
  previewDiv.classList.add('hidden');
}