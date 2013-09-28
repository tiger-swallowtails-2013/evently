window.onload = function() {
  bindListeners();
}

function showDiv () {
  var plusId = this.id
  var idNum = plusId.match(/\d+/);
  var previewDiv = document.querySelector('#preview-'+ idNum)
  previewDiv.classList.remove('hidden');
}

function bindListeners() {
  var plusButtons = document.querySelectorAll('.plus_button');
  for(i = 0; i < plusButtons.length; i++)
  {
    plusButtons[i].addEventListener('click', showDiv, false)
  }
}