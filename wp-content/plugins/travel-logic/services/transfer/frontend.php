<?php
/*
 * Travel Logic - transfer service front end functionality.
 */

//
// Constants
//

/**
 * This is a secret field name for identifying transfer search requests
 */
 
define( 'TLOGIC_TRANSFER_SEARCH_KEY', '7524d0d4c65a' );

//
// Functions
//

/**
 * Returns true if its a search request
 *
 * @return boolean
 */
 
 
 
function tlogic_frontend_is_transfer_search()
{

	// get search key field value
	$search_key = tlogic_get_field_value( TLOGIC_TRANSFER_SEARCH_KEY );
	//die('is transfer search');
	// if not not, its a search request
	return ( null !== $search_key );
}



function tlogic_frontend_do_transfer_search()
{

	//echo 'search or not';
	if ( false === tlogic_frontend_is_transfer_search() ) {			
		// not a search request...
	} else {
		return tlogic_frontend_do_transfer_results();
	}
}




// Function created by MD. Shamsad Ahmed
function tlogic_frontend_get_DestinationPickupCodes($from,$to,$pickupLocation,$destinationLocation)
{	
	//separating pickup and destination location with slash(/)
	
	$pickupLocation=explode("/",$pickupLocation);
	//echo '<br/>';
	$pickupId=$pickupLocation[0];
	//echo '<br/>';
	$pickupValue=$pickupLocation[1];
	//echo '<br/>';
	//echo $destinationLocation=$data['toPickUpCity'];
	$destinationLocation=explode("/",$destinationLocation);
	//echo '<br/>';
	$destinationId=$destinationLocation[0];
	//echo '<br/>';
	$destinationValue=$destinationLocation[1];
	//echo '<br/>';
	 
	 //Checking every combination of TR and HO and assigning respective values
	 
	 if($from=='TR' && $to=='TR')
	 {
	 	$destinationCode=$destinationValue;
		$pickUpCode=$pickupValue;
		$zoneCode1="null";
		$zoneCode2="null";
	 }
	 
	 else if($from=='TR' && $to=='HO')
	 {
	 	$destinationCode=$destinationId;
		$pickUpCode=$pickupValue;
		$zoneCode1=$destinationValue;
		$zoneCode2=$destinationValue;
	 }
	 
	 else if($from=='HO' && $to=='TR')
	 {
	 	$destinationCode=$destinationValue;
		$pickUpCode=$pickupId;
		$zoneCode1=$pickupValue;
		$zoneCode2=$pickupValue;
	 }
	 
	 else if($from=='HO' && $to=='HO')
	 {
	 	$destinationCode=$destinationId;
		$pickUpCode=$pickupId;
		$zoneCode1=$pickupValue;
		$zoneCode2=$destinationValue;
	 }
	 
	 //assigning values to arrays
	 
	 $resultArray=array("destinationCode"=>$destinationCode,"pickUpCode"=>$pickUpCode,"zoneCode1"=>$zoneCode1,"zoneCode2"=>$zoneCode2);
	 return $resultArray;
}



