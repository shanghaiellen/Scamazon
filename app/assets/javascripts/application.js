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
    var drawPie = function(this_canvas, valuesArray){
      var x = this_canvas.width/2;
      var y = this_canvas.height/2;
      
      //sets the radius equal to the shorter of half of the height or width
      var radius = (function(){
        if(x<y){
          return x;
        }
        return y;
      });

      //adds together all of the values in the valuesArray and returns their sum
      var total = (function(){
        var subtotal = 0;
        for(i = 0; i < valuesArray.length; i++){
          subtotal += valuesArray[i];
        }
        return subtotal;
      });

      
      var percentageArray = (function(){
        for(i = 0; i < valuesArray.length; i++){
          valuesArray[i] = valuesArray[i] / total;
        }
        return valuesArray;
      });

      var endPointArray = (function(){
        for(i = 0; i < valuesArray.length; i++){
          valuesArray[i] = valuesArray[i] * (2 * Math.PI);
        }
        return valuesArray;
      });

      var drawSlice = function(length, startDeg){

      }
    }
  });
});




