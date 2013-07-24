$(document).ready(function() {
  $("tr").focus();
  $(document).keyup(function(e) {
    var finished = $('td:last-child[class=active]').parent();
    if ((e.keyCode == 81 || e.keyCode == 80) && finished.length > 0) {
      var playerName = finished.first().data('player-name');
      var gameId = $('.racer_table').data("game-id");      

      $.ajax({
        type: "put",
        url: "/games/" + gameId,
        data: "winner=" + playerName
      });

      alert(playerName + " is the winner!")
      $("#post-game-options").show();
    } 
    else {
      if (e.keyCode == 81) {
        $('#player1 td.active').removeClass('active').next().addClass('active');
      }
      if (e.keyCode == 80) {
        $('#player2 td.active').removeClass('active').next().addClass('active');
      }
    }
  });
});

