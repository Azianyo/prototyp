jQuery(document).ready(function() {

    var img = document.getElementsById("big-photo");

    img.hover=function(){
        this.style.width=img.naturalWidth;
        this.style.height=img.naturalHeight;
    },function(){
        this.style.width="200px";
        this.style.height="200px";
    });

 });
