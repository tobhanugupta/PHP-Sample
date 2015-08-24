<?php
/*
 * Travel Logic - transfer service shortcode callbacks.
 */

/**
 * Output the transfer search form
 *
 * @param array $atts
 * @return void
 */
 

function tlogic_sc_transfer_search( $atts )
{
	if ( false === tlogic_frontend_is_transfer_search() || true === tlogic_frontend_has_errors() ) {
		tlogic_load_template( 'transfer/search-form.php' );
	} else {
		tlogic_load_template( 'transfer/search-results.php' );
	}
}
add_shortcode( 'tlogic_transfer_search', 'tlogic_sc_transfer_search' );

/**
 * Output the details of one transfer
 *
 * @param array $atts
 * @return void
 */
function tlogic_sc_transfer_details( $atts )
{
	tlogic_load_template( 'transfer/details.php' );
}
add_shortcode( 'tlogic_transfer_details', 'tlogic_sc_transfer_details' );

/**
 * Output the book transfer screen
 *
 * @param array $atts
 * @return void
 */
function tlogic_sc_book_transfer( $atts )
{
    tlogic_load_template( 'transfer/book-transfer.php' );
}
add_shortcode( 'tlogic_book_transfer', 'tlogic_sc_book_transfer' );

/**
 * Output the booking confirmation screen
 *
 * @param array $atts
 * @return void
 */
function tlogic_sc_transfer_conf( $atts )
{
    tlogic_load_template( 'transfer/book-conf.php' );
}
add_shortcode( 'tlogic_transfer_conf', 'tlogic_sc_transfer_conf' );
