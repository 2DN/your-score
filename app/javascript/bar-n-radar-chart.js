function bothCharts(){
  var barChart;
  var radarChart;
  
  const ctx1 = document.getElementById("myBarChart");
  if( barChart ){
    barChart.destroy();
  }
  barChart = new Chart(ctx1, {
    type: 'bar',
    data: {
      labels: gon.array_subject,
      datasets: [{
        label: "成績",
        backgroundColor: gon.array_color,
        data: gon.array_score
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true,
            min: 0,
            max: 200
          }
        }]
      }
    }
  });
  const ctx2 = document.getElementById("myRadarChart");
  if( radarChart ){
    radarChart.destroy();
  }
  radarChart = new Chart(ctx2, {
    type: 'radar',

    data: {
      labels: gon.array_subject,
      datasets: [
        {
          label: "成績",
          backgroundColor: "rgba(237,140,114,0.3)",
          borderColor: "#ed8c72",
          pointBackgroundColor: "rgba(237,140,114,1)",
          pointBorderColor: "#fff",
          pointHoverBackgroundColor: "#fff",
          pointHoverBorderColor: "rgba(237,140,114,1)",
          data: gon.array_score
        },
        {
          label: "平均点",
          backgroundColor: "rgba(41,136,188,0.3)",
          borderColor: "#2988bc",
          pointBackgroundColor: "#2988bc",
          pointBorderColor: "#fff",
          pointHoverBackgroundColor: "#fff",
          pointHoverBorderColor: "#2988bc",
          data: gon.array_average
        }
      ]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      scale: {
        ticks: {
          beginAtZero: true,
          min: 0,
          max: 200,
          fontSize: 8,
          
        },
        pointLabels: {
          fontStyle: "bold"
        }
      }
    }
  });
};

window.addEventListener("load", bothCharts);