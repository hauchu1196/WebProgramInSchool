$('.btn-login').click(function () {
    $(".login-form" ).addClass( "active" );
    $( ".register-form" ).removeClass( "active" )
});
$('.btn-register').click(function () {
    $(".register-form" ).addClass( "active" );
    $( ".login-form" ).removeClass( "active" )
});