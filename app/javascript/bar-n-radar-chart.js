function bothCharts(){
  var barChart;
  var radarChart;

  
  
  const ctx1 = document.getElementById("myBarChart");
  if( barChart ){
    barChart.destroy();
  }
  barChart = new Chart(ctx1, {
    // グラフの種類
    type: 'bar',
    // データの設定
    data: {
      // データ項目のラベル
      labels: gon.array_subject,
      // データセット
      datasets: [{
        // 凡例
        label: "成績",
        // 背景色
        backgroundColor: gon.array_color,
        // 枠線の色
        // borderColor: [],
        // 枠線の幅
        // borderWidth: 10,
        // グラフのデータ
        data: gon.array_score
      }]
    },
    // オプションの設定
    options: {
      responsive: true,
      maintainAspectRatio: false,
      // 軸の設定
      scales: {
        // 縦軸の設定
        yAxes: [{
          ticks: {
            // 開始値を0にする
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
          // hitRadius: hitNum,
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
          // hitRadius: hitNum,
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