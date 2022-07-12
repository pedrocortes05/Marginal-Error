(function() {
  var paintIt;

  paintIt = function(element, backgroundColor, textColor) {
    element.style.backgroundColor = backgroundColor;
    if (textColor != null) {
      return element.style.color = textColor;
    }
  };

}).call(this);