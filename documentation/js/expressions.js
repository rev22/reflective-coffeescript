// Generated by CoffeeScript 1.8.0-reflective.23
(function() {
  var eldest, grade;

  grade = function(student) {
    if (student.excellentWork) {
      return "A+";
    } else if (student.okayStuff) {
      if (student.triedHard) {
        return "B";
      } else {
        return "B-";
      }
    } else {
      return "C";
    }
  };

  eldest = 24 > 21 ? "Liz" : "Ike";

}).call(this);
