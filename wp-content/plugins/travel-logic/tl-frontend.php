<?php
/*
 * Travel Logic - front end functionality
 */

//
// Functions
//

function tlogic_frontend_init()
{
	global $post;

	// are we on a page?
	if ( is_page() ) {

		// get associated page ids
		$tl_pages = array(
			'hotel-search'  => tlogic_get_setting( 'global', 'pages', 'hotel-search' ),
			'hotel-details' => tlogic_get_setting( 'global', 'pages', 'hotel-details' ),
			'book-room'     => tlogic_get_setting( 'global', 'pages', 'book-room' ),

            'ticket-search'  => tlogic_get_setting( 'global', 'pages', 'ticket-search' ),
            'ticket-details' => tlogic_get_setting( 'global', 'pages', 'ticket-details' ),
            'book-ticket'    => tlogic_get_setting( 'global', 'pages', 'book-ticket' ),

            'car-search'  => tlogic_get_setting( 'global', 'pages', 'car-search' ),
            'car-details' => tlogic_get_setting( 'global', 'pages', 'car-details' ),
            'book-car'    => tlogic_get_setting( 'global', 'pages', 'book-car' ),
			
			'transfer-search'  => tlogic_get_setting( 'global', 'pages', 'transfer-search' ),
            'transfer-details' => tlogic_get_setting( 'global', 'pages', 'transfer-details' ),
           /* 'book-transfer'    => tlogic_get_setting( 'global', 'pages', 'book-transfer' )*/
		);

		// flip array so ids are keys
		$tl_pages_byid = array_flip( $tl_pages );

        // current page id one of the travel logic pages?
        if ( array_key_exists( $post->ID, $tl_pages_byid ) ) {
			// yep, call relevant function
			switch( $tl_pages_byid[ $post->ID ] ) {

                // Hotel Service
				case 'hotel-search':
					return tlogic_frontend_do_hotel_search();
				case 'hotel-details':
					return tlogic_frontend_do_hotel_details();
				case 'book-room':
					return tlogic_frontend_do_book_room();

                // Ticket Service
                case 'ticket-search':
                    return tlogic_frontend_do_ticket_search();
                case 'ticket-details':
                    return tlogic_frontend_do_ticket_details();
                case 'book-ticket':
                    return tlogic_frontend_do_book_ticket();

                // Car Rental Service
                case 'car-search':
                    return tlogic_frontend_do_car_search();
                case 'car-details':
                    return tlogic_frontend_do_car_details();
                case 'book-car':
                    return tlogic_frontend_do_book_car();
					
					
				 // Transfer Service
                case 'transfer-search':
                    return tlogic_frontend_do_transfer_search();
                case 'transfer-details':
                    return tlogic_frontend_do_transfer_details();
                case 'book-transfer':
                    return tlogic_frontend_do_book_transfer();	
			}
		}
	}
	
	
}
add_action( 'wp', 'tlogic_frontend_init' );


function enqueue_search_script()
{
	// ANGULAR
	wp_enqueue_script( 'angular', TLOGIC_ASSETS_URL . '/angular.min.js',
		array(), '20141114_001', FALSE );

    wp_enqueue_script( 'angular-animate', TLOGIC_ASSETS_URL . '/angular-animate.min.js',
        array( 'angular' ), '20141114_001', FALSE );

	wp_enqueue_script( 'angular-sanitize', TLOGIC_ASSETS_URL . '/angular-sanitize.min.js',
		array( 'angular' ), '20141114_001', FALSE );

	// PAGINATION
    // depends on 'tlogic_result' that are defined in the specific services
    // frontend files
	wp_enqueue_script( 'dirPagination', TLOGIC_ASSETS_URL . '/dirPagination.js',
		array( 'angular', 'tlogic_result' ), '20141114_001', FALSE );

    // UNDERSCORE
    wp_enqueue_script( 'underscore', TLOGIC_ASSETS_URL . '/underscore-min.js',
        array(), '20141114_001', FALSE );

    // MOMENT
    wp_enqueue_script( 'moment', TLOGIC_ASSETS_URL . '/moment.min.js',
        array(), '20141114_001', FALSE );

	// ANIMATIONS CSS
	wp_enqueue_style( 'tlogic-animations', TLOGIC_ASSETS_URL . '/tlogic-animations.css',
		array( ), '20141114_001' );
		
	
}

/**
 * Return singleton error object
 *
 * @return WP_Error
 */
function tlogic_frontend_errors()
{
	global $tlogic_frontend_errors;

	if ( !$tlogic_frontend_errors instanceof WP_Error ) {
		$tlogic_frontend_errors = new WP_Error();
	}

	return $tlogic_frontend_errors;
}

/**
 * Returns true if error object has one or more errors
 *
 * @return boolean
 */
function tlogic_frontend_has_errors()
{
	global $tlogic_frontend_errors;

	return is_wp_error( $tlogic_frontend_errors );
}

/**
 * Returns true if error object has error code
 *
 * @return boolean
 */
function tlogic_frontend_has_error( $code )
{
	$errors = tlogic_frontend_parse_errors();

	// any errors?
	if ( tlogic_frontend_has_errors() ) {
		// get all errors
		$errors = tlogic_frontend_parse_errors();
		// does key exist?
		return array_key_exists( $code, $errors );
	}

	return false;
}

/**
 * Return array of errors formated like: code => message
 *
 * @return array
 */
function tlogic_frontend_parse_errors()
{
	global $tlogic_frontend_parse_errors;

	// populate if empty
	if ( null === $tlogic_frontend_parse_errors ) {
		// any errors?
		if ( tlogic_frontend_has_errors() ) {
			// yep, parse em.
			foreach( tlogic_frontend_errors()->get_error_codes() as $code ) {
				// build up array
				$tlogic_frontend_parse_errors[ $code ] = tlogic_frontend_errors()->get_error_message( $code );
			}
		} else {
			$tlogic_frontend_parse_errors = array();
		}
	}

	return $tlogic_frontend_parse_errors;
}

?>