function tlogic_frontend_do_transfer_results()
{
	
	
	// parse request
	$data = tlogic_frontend_parse_transfer_search();

    // validate request
    if ( true === tlogic_frontend_validate_transfer_search( $data ) ) {

        // new transfer search instance
        $search = new Travel_Logic_Transfer_Search();
		
		
		//padding and concating arrival time
	 $arrival_time=strval((str_pad($data['arrival_hour'], 2, '0', STR_PAD_LEFT)).''.str_pad($data['arrival_minutes'], 2, '0', STR_PAD_LEFT));
	
	//padding and concating departure time
	 $departure_time=strval((str_pad($data['departure_hour'], 2, '0', STR_PAD_LEFT)).''.str_pad($data['departure_minutes'], 2, '0', STR_PAD_LEFT));
	 
	 
	 $pickupLocation=$data['transferPickUpCity'];
	 $destinationLocation=$data['toPickUpCity'];
	 
	 /*
	echo $data['fromDestination1'].' '.$data['toDestination'];
	//echo '<br/>';
	$pickupLocation=$data['transferPickUpCity'];
	$pickupLocation=explode("/",$pickupLocation);
	//echo '<br/>';
	$pickupId=$pickupLocation[0];
	//echo '<br/>';
	echo $pickupValue=$pickupLocation[1];
	echo '<br/>';
	echo $destinationLocation=$data['toPickUpCity'];
	$destinationLocation=explode("/",$destinationLocation);
	echo '<br/>';
	echo $destinationId=$destinationLocation[0];
	echo '<br/>';
	echo $destinationValue=$destinationLocation[1];
	echo '<br/>';
	 
	 if($data['fromDestination1']=='TR' && $data[ 'toDestination' ]=='TR')
	 {
	 	$destinationCode=$destinationValue;
		$pickUpCode=$pickupValue;
		$zoneCode1="null";
		$zoneCode2="null";
	 }
	 
	 else if($data['fromDestination1']=='TR' && $data[ 'toDestination' ]=='HO')
	 {
	 	$destinationCode=$destinationId;
		$pickUpCode=$pickupValue;
		$zoneCode1=$destinationValue;
		$zoneCode2=$destinationValue;
	 }
	 
	 else if($data['fromDestination1']=='HO' && $data[ 'toDestination' ]=='TR')
	 {
	 	$destinationCode=$destinationValue;
		$pickUpCode=$pickupId;
		$zoneCode1=$pickupValue;
		$zoneCode2=$pickupValue;
	 }
	 
	 else if($data['fromDestination1']=='HO' && $data[ 'toDestination' ]=='HO')
	 {
	 	$destinationCode=$destinationId;
		$pickUpCode=$pickupId;
		$zoneCode1=$pickupValue;
		$zoneCode2=$destinationValue;
	 }
	 
	 */
	 
	 $resultArray=tlogic_frontend_get_DestinationPickupCodes($data['fromDestination1'],$data['toDestination'],$pickupLocation,$destinationLocation);
	// print_r($resultArray);
	 
		echo $destinationCode=$resultArray['destinationCode'];
		echo $pickUpCode=$resultArray['pickUpCode'];
		echo $zoneCode1=$resultArray['zoneCode1'];
		echo $zoneCode2=$resultArray['zoneCode2'];
	 
	//die();
	
		
		// data is valid, map fields
		
		
		
	
		$args = array(
            // TODO: While is not defined how the Language and Currency will be
            // set, this will be hardcoded here.								
						
            'Language' => 'ENG',
            'Currency' => 'USD',
						
			'transferIN'=>array(
				'DateFrom'=>array('Date'=>date('Ymd',strtotime($data['arrival_date'])),'Time'=>$data['arrival_hour'].$data['arrival_minutes']),
				'DestinationCode' => $destinationCode,
            	'DestinationZoneType'  => $data[ 'toDestination' ],
            	'Occupancy'   => array(
					'AdultCount' => $data[ 'num_adult' ],
					'ChildCount' => $data[ 'num_child' ]				
           							  ),
				'PickupCode' => $pickUpCode,
            	'PickupZoneType' => $data['fromDestination1'],		
				'TransferType' =>'IN',
            	'ZoneCode' =>$zoneCode1	 
							    ),
			
			'transferOUT'=>array(
				'DateFrom'=>array('Date'=>date('Ymd',strtotime($data['departure_date'])),'Time'=>strval((str_pad($data['departure_hour'], 2, '0', STR_PAD_LEFT)).''.str_pad($data['departure_minutes'], 2, '0', STR_PAD_LEFT))),
				'DestinationCode' => $pickUpCode,
            	'DestinationZoneType'    => $data[ 'fromDestination1' ],
            	'Occupancy'   => array(
					'AdultCount' => $data[ 'num_adult' ],
					'ChildCount' => $data[ 'num_child' ]							
           							  ),
				'PickupCode' => $destinationCode,
            	'PickupZoneType' => $data[ 'toDestination' ],		
				'TransferType' =>'OUT',
            	'ZoneCode' =>$zoneCode2
							    )	
           
		);
		
		
	
		
		/*
		$args = array(
            // TODO: While is not defined how the Language and Currency will be
            // set, this will be hardcoded here.
						
            'Language' => 'ENG',
            'Currency' => 'USD',
						
			'transferIN'=>array(
				'DateFrom'=>array('Date'=>'20151218','Time'=>'1200'),
				'DestinationCode' => '100198',
            	'DestinationZoneType'  => 'HO',
            	'Occupancy'   => array(
					'AdultCount' => '1',
					'ChildCount' => '0'					
           							  ),
				'PickupCode' => 'MAD',
            	'PickupZoneType' => 'TR',		
				'TransferType' =>'IN',
            	'ZoneCode' =>'56'	 
							    ),
			
			'transferOUT'=>array(
				'DateFrom'=>array('Date'=>'20151220','Time'=>'1200'),
				'DestinationCode' => 'MAD',
            	'DestinationZoneType'    => 'TR',
            	'Occupancy'   => array(
					'AdultCount' => '1',
					'ChildCount' => '0'					
           							  ),
				'PickupCode' => '100198',
            	'PickupZoneType' =>'HO',		
				'TransferType' =>'OUT',
            	'ZoneCode' =>'56'
							    )	
									
           
		);
		
	*/
	
		//$args=json_decode($args);
		var_dump(json_encode( $args));
	

		// make request
		$search->request( $args );
		//die();
		
		$result = $search->result();
		//var_dump($result);
		var_dump(json_encode($result));

		// set up template instance
		tlogic_transfers_template( $search );

        // enqueue the generic JS script and set the variable
        add_action( 'wp_enqueue_scripts', 'enqueue_search_script' );

        // enqueue the specific JS script and set the variable
        add_action( 'wp_enqueue_scripts',
            'tlogic_frontend_enqueue_transfer_script' );
	}
}

