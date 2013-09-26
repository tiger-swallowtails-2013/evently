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
    p_hiding = addToImaginaryDom('p', 'event-hidden', 'hidden-1');
    a_show = addToImaginaryDom('a', 'show', '1', p_hiding);
  });

  afterEach(function() {
    document.body.removeChild(p_showing);
    document.body.removeChild(p_hiding);
  });

  it("should add hide to p_showing classlist when user clicks hide", function(){
    listen([a_hide]); // hides p_showing and shows p_hiding!
    a_hide.dispatchEvent(new Event('click'));
    expect(p_showing.classList.contains('hide')).toBeTruthy();
    expect(p_hiding.classList.contains('show')).toBeTruthy();

    listen([a_show]); // shows p_showing and hides p_hiding
    a_show.dispatchEvent(new Event('click'));
    expect(p_hiding.classList.contains('hide')).toBeTruthy();
    expect(p_showing.classList.contains('show')).toBeTruthy();

  });


});
