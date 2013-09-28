describe("event preview", function() {
var evnt, plusButton, previewDiv;

function appendToDom(elementType, elementId, className, parent) {
    parent = parent || document.body;
    var element = document.createElement(elementType);
    element.id = elementId;
    element.classList.add(className);
    parent.appendChild(element);

    return element;
  }

  beforeEach(function(){
    evnt = appendToDom('p', '1', 'event')
    plusButton = appendToDom('img', 'plus-1', 'plus_button', evnt)
    previewDiv = appendToDom('div', 'preview-1', 'hidden')
  });

  afterEach(function() {
    document.body.removeChild(evnt);
    document.body.removeChild(previewDiv);
  });

  it('should add event listeners when the page loads', function(){
    spyOn(plusButton, 'addEventListener')
    bindListeners()
    expect(plusButton.addEventListener).toHaveBeenCalled();
  });

  it("should show event div when you click the plus sign", function(){
    bindListeners()
    var click = new Event('click')
    plusButton.dispatchEvent(click);
    expect(previewDiv.classList.contains('hidden')).toBeFalsy();
  });

  it("should hide div when you click the x", function(){

  });


});