function tlogic_frontend_enqueue_transfer_script()
{
    $handle = 'tlogic_result';

    // CONTROLLER
    wp_enqueue_script( $handle, TLOGIC_ASSETS_URL . '/tlogic-transfer-search.js',
        array( 'angular', 'angular-animate', 'underscore' ), '20150218_01',
        FALSE );

    $tlogic_transfer = tlogic_transfers_template()->toArray();

    $tlogic_transfer['config'] = array_merge( $tlogic_transfer['config'], array(
        'TLOGIC_ASSETS_URL' => TLOGIC_ASSETS_URL
    ) );

    wp_localize_script( $handle, $handle, $tlogic_transfer );
}



/* commented by Md Shamsad Ahmed 
function tlogic_frontend_do_transfer_details()
{
	// new transfer details instance
	$details = new Travel_Logic_Ticket_Valuation();

	$args = filter_input_array( INPUT_GET, FILTER_SANITIZE_STRING );

	// make request
	$details->request( $args );

	// set up template instance
	tlogic_transfers_template( $details );

}




function tlogic_frontend_do_book_transfer()
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

        // new transfer details instance
        $confirmation = new Travel_Logic_Ticket_Confirm_Booking();

        $args_get  = filter_input_array( INPUT_GET, FILTER_SANITIZE_STRING );
        $args_post = filter_input_array( INPUT_POST, FILTER_SANITIZE_STRING );

        $args = array_merge( $args_get, $args_post );

        // make request
        $confirmation->request( $args );

        // set up template instance
        tlogic_transfers_template( $confirmation );
        // die( 'do not know what to do...' );
    }
    else {

        // new transfer details instance
        $details = new Travel_Logic_Ticket_Book_Ticket();

        $args = filter_input_array( INPUT_GET, FILTER_SANITIZE_STRING );

        // make request
        $details->request( $args );

        // set up template instance
        tlogic_transfers_template( $details );
    }

}

/**
 * Return array of valid and normalized fields from transfer search request
 *
 * @return array
 */
 

function tlogic_frontend_parse_transfer_search()
{
	// data array to return
	
	$data = array();

	// valid fields
	$fields = array(
		'fromDestination1',
		'transferPickUpCity',
		'toDestination',
		'toPickUpCity',
		'arrival_date',
		'arrival_hour',
		'arrival_minutes',
		'departure_date',
		'departure_hour',
		'departure_minutes',
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

	// hours and minutes need zero padding
	$fields_to_pad = array(
		'arrival_hour',
		'arrival_minutes',
		'departure_hour',
		'departure_minutes'
	);

	// left pad each on to two places
	foreach( $fields_to_pad as $field ) {
		$data[ $field ] = str_pad( $data[ $field ], 2, '0', STR_PAD_LEFT );
	}

	// get destination code
	$matches = array();

/*
	// try to match the airport code
	if ( preg_match( '#\(([A-Z]{3})\)#', $data['fromDestination1'], $matches ) ) {
		// its offset 1
		$data['fromDestination1'] = $matches[1];
	}
*/
	// return parsed data
	return $data;
}

/**
 * Validate an array of search form data
 *
 * @param array $d Raw data to validate
 * @return boolean
 */
function tlogic_frontend_validate_transfer_search( $d )
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

/*
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
	/*
	if ( true !== checkdate( $d[ 'arrival_date' ] ) ) {
		tlogic_frontend_errors()->add(
			'arrival_date',
			$tpls[ 'form-field-checkdate' ]
		);
	}
	*/

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

function tlogic_frontend_transfer_child_age()
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
