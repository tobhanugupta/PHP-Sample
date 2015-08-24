<?php
/*
 * Travel Logic - ajax functionality
 */

/**
 * Handle auto suggest action
 */
 
function tlogic_frontend_ajax_autosuggest()
{
	// make sure we got a query
	if ( isset( $_POST['query'] ) ) {

		// new auto suggest instance
		$suggest = new Travel_Logic_Hotel_Auto_Suggest();

		// map params
		$args = array(
			'query' => trim( $_POST['query'] )
		);

		// make request
		$suggest->request( $args );

		// get the result
		$result = $suggest->result();

		// get anything?
		if ( is_object( $result ) && isset( $result->list ) ) {
			// yep, build up array
			$strings = array();
			// loop em
			foreach ( $result->list as $obj ) {
				// append it
				$strings[] = $obj->Text;
			}
			// have any strings?
			if ( count( $strings ) ) {
				// yep, spit out array as JSON object
				die( json_encode( $strings ) );
			}
		}
	}

	die();
}
add_action( 'wp_ajax_tlogic_autosuggest', 'tlogic_frontend_ajax_autosuggest' );
add_action( 'wp_ajax_nopriv_tlogic_autosuggest', 'tlogic_frontend_ajax_autosuggest' );

/**
 * Handle cancellation policy action
 */
function tlogic_frontend_ajax_cancel_policy()
{
	// make sure we got a room type id
	if ( isset( $_POST['hotel_id'] ) && isset( $_POST['room_type_id'] ) ) {

		// pull up current search
		$search = new Travel_Logic_Hotel_Search();

		// new auto suggest instance
		$policy = new Travel_Logic_Hotel_Cancel_Policy();

		// map params
		$args = array(
			'Supplier' => '0',
			'ResID' => '',
			'HotelID' => trim( $_POST['hotel_id'] ),
			'ProductID' => '',
			'HotelRoomTypeID' => trim( $_POST['room_type_id'] ),
			'CheckIn' => $search->field( 'checkIn' ),
			'CheckOut' => $search->field( 'checkOut' )
		);


		// make request
		$policy->request( $args );

		// get result
		$result = $policy->result();

		// get a result?
		if ( is_array( $result ) ) {
			// spit out the result
			die( json_encode( tlogic_frontend_ajax_format_cancel_policy( $result[0] ) ) );
		}
	}

	die();
}
add_action( 'wp_ajax_tlogic_cancel_policy', 'tlogic_frontend_ajax_cancel_policy' );
add_action( 'wp_ajax_nopriv_tlogic_cancel_policy', 'tlogic_frontend_ajax_cancel_policy' );

/**
 * Format the cancellation policy text for the given hotel policy object
 *
 * @param stdClass $object
 * @return array
 */
function tlogic_frontend_ajax_format_cancel_policy( $object )
{
	// this is faked for now!
	return array(
		esc_html( 'You must cancel by 72 hours before check-in, or incur a penalty of one night\'s stay.' ),
		esc_html( 'If you are a &quot;no show&quot; you automatically incur a penalty of one night\'s stay.' )
	);
}





/* Code by Md. Shamsad Ahmed */

/**
 * Handle auto suggest action
 */
function tlogic_frontend_ajax_transfer_autosuggest()
{
	// make sure we got a query
	if ( isset( $_POST['query'] ) ) {

		// new auto suggest instance
		$suggest = new Travel_Logic_Transfer_Auto_Suggest();

		// map params	
		$args = array(
			'DestinationType' => trim( $_POST['query'] ),
			'city'=>'PMI'
		);

		// make request
		$suggest->request( $args );
		

		// get the result
		$result = $suggest->result();

		// get anything?
		
		if ( is_object( $result ) && isset( $result->list ) ) {
			// yep, build up array
			$strings = array();
			// loop em
			foreach ( $result->list as $obj ) {
				// append it
				$strings[] = array(
     				 'Value' => $obj->Value,
     				 'Text' => $obj->Text,
					 'Id' => $obj->Id
  				  );
			}

			// have any strings?
			if ( count( $strings ) ) {
				// yep, spit out array as JSON object
				die( json_encode( $strings ) );
			}
		}
	}

	die();
}
add_action( 'wp_ajax_tlogic_transfer_autosuggest', 'tlogic_frontend_ajax_transfer_autosuggest' );
add_action( 'wp_ajax_nopriv_tlogic_transfer_autosuggest', 'tlogic_frontend_ajax_transfer_autosuggest' );

