<?php
/*
 * Travel Logic - hotel service template tags
 */

/**
 * Print the hotel search form action URL
 */
function tlogic_the_hotel_search_action()
{
	echo tlogic_page_permalink( 'hotel-search' );
}

/**
 * Print the hotel search control group error class (if any)
 */
function tlogic_the_hotel_search_ctrlgrp_class( $field_name )
{
	// does this field have an error?
	if ( tlogic_frontend_has_error( $field_name ) ) {
		// yes, spit out the error class
		echo ' error';
	}
}

/**
 * Print the hotel search field value (if any)
 */
function tlogic_the_hotel_search_field_value( $field_name, $default = null )
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
 * Print the hotel search field error (if any)
 */
function tlogic_the_hotel_search_field_error( $field_name )
{
	// does this field have an error?
	if ( tlogic_frontend_has_error( $field_name ) ) {
		// yes, set the error message template variable
		$message = tlogic_frontend_errors()->get_error_message( $field_name );
		// locate template path
		$template = tlogic_locate_template( 'hotel/search-error.php' );
		// include it
		include $template;
	}
}

/**
 * Render list of select options for the number of adults field
 */
function tlogic_the_hotel_search_num_adult_options()
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
function tlogic_the_hotel_search_num_child_options()
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
 * Return hotels template instance
 *
 * @param Travel_Logic_Request $request
 * @param array $args
 * @return Travel_Logic_Hotels_Template
 * @throws Exception
 */
function tlogic_hotels_template( $request = null, $args = array() )
{
	global $tlogic_hotels_template;

	// is request a valid object
	if ( $request instanceof Travel_Logic_Request ) {
		// set up template instance
		$tlogic_hotels_template = new Travel_Logic_Hotels_Template( $request, $args );
	}

	//var_dump($tlogic_hotels_template);

	// return current template instance
	if ( $tlogic_hotels_template instanceof Travel_Logic_Hotels_Template ) {
		return $tlogic_hotels_template;
	} else {
		throw new Exception( 'You forgot to initialize the template!' );
	}
}

function tlogic_has_hotels()
{
	return tlogic_hotels_template()->has_items();
}

function tlogic_hotels()
{
	return tlogic_hotels_template()->items();
}

function tlogic_hotels_pagination()
{
	echo tlogic_hotels_template()->pagination();
}

function tlogic_the_hotel()
{
	return tlogic_hotels_template()->the_item();
}

function tlogic_the_hotel_id()
{
	echo tlogic_get_the_hotel_id();
}
	function tlogic_get_the_hotel_id()
	{
		return tlogic_hotels_template()->the_item_property( 'HotelId' );
	}

function tlogic_the_hotel_thumb()
{
	echo tlogic_get_the_hotel_thumb();
}
	function tlogic_get_the_hotel_thumb()
	{
		return tlogic_hotels_template()->the_item_property( 'Thumb' );
	}

function tlogic_the_hotel_name()
{
	echo tlogic_get_the_hotel_name();
}
	function tlogic_get_the_hotel_name()
	{
		return tlogic_hotels_template()->the_item_property( 'Name' );
	}

function tlogic_the_hotel_description()
{
	echo tlogic_get_the_hotel_description();
}
	function tlogic_get_the_hotel_description()
	{
		//return var_dump(tlogic_hotels_template()->the_item_property( 'Descriptions' ));
		$descs = tlogic_hotels_template()->the_item_property( 'Descriptions' );
		foreach ($descs as $desc) {
			// TODO this is not appending?
			$final_desc = $final_desc."<p>".$desc."</p>";
		}

		return $final_desc;
	}

function tlogic_the_hotel_short_description()
{
	echo tlogic_get_the_hotel_short_description();
}
	function tlogic_get_the_hotel_short_description()
	{
		return tlogic_hotels_template()->the_item_property( 'ShortDescription' );
	}

function tlogic_the_hotel_stars_level()
{
	echo tlogic_get_the_hotel_stars_level();
}
	function tlogic_get_the_hotel_stars_level()
	{
		return tlogic_hotels_template()->the_item_property( 'StarsLevel' );
	}

function tlogic_the_hotel_currency()
{
	echo tlogic_get_the_hotel_currency();
}
	function tlogic_get_the_hotel_currency()
	{
		return tlogic_hotels_template()->the_item_property( 'Currency' );
	}

function tlogic_the_hotel_price_low()
{
	echo tlogic_get_the_hotel_price_low();
}
	function tlogic_get_the_hotel_price_low()
	{
		return tlogic_hotels_template()->the_item_property( 'MinAverPrice' );
	}

