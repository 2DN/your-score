function createChart(){
  var chart;
  console.log(gon.array_score)
  console.log(gon.array_average)
  console.log(gon.array_subject)
  const ctx = document.getElementById("myBarChart");
  if( chart ){
    chart.destroy();
  }
  chart = new Chart(ctx, {
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
        // backgroundColor: ["#ff7f7f", "#80b3ff", "#80ffb3", "#e6ff80", "#e680ff"],
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
};

window.addEventListener("load", createChart);