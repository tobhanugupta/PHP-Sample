<?php
/*
 * Travel Logic - global template tags
 */

/**
 * Render a list of option tags.
 *
 * @param string $field_name
 * @param array $options
 */
function tlogic_select_option_list( $field_name, $options )
{
	// get html helper
	$html_helper = WP_SDL::support('1.0')->html();

	// render the options
	$html_helper->option_list(
		$options,
		array(),
		tlogic_get_field_value( $field_name )
	);
}