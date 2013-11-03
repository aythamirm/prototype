google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['week', 'productive time', 'unproductive time'],
          ['Monday',  			1000,      			  400],
          ['Tuesday',  			1170,      			  460],
          ['Wednesday',  		660,       			 1120],
          ['Thursday',  		1030,      			  540],
		      ['Friday',  			1030,      			  540],
		      ['Saturday',  		1030,      			  540],
		      ['Sunday',  			1030,      			  540]
        ]);

        var options = {
          title: 'productive and unproductive time over the week',
          hAxis: {title: 'week', titleTextStyle: {color: 'red'}}
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }


