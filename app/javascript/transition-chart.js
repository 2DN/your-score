function transitionChart(){
  var myLineChart;
  const submitBtn = document.getElementById("submit-btn");
  submitBtn.addEventListener("click", function(e){
    e.preventDefault();
    const formData = new FormData(document.getElementById("search-form"));
    const idForParams = formData.get("keyword")

    const XHR = new XMLHttpRequest();
    XHR.open('GET', `/scores/${idForParams}/search`, true);
    XHR.responseType = "json";
    XHR.send();

    XHR.onload = function() {
        const scores =  XHR.response.scores
        const averages = XHR.response.averages
        console.log(averages)
        
        const ctx = document.getElementById("myLineChart");
            if(myLineChart){
                myLineChart.destroy();
            }
            myLineChart = new Chart(ctx, {
            //グラフの種類
            type: 'line',
            //データの設定
            data: {
                //データ項目のラベル
                labels: ["第1回", "第2回", "第3回", "第4回", "第5回", "第6回"],
                //データセット
                datasets: [{
                    //凡例
                    label: "成績推移",
                    //背景色
                    backgroundColor: "rgba(75,192,192,0.4)",
                    //枠線の色
                    borderColor: "rgba(75,192,192,1)",
                    //グラフのデータ
                    data: scores
                },
                {
                    //凡例
                    label: "平均点推移",
                    //背景色
                    backgroundColor: "rgba(75,192,192,0.4)",
                    //枠線の色
                    borderColor: "rgba(75,192,192,1)",
                    //グラフのデータ
                    data: averages
                }]
            },
            //オプションの設定
            options: {
                scales: {
                    //縦軸の設定
                    yAxes: [{
                        ticks: {
                            //最小値を0にする
                            beginAtZero: true,
                            max: 1000
                        }
                    }]
                }
            }
        });
    };
  }); 
};

window.addEventListener("load", transitionChart);