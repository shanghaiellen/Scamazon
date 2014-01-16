// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
(function(){
  document.addEventListener("DOMContentLoaded", function(e){
    //valuesArray is an array which includes the number values for each element
    function drawPie(canvas_id, valuesArray){
      var this_canvas = document.querySelector(canvas_id);
      var context = this_canvas.getContext('2d');
      // context.beginPath();
      var x = this_canvas.width/2;
      var y = this_canvas.height/2;
      var colors = ['blue', 'red', 'green', 'orange', 'yellow', 'purple', 'pink'];
      
      //sets the radius equal to the shorter of half of the height or width
      var radius = (function(){
        if(x<y){
          return x;
        }
        return y;
      })();

      //adds together all of the values in the valuesArray and returns their sum
      var total = (function(){
        var subtotal = 0;
        for(var i = 0; i < valuesArray.length; i++){
          subtotal += valuesArray[i];
        }
        return subtotal;
      })();

      //divides the values array by the 
      var endPointArray = (function(){
        for(var i = 0; i < valuesArray.length; i++){
          var percentage = valuesArray[i] / total;
          var difference = percentage * (2 * Math.PI);
          if(i===0){
            valuesArray[i] = difference;
          }else{
            valuesArray[i] = difference + valuesArray[i - 1];
          }
        }
        return valuesArray;
      })();

      function drawSlice(startDeg, endDeg, color){
        context.beginPath();
        context.moveTo(x,y);
        context.arc(x, y, radius, startDeg, endDeg, false);
        context.fillStyle = color;
        context.fill();
        console.log(startDeg, endDeg, color);
      }

      for(var i = 0; i < endPointArray.length; i++){
        if (i===0){
          drawSlice(0, endPointArray[i], colors[i]);
        } else{
          drawSlice(endPointArray[i-1], endPointArray[i], colors[i]);
        }
      }
    }
    drawPie('#pageviews', [25, 25, 50]);
  });
})();




