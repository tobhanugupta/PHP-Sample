<?php
/*
 * Travel Logic - ticket service front end functionality.
 */

//
// Constants
//

/**
 * This is a secret field name for identifying ticket search requests
 */
define( 'TLOGIC_TICKET_SEARCH_KEY', '7524d0d4c61a' );

//
// Functions
//

/**
 * Returns true if its a search request
 *
 * @return boolean
 */
 
function tlogic_frontend_is_ticket_search()
{
	//
	// get search key field value
	//die();
	 $search_key = tlogic_get_field_value( TLOGIC_TICKET_SEARCH_KEY );

	// if not not, its a search request
	return ( null !== $search_key );
}




function tlogic_frontend_do_ticket_search()
{
	
	echo 'search or not';
	if ( false === tlogic_frontend_is_ticket_search() ) {
		// not a search request...
		
	} else {
	
		return tlogic_frontend_do_ticket_results();
	}
}


function tlogic_frontend_do_ticket_results()
{

	// parse request
	//echo 'needs to search';
	$data = tlogic_frontend_parse_ticket_search();

    // validate request
    if ( true === tlogic_frontend_validate_ticket_search( $data ) ) {

        // new ticket search instance
        $search = new Travel_Logic_Ticket_Search();


		// data is valid, map fields
		$args = array(
            // TODO: While is not defined how the Language and Currency will be
            // set, this will be hardcoded here.
            'Language' => 'ENG',
            'Currency' => 'USD',

            'destination' => $data[ 'destination_code' ],
            'DateFrom'    => $data[ 'checkin' ],
            'DateTO'      => $data[ 'checkout' ],
            'Occupancy'   => array(
                'AdultCount' => $data[ 'num_adult' ],
                'ChildCount' => $data[ 'num_child' ],
                'ChildAges'  => tlogic_frontend_ticket_child_age(),
            )
		);

		//var_dump(json_encode($args));

		// make request
		$search->request( $args );

		// set up template instance
		tlogic_tickets_template( $search );

        // enqueue the generic JS script and set the variable
        add_action( 'wp_enqueue_scripts', 'enqueue_search_script' );

        // enqueue the specific JS script and set the variable
        add_action( 'wp_enqueue_scripts',
            'tlogic_frontend_enqueue_ticket_script' );
	}
}

function tlogic_frontend_enqueue_ticket_script()
{
    $handle = 'tlogic_result';

    // CONTROLLER
    wp_enqueue_script( $handle, TLOGIC_ASSETS_URL . '/tlogic-ticket-search.js',
        array( 'angular', 'angular-animate', 'underscore' ), '20150218_01',
        FALSE );

    $tlogic_ticket = tlogic_tickets_template()->toArray();

    $tlogic_ticket['config'] = array_merge( $tlogic_ticket['config'], array(
        'TLOGIC_ASSETS_URL' => TLOGIC_ASSETS_URL
    ) );

    wp_localize_script( $handle, $handle, $tlogic_ticket );
}

function tlogic_frontend_do_ticket_details()
{
	// new ticket details instance
	$details = new Travel_Logic_Ticket_Valuation();

	$args = filter_input_array( INPUT_GET, FILTER_SANITIZE_STRING );

	// make request
	$details->request( $args );

	// set up template instance
	tlogic_tickets_template( $details );

}

function tlogic_frontend_do_book_ticket()
{

    if (isset( $_POST['tlogic_customer_login'] )
            && !empty( $_POST['login_username'] ) ) {

        // new auth customer instance
        $customer_auth = new Travel_Logic_Customer_Auth();

        // TODO data validation
        $data = $_POST;

        // map fields
        $args = array(
            'UserName' => $data['login_username'],
            'Password' => $data['login_password']
        );

        // make request
        $customer_auth->request( $args );

    }
    elseif ( isset( $_POST[ 'tlogic_customer_login' ] ) ) {

        // new save customer instance
        $customer_save = new Travel_Logic_Customer_Save();

        // TODO data validation
        $data = $_POST;

        // map fields
        $args = array(
            'FirstName'       => $data['first_name'],
            'LastName'        => $data['last_name'],
            'MiddleName'      => $data['middle_name'],
            'Email'           => $data['email'],
            'HomePhone'       => $data['phone'],
            'Address'         => $data['address'],
            'City'            => $data['city'],
            'State'           => $data['state'],
            'ZipCode'         => $data['zip'],
            'UserName'        => $data['username'],
            'Password'        => $data['password'],
            'ConfirmPassword' => $data['password_again']
        );

        // make request
        $customer_save->request( $args );

        $error = $customer_save->error();

        if ( $error ) {
            // var_dump('// TODO: VALIDATION ERROR', $error['errors'] );
        }

    }
    elseif ( isset( $_POST[ 'tlogic_customer_book' ] ) ) {

        // new ticket details instance
        $confirmation = new Travel_Logic_Ticket_Confirm_Booking();

        $args_get  = filter_input_array( INPUT_GET, FILTER_SANITIZE_STRING );
        $args_post = filter_input_array( INPUT_POST, FILTER_SANITIZE_STRING );

        $args = array_merge( $args_get, $args_post );

        // make request
        $confirmation->request( $args );

        // set up template instance
        tlogic_tickets_template( $confirmation );
        // die( 'do not know what to do...' );
    }
    else {

        // new ticket details instance
        $details = new Travel_Logic_Ticket_Book_Ticket();

        $args = filter_input_array( INPUT_GET, FILTER_SANITIZE_STRING );

        // make request
        $details->request( $args );

        // set up template instance
        tlogic_tickets_template( $details );
    }

}

