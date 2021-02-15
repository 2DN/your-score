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
              type: 'line',
              data: {
                  labels: ["第1回", "第2回", "第3回", "第4回", "第5回", "第6回"],
                  datasets: [{
                      label: "成績推移",
                      backgroundColor: "rgba(237, 140, 114, 0.5)",
                      borderColor: "rgb(237, 140, 114)",
                      data: scores
                  },
                  {
                      label: "平均点推移",
                      backgroundColor: "rgba(41, 136, 188, 0.5)",
                      borderColor: "rgb(41, 136, 188)",
                      data: averages
                  }]
              },
              options: {
                  responsive: true,
                  maintainAspectRatio: false,
                  scales: {
                      yAxes: [{
                          ticks: {
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
  
  if (document.URL.match(/transition/)){
    window.addEventListener("load", transitionChart);
  }