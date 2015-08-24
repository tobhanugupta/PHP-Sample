<?php
/*
 * Travel Logic - ticket service template tags
 */

/**
 * Print the ticket search form action URL
 */
function tlogic_the_ticket_search_action()
{
	echo tlogic_page_permalink( 'ticket-search' );
}

/**
 * Print the ticket search control group error class (if any)
 */
function tlogic_the_ticket_search_ctrlgrp_class( $field_name )
{
	// does this field have an error?
	if ( tlogic_frontend_has_error( $field_name ) ) {
		// yes, spit out the error class
		echo ' error';
	}
}

/**
 * Print the ticket search field value (if any)
 */
function tlogic_the_ticket_search_field_value( $field_name, $default = null )
{
	// get the value
	$value = tlogic_get_field_value( $field_name );

	// handle defaults
	if ( ( null === $value || '' === $value ) && null !== $default ) {
		$value = $default;
	}

	// spit it out escaped
	echo esc_attr( $value );
}

/**
 * Print the ticket search field error (if any)
 */
function tlogic_the_ticket_search_field_error( $field_name )
{
	// does this field have an error?
	if ( tlogic_frontend_has_error( $field_name ) ) {
		// yes, set the error message template variable
		$message = tlogic_frontend_errors()->get_error_message( $field_name );
		// locate template path
		$template = tlogic_locate_template( 'ticket/search-error.php' );
		// include it
		include $template;
	}
}

/**
 * Render list of select options for the number of adults field
 */
function tlogic_the_ticket_search_num_adult_options()
{
	// fill array where keys match values
	$options = range( 0, 10 );

	// remove first item
	unset( $options[ 0 ] );

	// render the options
	tlogic_select_option_list( 'num_adult', $options );
}

/**
 * Render list of select options for the number of children field
 */
function tlogic_the_ticket_search_num_child_options()
{
	// fill array where keys match values
	$options = range( 0, 5 );
    //$options = range( 0, 0 );

	// render the options
	tlogic_select_option_list( 'num_child', $options );
}

//
// Search results tags
//

/**
 * Return tickets template instance
 *
 * @param Travel_Logic_Request $request
 * @param array $args
 * @return Travel_Logic_Tickets_Template
 * @throws Exception
 */
function tlogic_tickets_template( $request = null, $args = array() )
{
	global $tlogic_tickets_template;

    // is request a valid object
    if ( $request instanceof Travel_Logic_Request ) {
        // set up template instance
        $tlogic_tickets_template = new Travel_Logic_Tickets_Template( $request, $args );
    }

    // return current template instance
    if ( $tlogic_tickets_template instanceof Travel_Logic_Tickets_Template ) {
        return $tlogic_tickets_template;
    } else {
		throw new Exception( 'You forgot to initialize the template!' );
	}
}

function tlogic_has_tickets()
{
	return tlogic_tickets_template()->has_items();
}

function tlogic_tickets()
{
	return tlogic_tickets_template()->items();
}

function tlogic_tickets_pagination()
{
	echo tlogic_tickets_template()->pagination();
}

function tlogic_the_ticket()
{
    return tlogic_tickets_template()->the_item();
}

function tlogic_the_ticket_info()
{
	return tlogic_tickets_template()->the_item_property( 'TicketInfo' );
}

function tlogic_the_ticket_available_modality()
{
    $modality = tlogic_tickets_template()->the_item_property( 'AvailableModality' );
    return $modality[0];
}

function tlogic_the_ticket_name()
{
    echo tlogic_get_the_ticket_name();
}
    function tlogic_get_the_ticket_name()
    {
        return tlogic_the_ticket_info()->Name;
    }

function tlogic_the_ticket_date_from()
{
    echo tlogic_get_the_ticket_date_from();
}
    function tlogic_get_the_ticket_date_from()
    {
        $date = DateTime::createFromFormat( 'Ymd',
            tlogic_tickets_template()->the_item_property( 'DateFrom' )->Date);

        return $date->format( 'm/d/Y' );
    }

function tlogic_the_ticket_date_to()
{
	echo tlogic_get_the_ticket_date_to();
}
	function tlogic_get_the_ticket_date_to()
	{
		$date = DateTime::createFromFormat( 'Ymd',
            tlogic_tickets_template()->the_item_property( 'DateTo' )->Date);

        return $date->format( 'm/d/Y' );
	}

function tlogic_the_ticket_modality_name()
{
    echo tlogic_get_the_ticket_modality_name();
}
    function tlogic_get_the_ticket_modality_name()
    {
        return tlogic_the_ticket_available_modality()->Name;
    }

function tlogic_the_ticket_total()
{
    echo number_format( tlogic_get_the_ticket_total(), 2 );
}
    function tlogic_get_the_ticket_total()
    {
        return tlogic_tickets_template()->the_item_property( 'TotalAmount' );
    }

function tlogic_get_ticket_all_comments()
{
    return tlogic_tickets_template()->the_item_property( 'CommentList' );
}

function tlogic_the_ticket_book_permalink()
{
    echo tlogic_page_permalink( 'book-ticket' ) . '?' . http_build_query( $_GET );

}

function tlogic_the_ticket_confirmation_date_from()
{
    echo tlogic_get_the_ticket_confirmation_date_from();
}
    function tlogic_get_the_ticket_confirmation_date_from()
    {
        $service = tlogic_tickets_template()->the_item_property( 'ServiceList' );
        $date = DateTime::createFromFormat( 'Ymd', $service[0]->DateFrom->Date);

        return $date->format( 'm/d/Y' );
    }

function tlogic_the_ticket_confirmation_date_to()
{
    echo tlogic_get_the_ticket_confirmation_date_to();
}
    function tlogic_get_the_ticket_confirmation_date_to()
    {
        $service = tlogic_tickets_template()->the_item_property( 'ServiceList' );
        $date = DateTime::createFromFormat( 'Ymd', $service[0]->DateTo->Date);

        return $date->format( 'm/d/Y' );
    }

function tlogic_the_ticket_confirmation_total()
{
    echo number_format( tlogic_get_the_ticket_confirmation_total(), 2 );
}
    function tlogic_get_the_ticket_confirmation_total()
    {
        $service = tlogic_tickets_template()->the_item_property( 'ServiceList' );
        return $service[0]->TotalAmount;
    }

function tlogic_get_ticket_confirmation_all_comments()
{
    $service = tlogic_tickets_template()->the_item_property( 'ServiceList' );
    return $service[0]->CommentList;
}