function tlogic_the_hotel_stars_icons()
{
	// get number of stars rounded down
	$stars = floor( tlogic_get_the_hotel_stars_level() );

	// print icon that many times
	for ( $i = 0; $i < $stars; $i++ ) {
		// render icon markup ?>
		<i class="icon-star-blue"></i><?php
	}
}

function tlogic_get_the_hotel_images()
{
	// get number of stars rounded down
	$media = tlogic_hotels_template()->the_item_property( 'Media' );

	// return images array
	return $media->Images;
}

function tlogic_get_the_hotel_amenities()
{
	return tlogic_hotels_template()->the_item_property( 'Amenities' );
}

function tlogic_the_hotel_permalink()
{
	echo tlogic_get_the_hotel_permalink();
}
	function tlogic_get_the_hotel_permalink()
	{
		// TODO needs clean up?
      //   if (isset($_GET)) {
		    // return tlogic_page_permalink( 'hotel-details' ) . '&id=' . tlogic_get_the_hotel_id();
      //   } else {
            return tlogic_page_permalink( 'hotel-details' ) . '?id=' . tlogic_get_the_hotel_id();
        // }
	}


function tlogic_the_hotel_rooms()
{
	global $tlogic_the_hotel_rooms;

	if ( !$tlogic_the_hotel_rooms ) {
		$tlogic_the_hotel_rooms = tlogic_hotels_template()->request()->get_rooms();
	}

}

function tlogic_the_room_to_book()
{
	global $tlogic_the_hotel_rooms;

	if ( !$tlogic_the_hotel_rooms ) {
		$tlogic_the_hotel_rooms = tlogic_hotels_template()->request()->get_room_to_book();
	}

}


function tlogic_the_hotel_rooms_currency()
{
	global $tlogic_the_hotel_rooms;

	echo $tlogic_the_hotel_rooms->Currency;
}

function tlogic_the_hotel_room_type()
{
	global $tlogic_the_hotel_room_type;
	global $tlogic_the_hotel_room_type_idx;
	global $tlogic_the_hotel_rooms;

	//var_dump($tlogic_the_hotel_rooms);

	if ( null === $tlogic_the_hotel_room_type_idx ) {
		$tlogic_the_hotel_room_type_idx = 0;
	} else {
		$tlogic_the_hotel_room_type_idx++;
	}

	if ( isset( $tlogic_the_hotel_rooms->RoomTypes[ $tlogic_the_hotel_room_type_idx ] ) ) {
		$tlogic_the_hotel_room_type = $tlogic_the_hotel_rooms->RoomTypes[ $tlogic_the_hotel_room_type_idx ];
		//var_dump($tlogic_the_hotel_room_type);
		return true;
	} else {
		return false;
	}
}

function tlogic_the_hotel_room_type_optnum()
{
	global $tlogic_the_hotel_room_type_idx;

	echo $tlogic_the_hotel_room_type_idx + 1;
}

function tlogic_the_hotel_room_type_id()
{
	echo tlogic_get_the_hotel_room_type_id();
}
	function tlogic_get_the_hotel_room_type_id()
	{
		global $tlogic_the_hotel_room_type;
		return $tlogic_the_hotel_room_type->Occupancies[0]->RoomIdentified;
	}

    function tlogic_get_the_hotel_room_sec_id()
	{
		global $tlogic_the_hotel_room_type;
		return $tlogic_the_hotel_room_type->Occupancies[0]->RoomSecIdentified;
	}

function tlogic_the_hotel_room_type_name()
{
	global $tlogic_the_hotel_room_type;

	echo $tlogic_the_hotel_room_type->Name;
}

function tlogic_the_hotel_room_type_avg_price()
{
	global $tlogic_the_hotel_room_type;

	echo $tlogic_the_hotel_room_type->Occupancies[0]->AvrNightPrice;
}

function tlogic_the_hotel_room_to_book_permalink( $room_id )
{
	// TODO this is insecure
    $_GET['room_id'] = $room_id;
    $params = http_build_query($_GET);

    echo tlogic_page_permalink( 'book-room' ) . '?' . $params;
}

function tlogic_the_hotel_room_to_book()
{
	global $tlogic_the_hotel_room_details;
	global $tlogic_the_hotel_room_to_book;

	if ( !$tlogic_the_hotel_room_to_book ) {
		$tlogic_the_hotel_room_details = new Travel_Logic_Hotel_Details();

        $tlogic_the_hotel_room_to_book = $tlogic_the_hotel_room_details
            ->get_room_to_book( trim( $_GET['room_id'] ),
                trim( $_GET['RoomSecIdentified'] ) );

	}

	tlogic_the_hotel_rooms_hydrate();
}

