window.setInterval(function () {
    var offset = $("#header").offset();
    var pos = offset.top + 126 - $(window).scrollTop();
    if (pos < 0) {
        $("#nnt-menu").removeClass("nnt-menu-hidden");
    } else {
        $("#nnt-menu").addClass("nnt-menu-hidden");
    }
}, 10);