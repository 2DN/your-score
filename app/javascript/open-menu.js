function openMenu(){
  document.getElementById("menus").style.display = "none";
  const menuBtn = document.getElementById("menu-btn");
  menuBtn.addEventListener("click", function(e){
    e.preventDefault();
    const menus = document.getElementById("menus")
    if(menus.style.display=="block"){
      menus.style.display = "none";
    }else{
      menus.style.display = "block";
    }
  });
}
window.addEventListener("load", openMenu);