function tlogic_the_hotel_rooms_hydrate()
{
	global $tlogic_the_hotel_rooms;

	if ( !$tlogic_the_hotel_rooms ) {
		$tlogic_the_hotel_rooms = new Travel_Logic_Hotel_Rooms();
	}
}

function tlogic_the_hotel_room_to_book_num_guests()
{
	global $tlogic_the_hotel_rooms;

    $info = $tlogic_the_hotel_rooms->field('RoomsInformation');

	echo $info[0]['AdultNum'];
}

function tlogic_the_hotel_room_to_book_checkin()
{
	global $tlogic_the_hotel_rooms;
	echo $tlogic_the_hotel_rooms->field('checkIn');
}

function tlogic_the_hotel_room_to_book_checkout()
{
	global $tlogic_the_hotel_rooms;
	echo $tlogic_the_hotel_rooms->field('checkOut');
}

function tlogic_the_hotel_room_to_book_name()
{
	global $tlogic_the_hotel_room_to_book;
	echo $tlogic_the_hotel_room_to_book->Name;
}

function tlogic_the_hotel_room_to_book_thumb()
{
	global $tlogic_the_hotel_room_to_book;
	echo $tlogic_the_hotel_room_to_book->Thumb;
}

function tlogic_the_hotel_room_to_book_currency()
{
	global $tlogic_the_hotel_room_to_book;
	echo $tlogic_the_hotel_room_to_book->Currency;
}

function tlogic_the_hotel_room_to_book_price()
{
	echo tlogic_get_the_hotel_room_to_book_price();
}
	function tlogic_get_the_hotel_room_to_book_price()
	{
		global $tlogic_the_hotel_room_to_book;
		return $tlogic_the_hotel_room_to_book->MinAverPrice;
	}

function tlogic_the_hotel_room_to_book_price_total()
{
	echo tlogic_get_the_hotel_room_to_book_price_total();
}
	function tlogic_get_the_hotel_room_to_book_price_total()
	{
		return
			tlogic_get_the_hotel_room_to_book_type_nights() *
			tlogic_get_the_hotel_room_to_book_price();
	}

function tlogic_the_hotel_room_to_book_type_name()
{
	global $tlogic_the_hotel_room_to_book;
	echo $tlogic_the_hotel_room_to_book->RoomTypes[0]->Name;
}

function tlogic_the_hotel_room_to_book_type_nights()
{
	echo tlogic_get_the_hotel_room_to_book_type_nights();
}
	function tlogic_get_the_hotel_room_to_book_type_nights()
	{
		global $tlogic_the_hotel_room_to_book;
		return $tlogic_the_hotel_room_to_book->RoomTypes[0]->Nights;
	}

function tlogic_the_hotel_room_book_form_action()
{
	if ( tlogic_is_user_logged_in() ) {
		tlogic_the_hotel_room_book_conf_permalink();
	} else {
		// TODO this block may cause duplicate params
        if (isset($_GET)) {
		    echo tlogic_page_permalink( 'book-room' ) . '&room_id=' . trim( $_GET['room_id'] ). '&RoomSecIdentified=' . trim( $_GET['RoomSecIdentified'] );
        } else {
          echo tlogic_page_permalink( 'book-room' ) . '?room_id=' . trim( $_GET['room_id'] ). '&RoomSecIdentified=' . trim( $_GET['RoomSecIdentified'] );
        }

	}
}

function tlogic_the_hotel_room_book_conf_permalink()
{
	// TODO this block may cause duplicate params
    if (isset($_GET)) {
		echo tlogic_page_permalink( 'book-conf' ) . '&room_id=' . trim( $_GET['room_id'] ). '&RoomSecIdentified=' . trim( $_GET['RoomSecIdentified'] );
    } else {
       echo tlogic_page_permalink( 'book-conf' ) . '?room_id=' . trim( $_GET['room_id'] ). '&RoomSecIdentified=' . trim( $_GET['RoomSecIdentified'] );
    }

}


function tlogic_the_hotel_latitute()
{
	echo tlogic_get_the_hotel_latitude();
}
	function tlogic_get_the_hotel_latitude()
	{
		$hotels_location = tlogic_hotels_template()->the_item_property( 'HotelsLocations' );
		return $hotels_location[0]->Latitude;
	}

function tlogic_the_hotel_longitude()
{
	echo tlogic_get_the_hotel_longitude();
}
	function tlogic_get_the_hotel_longitude()
	{
		$hotels_location = tlogic_hotels_template()->the_item_property( 'HotelsLocations' );
		return $hotels_location[0]->Longitude;
	}