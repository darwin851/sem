<footer id="footer" class="site-footer" style="display:none">
		
		</footer>		
	    
		
				<script src="js/jquery.js"></script>
				<script src="js/bootstrap.js"></script>
				<script src="js/metisMenu.js"></script>
				<script src="js/imagesloaded.js"></script>
				<script src="js/masonry.js"></script>
				<script src="js/pace.js"></script>
				<script src="js/numeral.js"></script>
				<script src="js/main.js"></script>
				<script src="js/grafs1.js"></script>
				<script src="https://code.highcharts.com/highcharts.js"></script>
				<script src="https://code.highcharts.com/modules/exporting.js"></script>
				<script src="https://code.highcharts.com/modules/export-data.js"></script>
				<script src="https://code.highcharts.com/highcharts-3d.js"></script>
				
				
				<script type="text/javascript">
					Highcharts.setOptions({
  colors: Highcharts.map(Highcharts.getOptions().colors, function (color) {
    return {
      radialGradient: {
        cx: 0.5,
        cy: 0.3,
        r: 0.7
      },
      stops: [
        [0, color],
        [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
      ]
    };
  })
});

// Build the chart
Highcharts.chart('container', {
  chart: {
    plotBackgroundColor: null,
    plotBorderWidth: null,
    plotShadow: false,
    type: 'pie'
  },
  title: {
    text: 'Participación en los talleres'
  },
  tooltip: {
    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
  },
  plotOptions: {
    pie: {
      allowPointSelect: true,
      cursor: 'pointer',
		marker: {
                fillColor: '#FFFFFF',
		},
      dataLabels: {
        enabled: true,
        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
        style: {
          color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
        },
        connectorColor: 'silver'
      }
    }
  },
  series: [{
    name: ' % Participación',
    data: [
      { name: 'Finalizadas', y: 65.45 },
      { name: 'Incompletas', y: 22.64, color: 'red' },
	  { name: 'No asistieron', y: 11.95 }
      
    ]
  }]
});
					
Highcharts.chart('container_columns', {
  chart: {
    type: 'column'
  },
  title: {
    text: 'Participación por zonas del país'
  },
  
  xAxis: {
    categories: [
      'Zonas de El Salvador'
 
    ],
    crosshair: true
  },
  yAxis: {
    min: 0,
    title: {
      text: 'Cantidad de personas capacitadas'
    }
  },
  tooltip: {
    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
      '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
    footerFormat: '</table>',
    shared: true,
    useHTML: true
  },
  plotOptions: {
    column: {
      pointPadding: 0.2,
      borderWidth: 0,
	  dataLabels: {
		  enabled : true
	  }
    }
  },
  series: [{
    name: 'Zona Occidental',
    data: [26],
	color: 'green'

  }, {
    name: 'Zona Central',
    data: [81],
	color: 'blue'

  }, {
    name: 'Zona Oriental',
    data: [51],
	color: 'red'

  }]
});					
		
					
				
					
				</script>

				
	</body>
</html>
