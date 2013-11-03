    google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Total time', 'Results'],
          ['productive time',     11],
          ['unproductive time',      2]  
        ]);

        var options = {
          title: 'Total productive and unproductive time'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
      }