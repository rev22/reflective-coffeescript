// Generated by CoffeeScript 1.8.0-reflective.23
(function() {
  var x;

  x = 1;

  (function(x) {
    x.coffee = "@> x = 2";
    return x;
  })(function() {
    var x;
    return x = 2;
  })();

  console.log(x);

}).call(this);
