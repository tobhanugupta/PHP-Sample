<?php
/*
 * Travel Logic - hotel service front end functionality.
 */

//
// Constants
//

/**
 * This is a secret field name for identifying hotel search requests
 */
define( 'TLOGIC_HOTEL_SEARCH_KEY', '690b7f01da8a' );

//
// Functions
//

/**
 * Returns true if its a search request
 *
 * @return boolean
 */
function tlogic_frontend_is_hotel_search()
{
	// get search key field value
	$search_key = tlogic_get_field_value( TLOGIC_HOTEL_SEARCH_KEY );

	// if not not, its a search request
	return ( null !== $search_key );
}

function tlogic_frontend_do_hotel_search()
{
	if ( false === tlogic_frontend_is_hotel_search() ) {
		// not a search request...
	} else {
		return tlogic_frontend_do_hotel_results();
	}
}

function tlogic_frontend_do_hotel_results()
{
	// parse request
	$data = tlogic_frontend_parse_hotel_search();

	// validate request
	if ( true === tlogic_frontend_validate_hotel_search( $data ) ) {

		// new hotel search instance
		$search = new Travel_Logic_Hotel_Search();

		// data is valid, map fields
		$args = array(
			'destination' => $data['destination_code'],
			//'checkIn' => $data[ 'checkin_month' ] . '/' . $data[ 'checkin_day' ] . '/' . $data[ 'checkin_year' ],
            'checkIn' => $data[ 'checkin' ],
            'checkOut' => $data[ 'checkout' ],
			//'checkOut' => $data[ 'checkout_month' ] . '/' . $data[ 'checkout_day' ] . '/' . $data[ 'checkout_year' ],
			//'rooms' => (string) $data[ 'num_room' ],
			//'adults' => (string) $data[ 'num_adult' ],
			//'childrens' => (string) $data[ 'num_child' ]
			'RoomsInformation' => tlogic_frontend_hotel_room_info(),
			"HotelSupplier" => $_GET['hotelSupplier'],

			//Optional parameters
			"orderByHotelName"      => $_GET['orderByHotelName'], //"ASC"
			"orderByHotelPrice"     => $_GET['orderByHotelPrice'], //"ASC"
			"filterByStarRating"    => $_GET['filterByStarRating'], //"true"
			"starRatingFilterValue" => $_GET['starRatingFilterValue'], //"3"
			"filterByPriceRange"    => $_GET['filterByPriceRange'], //"true"
			"priceRangeFilterStart" => $_GET['priceRangeFilterStart'], //"100"
			"priceRangeFilterEnd"   => $_GET['priceRangeFilterEnd'] //"200"

		);

		//var_dump(json_encode($args));

		// make request
		$search->request( $args );

		// set up template instance
		tlogic_hotels_template( $search );

		// enqueue the generic JS script and set the variable
		add_action( 'wp_enqueue_scripts', 'enqueue_search_script' );

        // enqueue the specific JS script and set the variable
        add_action( 'wp_enqueue_scripts',
            'tlogic_frontend_enqueue_hotel_script' );
	}
}

function tlogic_frontend_enqueue_hotel_script()
{
    $handle = 'tlogic_result';

    // CONTROLLER
    wp_enqueue_script( $handle, TLOGIC_ASSETS_URL . '/tlogic-hotel-search.js',
        array( 'angular', 'angular-animate', 'underscore' ), '20150218_01',
        FALSE );

    $tlogic_hotel = tlogic_hotels_template()->toArray();

    $tlogic_hotel['config'] = array_merge( $tlogic_hotel['config'], array(
        'TLOGIC_ASSETS_URL' => TLOGIC_ASSETS_URL
    ) );

    wp_localize_script( $handle, $handle, $tlogic_hotel );
}

function tlogic_frontend_do_hotel_details()
{
	// have hotel id?
   //var_dump($_GET['page_id']);
	if ( isset( $_GET['id'] ) ) {

		// new hotel details instance
		$details = new Travel_Logic_Hotel_Details();

		$args = filter_input_array( INPUT_GET, FILTER_SANITIZE_STRING );

		// make request
		$details->request( $args );

		// set up template instance
		tlogic_hotels_template( $details );

	} else {
		throw new Travel_Logic_Exception( 'Missing hotel id' );
	}
}

function tlogic_frontend_do_book_room()
{
	if (
		isset( $_POST['tlogic_customer_login'] ) &&
		!empty( $_POST['login_username'] )
	) {

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

	} elseif ( isset( $_POST['tlogic_customer_login'] ) ) {

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

	} elseif ( isset( $_POST['tlogic_customer_book'] ) ) {
		// just fall through for now

	}
}

/**
 * Return array of valid and normalized fields from hotel search request
 *
 * @return array
 */
function tlogic_frontend_parse_hotel_search()
{
	// data array to return
	$data = array();

	// valid fields
	$fields = array(
		'destination',
		'checkin',
		'checkout',
		'num_room',
		'num_adult_1',
		'num_child_1'
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
function tlogic_frontend_validate_hotel_search( $d )
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

	// num_room
	if ( $d[ 'num_room' ] < 1 || $d[ 'num_room' ] > 100 ) {
		tlogic_frontend_errors()->add(
			'num_room',
			sprintf( $tpls[ 'form-field-intlen' ], 1, 100 )
		);
	}

	// num_adult
	if ( $d[ 'num_adult_1' ] < 1 || $d[ 'num_adult_1' ] > 10 ) {
		tlogic_frontend_errors()->add(
			'num_adult_1',
			sprintf( $tpls[ 'form-field-intlen' ], 1, 10 )
		);
	}

	// num_child
	if ( $d[ 'num_child_1' ] < 0 || $d[ 'num_child_1' ] > 10 ) {
		tlogic_frontend_errors()->add(
			'num_child_1',
			sprintf( $tpls[ 'form-field-intlen' ], 0, 10 )
		);
	}

	return ( !tlogic_frontend_has_errors() );
}

function tlogic_frontend_hotel_child_age( $loop )
{
	if ( isset( $_GET[ 'num_child_' . $loop ] ) ) {
		//check children age
		$child_ages = array();
		for ( $x = 1; $x <= $_GET[ 'num_child_' . $loop ]; $x++ ) {
			array_push(
				$child_ages,
				$_GET[ 'child_age_room' . $loop . '_child' . $x ]
			);
		}
	}

	return $child_ages;
}

function tlogic_frontend_hotel_room_info()
{
	if ( isset( $_GET[ 'num_room' ] ) ) {

		$rooms_info = array();

		for ( $x = 1; $x <= $_GET[ 'num_room' ]; $x++ ) {
			array_push(
				$rooms_info,
				array(
					"AdultNum" => $_GET[ 'num_adult_' . $x ],
					"ChildNum" => $_GET[ 'num_child_' . $x ],
					"ChildAges" => tlogic_frontend_hotel_child_age( $x )
				)
			);
		}

		return $rooms_info;
	}
}
