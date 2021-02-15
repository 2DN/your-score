function createChart(){
  var radarChart;

  const subject = gon.array_subject
  const average = gon.array_average
  const score = gon.array_score
  const hitNum = score.length
  
  const ctx2 = document.getElementById("topMyRadarChart");
  if( radarChart ){
    radarChart.destroy();
  }
  radarChart = new Chart(ctx2, {
    type: 'radar',
    data: {
      labels: subject,
      datasets: [
        {
          label: "成績",
          backgroundColor: "rgba(237,140,114,0.3)",
          borderColor: "#ed8c72",
          pointBackgroundColor: "rgba(237,140,114,1)",
          pointBorderColor: "#fff",
          pointHoverBackgroundColor: "#fff",
          pointHoverBorderColor: "rgba(237,140,114,1)",
          hitRadius: hitNum,
          data: score
        },
        {
          label: "平均点",
          backgroundColor: "rgba(41,136,188,0.3)",
          borderColor: "#2988bc",
          pointBackgroundColor: "#2988bc",
          pointBorderColor: "#fff",
          pointHoverBackgroundColor: "#fff",
          pointHoverBorderColor: "#2988bc",
          hitRadius: hitNum,
          data: average
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

window.addEventListener("load", createChart);