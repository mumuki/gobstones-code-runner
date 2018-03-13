suite('General', function() {
  let element;
  let stop;

  setup(function() {
    element = document.getElementById("gcr");
    if (!stop) stop = element.stop;

    element.stop = stop;
    element.runner = { clear: sinon.spy() };
    element.fire = sinon.spy();
  });

  const assertClear = function() {
    assert.ok(element.runner.clear.calledOnce);
  };

  test('instantiating the element works', function() {
    assert.equal(element.is, 'gobstones-code-runner');
    // assert.ok
    // assert.notOk
  });

  test('start fires gbs-start and notifies step by step the boards using the teacher code as atomic', function(done) {
    const onResult = sinon.spy();

    element.stop = function() {
      assert.equal(onResult.callCount, 4);
      assert.deepEqual(onResult.getCall(0).args[0].head, { x: 0, y: 1 });
      assert.deepEqual(onResult.getCall(1).args[0].head, { x: 0, y: 3 });
      assert.equal(onResult.getCall(2).args[0].table[0][0].red, 3);
      assert.deepEqual(onResult.getCall(2).args[0].head, { x: 0, y: 3 });
      assert.deepEqual(onResult.getCall(3).args[0].head, { x: 2, y: 3 });
      done();
    };

    element.start({
      initialState: {
        size: { x: 4, y: 4 },
        table: [
          [{}, {}, {}, {}], [{}, {}, {}, {}], [
            {
              black: 1
            }, {
              blue: 87493312
            }, {
              green: 2
            }, {}
          ], [
            {
              red: 3,
              black: 4
            }, {}, {}, {}
          ]
        ],
        header: { x: 0, y: 1 }
      },
      code: {
        main: `
          program {
            MoverDosArriba()
            PonerTresRojos()
            MoverDosPaLaDerecha()
          }`,
        library: "",
        teacher: `
          procedure MoverDosArriba() {
            Mover(Norte) ; Mover(Norte)
          }
          procedure PonerTresRojos() {
            Poner(Rojo) ; Poner(Rojo) ; Poner(Rojo)
          }
          procedure MoverDosPaLaDerecha() {
            Mover(Este) ; Mover(Este)
          }
        `
      }
    }, {
      onResult: onResult
    });

    assert.ok(element.fire.calledWith("gbs-start"));
  });

  test('stop clears the current runner state', function() {
    element.stop();
    assertClear();
  });

  test('stop fires a gbs-stop event with the reason', function() {
    element.stop("some-reason");
    assert.ok(element.fire.calledOnce);
    assert.ok(element.fire.calledWith("gbs-stop", "some-reason"));
  });

  test('stop fires a gbs-stop event with "cancel" as reason if no reason is provided', function() {
    element.stop();
    assert.ok(element.fire.calledOnce);
    assert.ok(element.fire.calledWith("gbs-stop", "cancel"));
  });

  test('stop sets isRunning to false', function() {
    element.isRunning = true;
    element.stop();
    assert.notOk(element.isRunning);
  });

  test('requestRun clears the current runner state', function() {
    element.requestRun();
    assertClear();
  });

  test('requestRun fires a gbs-run-request event', function() {
    element.requestRun();
    assert.ok(element.fire.calledOnce);
    assert.ok(element.fire.calledWithMatch("gbs-run-request"));
  });
});
