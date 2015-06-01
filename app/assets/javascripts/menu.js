// Shorthand for $( document ).ready()
$(function() {
    $('#menuLink').on('click', function (e) {
        e.preventDefault();
        $('#layout').toggleClass('active');
        $('#menu').toggleClass('active');
        $(this).toggleClass('active');
    });
});