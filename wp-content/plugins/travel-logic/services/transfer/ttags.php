<?php
/*
 * Travel Logic - transfer service template tags
 */


/**
 * Print the transfer search form action URL
 */
 
function tlogic_the_transfer_search_action()
{
	echo tlogic_page_permalink( 'transfer-search' );
}

/**
 * Print the transfer search control group error class (if any)
 */
function tlogic_the_transfer_search_ctrlgrp_class( $field_name )
{
	// does this field have an error?
	if ( tlogic_frontend_has_error( $field_name ) ) {
		// yes, spit out the error class
		echo ' error';
	}
}

/**
 * Print the transfer search field value (if any)
 */
function tlogic_the_transfer_search_field_value( $field_name, $default = null )
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
 * Print the transfer search field error (if any)
 */
function tlogic_the_transfer_search_field_error( $field_name )
{
	// does this field have an error?
	if ( tlogic_frontend_has_error( $field_name ) ) {
		// yes, set the error message template variable
		$message = tlogic_frontend_errors()->get_error_message( $field_name );
		// locate template path
		$template = tlogic_locate_template( 'transfer/search-error.php' );
		// include it
		include $template;
	}
}

/**
 * Render list of select options for the number of adults field
 */
function tlogic_the_transfer_search_num_adult_options()
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
function tlogic_the_transfer_search_num_child_options()
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
 * Return transfers template instance
 *
 * @param Travel_Logic_Request $request
 * @param array $args
 * @return Travel_Logic_transfers_Template
 * @throws Exception
 */
function tlogic_transfers_template( $request = null, $args = array() )
{
	global $tlogic_transfers_template;

    // is request a valid object
    if ( $request instanceof Travel_Logic_Request ) {
        // set up template instance
        $tlogic_transfers_template = new Travel_Logic_transfers_Template( $request, $args );
    }

    // return current template instance
    if ( $tlogic_transfers_template instanceof Travel_Logic_transfers_Template ) {
        return $tlogic_transfers_template;
    } else {
		throw new Exception( 'You forgot to initialize the template!' );
	}
}

function tlogic_has_transfers()
{
	return tlogic_transfers_template()->has_items();
}

function tlogic_transfers()
{
	return tlogic_transfers_template()->items();
}

function tlogic_transfers_pagination()
{
	echo tlogic_transfers_template()->pagination();
}

function tlogic_the_transfer()
{
    return tlogic_transfers_template()->the_item();
}

function tlogic_the_transfer_info()
{
	return tlogic_transfers_template()->the_item_property( 'transferInfo' );
}

function tlogic_the_transfer_available_modality()
{
    $modality = tlogic_transfers_template()->the_item_property( 'AvailableModality' );
    return $modality[0];
}

function tlogic_the_transfer_name()
{
    echo tlogic_get_the_transfer_name();
}
    function tlogic_get_the_transfer_name()
    {
        return tlogic_the_transfer_info()->Name;
    }

function tlogic_the_transfer_date_from()
{
    echo tlogic_get_the_transfer_date_from();
}
    function tlogic_get_the_transfer_date_from()
    {
        $date = DateTime::createFromFormat( 'Ymd',
            tlogic_transfers_template()->the_item_property( 'DateFrom' )->Date);

        return $date->format( 'm/d/Y' );
    }

function tlogic_the_transfer_date_to()
{
	echo tlogic_get_the_transfer_date_to();
}
	function tlogic_get_the_transfer_date_to()
	{
		$date = DateTime::createFromFormat( 'Ymd',
            tlogic_transfers_template()->the_item_property( 'DateTo' )->Date);

        return $date->format( 'm/d/Y' );
	}

function tlogic_the_transfer_modality_name()
{
    echo tlogic_get_the_transfer_modality_name();
}
    function tlogic_get_the_transfer_modality_name()
    {
        return tlogic_the_transfer_available_modality()->Name;
    }

function tlogic_the_transfer_total()
{
    echo number_format( tlogic_get_the_transfer_total(), 2 );
}
    function tlogic_get_the_transfer_total()
    {
        return tlogic_transfers_template()->the_item_property( 'TotalAmount' );
    }

