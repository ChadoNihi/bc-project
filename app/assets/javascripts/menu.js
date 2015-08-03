// Shorthand for $( document ).ready()
$(document).on('ready page:load', function(event) {
    $('#menuLink').on('click', function (e) {
        e.preventDefault();
        $('#layout').toggleClass('active');
        $('#menu').toggleClass('active');
        $(this).toggleClass('active').addClass('pure-menu-selected');
    });
});