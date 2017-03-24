/**
 * Created by Emmanuel on 14/03/2017.
 */
$(document).ready(function(){

    $('.dropdown').on('show.bs.dropdown', function(e){
        $(this).find('.dropdown-menu').first().stop(true, true).slideDown(400);
    });

// Add slideUp animation to dropdown
    $('.dropdown').on('hide.bs.dropdown', function(e){
        $(this).find('.dropdown-menu').first().stop(true, true).slideUp(400);
    });
});