/**
 * Return array of valid and normalized fields from ticket search request
 *
 * @return array
 */
function tlogic_frontend_parse_ticket_search()
{
	// data array to return
	$data = array();

	// valid fields
	$fields = array(
		'destination',
		'checkin',
		'checkout',
		'num_adult',
		'num_child'
	);

	// loop all fields
	foreach ( $fields as $field_name ) {
		// get trimmed value
		$raw_value = tlogic_get_field_value( $field_name );
		// check for emptiness
		if ( $raw_value != null && $raw_value !== '' ) {
			// append to data
			$data[ $field_name ] = ( is_numeric( $raw_value ) ) ? (integer) $raw_value : $raw_value ;
		} else {
			// set it to null
			$data[ $field_name ] = null;
		}
	}

	// days and months need zero padding
	/*$fields_to_pad = array(
		'checkin_month',
		'checkin_day',
		'checkout_month',
		'checkout_day'
	);

	// left pad each on to two places
	foreach( $fields_to_pad as $field ) {
		$data[ $field ] = str_pad( $data[ $field ], 2, '0', STR_PAD_LEFT );
	}*/

	// get destination code
	$matches = array();

	// try to match the airport code
	if ( preg_match( '#\(([A-Z]{3})\)#', $data['destination'], $matches ) ) {
		// its offset 1
		$data['destination_code'] = $matches[1];
	}

	// return parsed data
	return $data;
}

/**
 * Validate an array of search form data
 *
 * @param array $d Raw data to validate
 * @return boolean
 */
function tlogic_frontend_validate_ticket_search( $d )
{
	// error templates
	$tpls = array(
		'form-field-required' => __( 'This field cannot be empty.', 'travel-logic' ),
		'form-field-maxlen' => __( 'Enter less than %d characters.', 'travel-logic' ),
		'form-field-checkdate' => __( 'The date entered is not valid.', 'travel-logic' ),
		'form-field-datepassed' => __( 'The date entered has already passed.', 'travel-logic' ),
		'form-field-intlen' => __( 'Enter a number between %d and %d.', 'travel-logic' )
	);

	// check if each is null
	foreach( $d as $field_name => $value ) {
		// is it null?
		if ( null === $value ) {
			// add error
			tlogic_frontend_errors()->add(
				$field_name,
				$tpls[ 'form-field-required' ]
			);
		}
	}

	// destination
	if ( strlen( $d[ 'destination' ] ) > 128 ) {
		tlogic_frontend_errors()->add(
			'destination',
			sprintf( $tpls[ 'form-field-maxlen' ], 128 )
		);
	}

	// destination code
	if ( false === isset( $d[ 'destination_code' ] ) ) {
		tlogic_frontend_errors()->add(
			'destination',
			__( 'Missing airport code.', 'travel-logic' )
		);
	}

	// checkin_month, checkin_day, checkin_year
	/*if ( true !== checkdate( $d[ 'checkin' ] ) ) {
		tlogic_frontend_errors()->add(
			'checkin',
			$tpls[ 'form-field-checkdate' ]
		);
	}*/

	// has checkin date passed?
	/*if ( true === tlogic_date_has_passed( $d[ 'checkin' ] ) ) {
		tlogic_frontend_errors()->add(
			'checkin',
			$tpls[ 'form-field-datepassed' ]
		);
	}

	// checkout_month, checkout_day, checkout_year
	if ( true !== checkdate( $d[ 'checkout' ] ) ) {
		tlogic_frontend_errors()->add(
			'checkout',
			$tpls[ 'form-field-checkdate' ]
		);
	}

	// has checkout date passed?
	if ( true === tlogic_date_has_passed( $d[ 'checkout' ] ) ) {
		tlogic_frontend_errors()->add(
			'checkout',
			$tpls[ 'form-field-datepassed' ]
		);
	}*/

	// num_adult
	if ( $d[ 'num_adult' ] < 1 || $d[ 'num_adult' ] > 10 ) {
		tlogic_frontend_errors()->add(
			'num_adult',
			sprintf( $tpls[ 'form-field-intlen' ], 1, 10 )
		);
	}

	// num_child
	if ( $d[ 'num_child' ] < 0 || $d[ 'num_child' ] > 10 ) {
		tlogic_frontend_errors()->add(
			'num_child',
			sprintf( $tpls[ 'form-field-intlen' ], 0, 10 )
		);
	}

	return ( !tlogic_frontend_has_errors() );
}

function tlogic_frontend_ticket_child_age()
{
    $children_count = intval( $_GET[ 'num_child' ] );

    if ( ! $children_count ) {
        return array();
    }

    $child_ages = array();
	for ( $x = 1; $x <= $children_count; $x++ ) {
        $child_age = $_GET[ 'child_age' . $x ];
		$child_age && array_push( $child_ages, $child_age );
	}

	return $child_ages;
}
