

jQuery(document).ready(function() {
    var offset = 100;
    var duration = 500;
    jQuery(window).scroll(function() {
        if (jQuery(this).scrollTop() > offset) {
            jQuery('.return-to-top').fadeIn(duration);
        } else {
            jQuery('.return-to-top').fadeOut(duration);
        }
    });

    jQuery('.return-to-top').click(function(event) {
        event.preventDefault();
        jQuery('html, body').animate({scrollTop: 0}, duration);
        return false;
    })

    $('.location-filter').click( function() {
        $('.photo-and-patients-info').hide();
        $('.' + ($(this).attr('what'))).show();
        });

    $('#remove-filter').click( function() {
        $('.photo-and-patients-info').show();
    });

    $('.difficulty-filter').click( function() {
        $('.photo-and-patients-info').hide();
        $('.'+($(this).attr('what'))).show();
    });

});
