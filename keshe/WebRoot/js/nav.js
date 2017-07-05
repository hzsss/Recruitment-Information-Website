
(function () {
  var links = document.querySelectorAll(".mynav a");

  function mouseenterFunc() {
    if (!this.parentNode.classList.contains("active")) {//classList属性返回元素的类名，该元素用于在元素中添加，移除及切换css类
      // classList和addClass的区别  没什么区别
      for (var i = 0; i < links.length; i++) {
        if (links[i].parentNode.classList.contains("active")) {
          // "abc".contains("d") 返回true；
          links[i].parentNode.classList.remove("active");
        }
        links[i].style.opacity = "0.6";
      }

      this.parentNode.classList.add("active");
      this.style.opacity = "1";
      }
  }

  for (var i = 0; i < links.length; i++) {
    links[i].addEventListener("mouseenter", mouseenterFunc);
  }


  function resizeFunc() {
    var active = document.querySelector(".mynav li.active");

    if (active){
      var left = active.getBoundingClientRect().left + window.pageXOffset;
      var top = active.getBoundingClientRect().top + window.pageYOffset;
    }
  }

  window.addEventListener("resize", resizeFunc);
})();