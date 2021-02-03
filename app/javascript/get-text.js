function getText(){
  const titleElm = document.getElementById("title");

  titleElm.addEventListener("change", function(){
    const titleText = document.forms.id_form.title.value;
    
    const avgTitle = document.getElementById("avg_title");
    avgTitle.value = titleText
  });

};
window.addEventListener("load", getText);
