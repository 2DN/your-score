function createChart(){
  var barChart;
  var radarChart;

  const hitNum = gon.array_score.length
  
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
        backgroundColor: "rgba(200,112,126)",
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
          backgroundColor: "rgba(200,112,126,0.3)",
          borderColor: "#ff7373",
          pointBackgroundColor: "rgba(200,112,126,1)",
          pointBorderColor: "#fff",
          pointHoverBackgroundColor: "#fff",
          pointHoverBorderColor: "rgba(200,112,126,1)",
          hitRadius: hitNum,
          data: gon.array_score
        },
        {
          label: "平均点",
          backgroundColor: "rgba(80,126,164,0.3)",
          borderColor: "#80b3ff",
          pointBackgroundColor: "rgba(80,126,164,1)",
          pointBorderColor: "#fff",
          pointHoverBackgroundColor: "#fff",
          pointHoverBorderColor: "rgba(80,126,164,1)",
          hitRadius: hitNum,
          data: gon.array_average
        }
      ]
    },
    options: {
      scale: {
        ticks: {
          beginAtZero: true,
          min: 0,
          max: 200,
        }
      }
    }
  });
};

window.addEventListener("load", createChart);