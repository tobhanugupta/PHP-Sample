<?php
/*
 * Travel Logic - hotel service shortcode callbacks.
 */

/**
 * Output the hotel search form
 *
 * @param array $atts
 * @return void
 */
function tlogic_sc_hotel_search( $atts )
{
	if ( false === tlogic_frontend_is_hotel_search() || true === tlogic_frontend_has_errors() ) {
		tlogic_load_template( 'hotel/search-form.php' );
	} else {
		tlogic_load_template( 'hotel/search-results.php' );
	}
}
add_shortcode( 'tlogic_hotel_search', 'tlogic_sc_hotel_search' );

/**
 * Output the details of one hotel
 *
 * @param array $atts
 * @return void
 */
function tlogic_sc_hotel_details( $atts )
{
	tlogic_load_template( 'hotel/details.php' );
}
add_shortcode( 'tlogic_hotel_details', 'tlogic_sc_hotel_details' );

/**
 * Output the book room screen
 *
 * @param array $atts
 * @return void
 */
function tlogic_sc_book_room( $atts )
{
	tlogic_load_template( 'hotel/book-room.php' );
}
add_shortcode( 'tlogic_book_room', 'tlogic_sc_book_room' );

/**
 * Output the booking confirmation screen
 *
 * @param array $atts
 * @return void
 */
function tlogic_sc_book_conf( $atts )
{
	tlogic_load_template( 'hotel/book-conf.php' );
}
add_shortcode( 'tlogic_book_conf', 'tlogic_sc_book_conf' );