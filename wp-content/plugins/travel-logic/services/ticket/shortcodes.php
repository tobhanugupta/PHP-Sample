<?php
/*
 * Travel Logic - ticket service shortcode callbacks.
 */

/**
 * Output the ticket search form
 *
 * @param array $atts
 * @return void
 */
function tlogic_sc_ticket_search( $atts )
{
	if ( false === tlogic_frontend_is_ticket_search() || true === tlogic_frontend_has_errors() ) {
		tlogic_load_template( 'ticket/search-form.php' );
	} else {
		tlogic_load_template( 'ticket/search-results.php' );
	}
}
add_shortcode( 'tlogic_ticket_search', 'tlogic_sc_ticket_search' );

/**
 * Output the details of one ticket
 *
 * @param array $atts
 * @return void
 */
function tlogic_sc_ticket_details( $atts )
{
	tlogic_load_template( 'ticket/details.php' );
}
add_shortcode( 'tlogic_ticket_details', 'tlogic_sc_ticket_details' );

/**
 * Output the book ticket screen
 *
 * @param array $atts
 * @return void
 */
function tlogic_sc_book_ticket( $atts )
{
    tlogic_load_template( 'ticket/book-ticket.php' );
}
add_shortcode( 'tlogic_book_ticket', 'tlogic_sc_book_ticket' );

/**
 * Output the booking confirmation screen
 *
 * @param array $atts
 * @return void
 */
function tlogic_sc_ticket_conf( $atts )
{
    tlogic_load_template( 'ticket/book-conf.php' );
}
add_shortcode( 'tlogic_ticket_conf', 'tlogic_sc_ticket_conf' );