function tlogic_get_transfer_all_comments()
{
    return tlogic_transfers_template()->the_item_property( 'CommentList' );
}

function tlogic_the_transfer_book_permalink()
{
    echo tlogic_page_permalink( 'book-transfer' ) . '?' . http_build_query( $_GET );

}

function tlogic_the_transfer_confirmation_date_from()
{
    echo tlogic_get_the_transfer_confirmation_date_from();
}
    function tlogic_get_the_transfer_confirmation_date_from()
    {
        $service = tlogic_transfers_template()->the_item_property( 'ServiceList' );
        $date = DateTime::createFromFormat( 'Ymd', $service[0]->DateFrom->Date);

        return $date->format( 'm/d/Y' );
    }

function tlogic_the_transfer_confirmation_date_to()
{
    echo tlogic_get_the_transfer_confirmation_date_to();
}
    function tlogic_get_the_transfer_confirmation_date_to()
    {
        $service = tlogic_transfers_template()->the_item_property( 'ServiceList' );
        $date = DateTime::createFromFormat( 'Ymd', $service[0]->DateTo->Date);

        return $date->format( 'm/d/Y' );
    }

function tlogic_the_transfer_confirmation_total()
{
    echo number_format( tlogic_get_the_transfer_confirmation_total(), 2 );
}
    function tlogic_get_the_transfer_confirmation_total()
    {
        $service = tlogic_transfers_template()->the_item_property( 'ServiceList' );
        return $service[0]->TotalAmount;
    }

function tlogic_get_transfer_confirmation_all_comments()
{
    $service = tlogic_transfers_template()->the_item_property( 'ServiceList' );
    return $service[0]->CommentList;
}


/* Code Added by Md. Shamsad Ahmed */

function tlogic_the_trasfer_search_pickup_city_options_Hotel()
{
    /*
	if($_REQUEST['pickUpValue'])
    {
    $val=$_REQUEST['pickUpValue'];
    echo $val;
     }
	 */
	 
	$city = new Travel_Logic_Transfer_Auto_Suggest();

    // make request
    $city->request( array(
         'DestinationType' => 'HO',
		 'city'=>'PMI'
    ) );

    $cities = $city->result()->list;

    $options = array();
	//$options['0'] = $val;
    foreach ( $cities as $city ) {
        $options[$city->Value] = $city->Text;
    }

    // render the options
    tlogic_select_option_list( 'transferPickUpCity', $options );
}


function tlogic_the_trasfer_search_pickup_city_options_Terminal()
{
    $city = new Travel_Logic_Transfer_Auto_Suggest();

    // make request
    $city->request( array(
         'DestinationType' => 'TR',
		 'city'=>'PMI' // TODO: get by ajax 
    ) );

    $cities = $city->result()->list;

    $options = array();
    foreach ( $cities as $city ) {
        $options[$city->Value] = $city->Text;
    }

    // render the options
    tlogic_select_option_list( 'transferPickUpCity', $options );
}



/**
 * Render list of select options for the number of hours field
 */
function tlogic_the_transfer_search_hours($name)
{
	// fill array where keys match values
	$options = range( 00, 24 );

	// remove first item
	//unset( $options[ 0 ] );
	$singleDigit=array(0,1,2,3,4,5,6,7,8,9);
	
	for($i=0;$i<count($options);$i++)
	{
		if(in_array($options[$i],$singleDigit))
			{
				$options[$i]='0'.$options[$i];
			}
	}

	// render the options
	tlogic_select_option_list( $name, $options );
}


/**
 * Render list of select options for the number of minutes field
 */
function tlogic_the_transfer_search_minutes($name)
{
	// fill array where keys match values
	$options = array(0,05,10,15,20,25,30,35,40,45,50,55);

	// remove first item
	//unset( $options[ 0 ] );
	
	$singleDigit=array(0,1,2,3,4,5,6,7,8,9);
	for($i=0;$i<count($options);$i++)
	{
		if(in_array($options[$i],$singleDigit))
			{
				$options[$i]='0'.$options[$i];
			}
	}

	// render the options
	tlogic_select_option_list( $name, $options );
}


