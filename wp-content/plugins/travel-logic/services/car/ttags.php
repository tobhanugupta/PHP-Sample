<?php
/*
 * Travel Logic - car service template tags
 */

/**
 * Print the car search form action URL
 */
function tlogic_the_car_search_action()
{
	echo tlogic_page_permalink( 'car-search' );
}

/**
 * Print the car search control group error class (if any)
 */
function tlogic_the_car_search_ctrlgrp_class( $field_name )
{
	// does this field have an error?
	if ( tlogic_frontend_has_error( $field_name ) ) {
		// yes, spit out the error class
		echo ' error';
	}
}

/**
 * Print the car search field value (if any)
 */
function tlogic_the_car_search_field_value( $field_name, $default = null )
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
 * Print the car search field error (if any)
 */
function tlogic_the_car_search_field_error( $field_name )
{
	// does this field have an error?
	if ( tlogic_frontend_has_error( $field_name ) ) {
		// yes, set the error message template variable
		$message = tlogic_frontend_errors()->get_error_message( $field_name );
		// locate template path
		$template = tlogic_locate_template( 'car/search-error.php' );
		// include it
		include $template;
	}
}

/**
 * Render list of select options for the number of adults field
 */
function tlogic_the_car_search_num_adult_options()
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
function tlogic_the_car_search_num_child_options()
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
 * Return cars template instance
 *
 * @param Travel_Logic_Request $request
 * @param array $args
 * @return Travel_Logic_Cars_Template
 * @throws Exception
 */
function tlogic_cars_template( $request = null, $args = array() )
{
	global $tlogic_cars_template;

    // is request a valid object
    if ( $request instanceof Travel_Logic_Request ) {
        // set up template instance
        $tlogic_cars_template = new Travel_Logic_Cars_Template( $request, $args );
    }

    // return current template instance
    if ( $tlogic_cars_template instanceof Travel_Logic_Cars_Template ) {
        return $tlogic_cars_template;
    } else {
		throw new Exception( 'You forgot to initialize the template!' );
	}
}

/**
 * Render list of select options for the pickup country field
 */
function tlogic_the_car_search_pickup_country_options()
{
    $country = new Travel_Logic_Car_Pickup_Country();

    // make request
    $country->request( array( 'Language' => 'en' ) );
    $countries = $country->result()->list;

    $options = array();
    foreach ( $countries as $country ) {
        $options[$country->Value] = $country->Text;
    }

    // render the options
    tlogic_select_option_list( 'pickupCountry', $options );
}

/**
 * Render list of select options for the pickup city field
 */
function tlogic_the_car_search_pickup_city_options()
{
    $city = new Travel_Logic_Car_Pickup_City();

    // make request
    $city->request( array(
        'Language'      => 'EN',
        'Currency'      => 'USD',
        'PickupCountry' => 'UK' // TODO: get by ajax on dropdown change
    ) );

    $cities = $city->result()->list;

    $options = array();
    foreach ( $cities as $city ) {
        $options[$city->Value] = $city->Text;
    }

    // render the options
    tlogic_select_option_list( 'pickupCity', $options );
}

/**
 * Render list of select options for the pickup city field
 */
function tlogic_the_car_search_pickup_location_options()
{
    $location = new Travel_Logic_Car_Pickup_Location();

    // make request
    $location->request( array(
        'Language'      => 'EN',
        'Currency'      => 'USD',
        'PickupCountry' => 'UK', // TODO: get by ajax on dropdown change
        'PickupCity'    => 'London' // TODO: get by ajax on dropdown change
    ) );

    $cities = $location->result()->list;

    $options = array();
    foreach ( $cities as $location ) {
        $options[$location->Value] = $location->Text;
    }

    // render the options
    tlogic_select_option_list( 'pickupLocation', $options );
}

function tlogic_has_cars()
{
	return tlogic_cars_template()->has_items();
}

function tlogic_cars()
{
	return tlogic_cars_template()->items();
}

function tlogic_cars_pagination()
{
	echo tlogic_cars_template()->pagination();
}

function tlogic_the_car()
{
    return tlogic_cars_template()->the_item();
}

function tlogic_the_car_info()
{
	return tlogic_cars_template()->the_item_property( 'TicketInfo' );
}

function tlogic_the_car_available_modality()
{
    $availableModality = tlogic_cars_template()
        ->the_item_property( 'AvailableModality' );

    return $availableModality[0];
}

function tlogic_the_car_name()
{
    echo tlogic_get_the_car_name();
}
    function tlogic_get_the_car_name()
    {
        return tlogic_the_car_info()->Name;
    }

function tlogic_the_car_date_from()
{
    echo tlogic_get_the_car_date_from();
}
    function tlogic_get_the_car_date_from()
    {
        $date = DateTime::createFromFormat( 'Ymd',
            tlogic_cars_template()->the_item_property( 'DateFrom' )->Date);

        return $date->format( 'm/d/Y' );
    }

function tlogic_the_car_date_to()
{
	echo tlogic_get_the_car_date_to();
}
	function tlogic_get_the_car_date_to()
	{
		$date = DateTime::createFromFormat( 'Ymd',
            tlogic_cars_template()->the_item_property( 'DateTo' )->Date);

        return $date->format( 'm/d/Y' );
	}

function tlogic_the_car_modality_name()
{
    echo tlogic_get_the_car_modality_name();
}
    function tlogic_get_the_car_modality_name()
    {
        return tlogic_the_car_available_modality()->Name;
    }

function tlogic_the_car_total()
{
    echo number_format( tlogic_get_the_car_total(), 2 );
}
    function tlogic_get_the_car_total()
    {
        return tlogic_cars_template()->the_item_property( 'TotalAmount' );
    }

function tlogic_get_car_all_comments()
{
    return tlogic_cars_template()->the_item_property( 'CommentList' );
}

function tlogic_the_car_book_permalink()
{
    echo tlogic_page_permalink( 'book-car' ) . '?' . http_build_query( $_GET );

}

function tlogic_the_car_confirmation_date_from()
{
    echo tlogic_get_the_car_confirmation_date_from();
}
    function tlogic_get_the_car_confirmation_date_from()
    {
        $service = tlogic_cars_template()->the_item_property( 'ServiceList' );
        $date = DateTime::createFromFormat( 'Ymd', $service[0]->DateFrom->Date);

        return $date->format( 'm/d/Y' );
    }

function tlogic_the_car_confirmation_date_to()
{
    echo tlogic_get_the_car_confirmation_date_to();
}
    function tlogic_get_the_car_confirmation_date_to()
    {
        $service = tlogic_cars_template()->the_item_property( 'ServiceList' );
        $date = DateTime::createFromFormat( 'Ymd', $service[0]->DateTo->Date);

        return $date->format( 'm/d/Y' );
    }

function tlogic_the_car_confirmation_total()
{
    echo number_format( tlogic_get_the_car_confirmation_total(), 2 );
}
    function tlogic_get_the_car_confirmation_total()
    {
        $service = tlogic_cars_template()->the_item_property( 'ServiceList' );
        return $service[0]->TotalAmount;
    }

function tlogic_get_car_confirmation_all_comments()
{
    $service = tlogic_cars_template()->the_item_property( 'ServiceList' );
    return $service[0]->CommentList;
}
