# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require chartist

ready = ->
    $.ajax({
      url: window.location.href + "/results",
      dataType: 'json'
    }).success((results) ->
      new Chartist.Bar('.ct-chart', results, {
        seriesBarDistance: 60,
        reverseData: true,
        horizontalBars: true,
        axisY: {
          offset: 70,
          scaleMinSpace: 100
        }
      });
    );

$(document).ready(ready)
$(document).on('page:load', ready)

# ---
# generated by js2coffee 2.0.0
