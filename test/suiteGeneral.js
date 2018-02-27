suite('General', function() {
  var element;

  setup(function() {
    element = document.getElementById("gcr");
  });

  test('instantiating the element works', function() {
    assert.equal(element.is, 'gobstones-code-runner');
    // assert.ok
    // assert.notOk
  });
});
