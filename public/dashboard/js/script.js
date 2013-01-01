// ===================================================
//*=== Set up iSL namespace and methods ===*
// ===================================================

var iSL = function() {

  var contentEl = $('#content');

  /* ==|== Socket Events =============================== */

  socket.on('connected', function(data) {
    console.log('socket.io connected');
    appendMessage('I am connected.');
  });

  socket.on('pingd', function(data) {
    console.log('pingd', data);
    appendMessage(data.message);
  });

  socket.on('visitor', function(data) {
    console.log('visitor', data);
    appendMessage(data.message);
  });

  function appendMessage(message){
    contentEl.append('<p>'+message+'</p>');    
  }
  return {

    init : function() {
      // socket.emit('recentCheckins');
    }

  };

}();

// ===================================================
//*=== On DOM Ready  ===*
// ===================================================

$(document).ready(function () {

  iSL.init();

});
