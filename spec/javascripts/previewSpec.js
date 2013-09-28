describe("event preview", function() {
var evnt, plusButton, previewDiv, xButton, click;

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
    xButton = appendToDom('img', 'x-1', 'x_button', previewDiv)
    click = new Event('click')
  });

  afterEach(function() {
    document.body.removeChild(evnt);
    document.body.removeChild(previewDiv);
  });

  it('should add event listeners on plus signs', function(){
    spyOn(plusButton, 'addEventListener')
    bindListeners('.plus_button', 'click', showDiv)
    expect(plusButton.addEventListener).toHaveBeenCalled();
  });

  it("should show event div when you click the plus sign", function(){
    bindListeners('.plus_button', 'click', showDiv)
    plusButton.dispatchEvent(click);
    expect(previewDiv.classList.contains('hidden')).toBeFalsy();
  });

  it('should add event listeners on the x buttons when the page loads', function(){
    spyOn(xButton, 'addEventListener')
    bindListeners('.x_button', 'click', hideDiv)
    expect(xButton.addEventListener).toHaveBeenCalled();
  })

  it("should hide div when you click the x", function(){
    bindListeners('.plus_button', 'click', showDiv)
    plusButton.dispatchEvent(click);
    bindListeners('.x_button', 'click', hideDiv)
    xButton.dispatchEvent(click);
    expect(previewDiv.classList.contains('hidden')).toBeTruthy();
  });


});


