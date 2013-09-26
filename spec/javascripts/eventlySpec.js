describe("event hider and shower", function() {
var p_showing, a_hide, p_hidden, a_show;

  function addToImaginaryDom(element, className, id, parent) {
    parent = parent || document.body;
    var element = document.createElement(element);
    element.id = id;
    element.classList.add(className);
    parent.appendChild(element);

    return element;
  }

  beforeEach(function(){
    p_showing = addToImaginaryDom('p', 'event', '1');
    a_hide = addToImaginaryDom('a', 'hide', '1', p_showing);
    p_hidden = addToImaginaryDom('p', 'event-hidden', 'hidden-1');
    a_show = addToImaginaryDom('a', 'show', 'shown-1', p_hidden);

  });

  //it("should add event listener to hide link on click", function(){

  //});



  it("COME UP WITH WHAT THIS IS TESTING!", function(){
    listen([a_hide]);
    a_hide.dispatchEvent(new Event('click'));
    expect(p_showing.classList.contains('hide')).toBeTruthy();
  });

});
