<?php
/*
 * Travel Logic - car service shortcode callbacks.
 */

/**
 * Output the car search form
 *
 * @param array $atts
 * @return void
 */
function tlogic_sc_car_search( $atts )
{
	if ( false === tlogic_frontend_is_car_search() || true === tlogic_frontend_has_errors() ) {
		tlogic_load_template( 'car/search-form.php' );
	} else {
		tlogic_load_template( 'car/search-results.php' );
	}
}
add_shortcode( 'tlogic_car_search', 'tlogic_sc_car_search' );

/**
 * Output the details of one car
 *
 * @param array $atts
 * @return void
 */
function tlogic_sc_car_details( $atts )
{
	tlogic_load_template( 'car/details.php' );
}
add_shortcode( 'tlogic_car_details', 'tlogic_sc_car_details' );

/**
 * Output the book car screen
 *
 * @param array $atts
 * @return void
 */
function tlogic_sc_book_car( $atts )
{
    tlogic_load_template( 'car/book-car.php' );
}
add_shortcode( 'tlogic_book_car', 'tlogic_sc_book_car' );

/**
 * Output the booking confirmation screen
 *
 * @param array $atts
 * @return void
 */
function tlogic_sc_car_conf( $atts )
{
    tlogic_load_template( 'car/book-conf.php' );
}
add_shortcode( 'tlogic_car_conf', 'tlogic_sc_car_conf' );
