<?php
/*
 * Travel Logic functions
 */

/**
 * Return path to template.
 *
 * Check if template exists in style path, else check plugin templates dir
 *
 * @param string $template_name
 * @param boolean $load Auto load template if set to true
 * @param boolean $require_once
 * @return string|false Path to located template, or false
 */
function tlogic_locate_template( $template_name, $load = false, $require_once = true )
{
	// skip locating if template name empty
	if ( empty( $template_name ) ) {
		return false;
	}

	// located is false by default
	$located = false;

	// both possible paths
	$style_path = STYLESHEETPATH . '/' . $template_name;
	$plugin_path = TLOGIC_TPLS_DIR . '/' . $template_name;

	if ( file_exists( $style_path )) {
		$located = $style_path;
	} else if ( file_exists( $plugin_path ) ) {
		$located = $plugin_path;
	}

	if ( $load && false !== $located ) {
		load_template( $located, $require_once );
	}

	return $located;
}

/**
 * Locate template and load it automatically
 *
 * @param string $template_name
 * @param boolean $require_once
 * @return void
 */
function tlogic_load_template( $template_name, $require_once = true )
{
	// try to locate and load it
	tlogic_locate_template( $template_name, true, $require_once );
}

/**
 * Return permalink for a configured page
 * 
 * @param string $page
 * @return string
 */
function tlogic_page_permalink( $page )
{
	// get post id of page
	$id = tlogic_get_setting( 'global', 'pages', $page );

	// did we get an id?
	if ( $id ) {
		// yep, return permalink
		return get_permalink( $id );
	} else {
		// nope, not good
		return '';
	}
}

/**
 * Return trimmed GET parameter value
 *
 * @param string $field_name
 * @return string|null
 */
function tlogic_get_field_value( $field_name )
{
	if ( isset( $_GET[ $field_name ] ) ) {
		// yes, return trimmed value
		return trim( $_GET[ $field_name ] );
	} else {
		// return nothing
		return null;
	}
}

function tlogic_is_user_logged_in()
{
	// new auth instance
	$customer_auth = new Travel_Logic_Customer_Auth();

	// check if authenticated
	return $customer_auth->authenticated();
}

function tlogic_get_user_id()
{
	// new auth instance
	$customer_auth = new Travel_Logic_Customer_Auth();

	// check if authenticated
	return $customer_auth->authenticated_id();
}

function tlogic_get_user_name()
{
	// new auth instance
	$customer_auth = new Travel_Logic_Customer_Auth();

	// check if authenticated
	return $customer_auth->authenticated_user();
}

/**
 * Returns true if the given date string has passed.
 *
 * @param string $date
 * @return boolean
 */
function tlogic_date_has_passed( $month, $day, $year )
{
	// midnight of given date
	$date_stamp =  mktime( 0, 0, 0, $month, $day, $year );

	// midnight of today
	$midnight_stamp = mktime( 0, 0, 0 );

	// is given date less than midnight?
	return ( $date_stamp < $midnight_stamp );
}
