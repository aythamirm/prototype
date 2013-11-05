    
    google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Total time', 'Results'],
          ['productive time',     gon.total_productive_time],
          ['unproductive time',   gon.total_unproductive_time]  
        ]);

        var options = {
          title: 'Total productive and unproductive time',
          width:900,
          height:500
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
      }