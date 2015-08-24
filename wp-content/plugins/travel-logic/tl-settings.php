<?php
/*
 * Travel Logic - settings functions
 */

/**
 * Load settings framework API
 */
require_once TLOGIC_LIB_DIR . '/wp-settings-framework.php';

/**
 * Initialize some items on page load
 */
function tlogic_settings_init()
{
	global $pagenow, $plugin_page;

	// only burn cycles on our page or when saving!
	if ( 'options.php' == $pagenow || 'travel-logic-settings' == $plugin_page ) {
		// init settings objects
		tlogic_settings_screen( 'global' );
	}
}
add_action( 'admin_init', 'tlogic_settings_init', 9 );

/**
 * Return settings slug for a screen
 *
 * @param string $screen
 * @return string
 */
function tlogic_settings_slug( $screen )
{
	if ( preg_match( '/[a-z0-9_]+/i', $screen ) ) {
		return 'tlogic_' . $screen;
	} else {
		wp_die( 'Travel Logic screen slug contains invalid characters.' );
	}
}

/**
 * Return WPSF object for a screen
 *
 * @global array $tlogic_settings_screens
 * @param string $screen
 * @return WordPressSettingsFramework
 */
function tlogic_settings_screen( $screen )
{
	global $tlogic_settings_screens;

	// has this screen been initilaized yet?
	if ( !isset( $tlogic_settings_screens[ $screen ] ) ) {
		// no, ok... init settings for the screen
		$tlogic_settings_screens[ $screen ] =
			new WordPressSettingsFramework(
				TLOGIC_SETTINGS_DIR . '/screen-' . $screen . '.php',
				tlogic_settings_slug( $screen )
			);
	}

	// return settings object for screen
	return $tlogic_settings_screens[ $screen ];
}

/**
 * Get all settings for a screen
 *
 * @param string $screen
 * @return array
 */
function tlogic_get_settings( $screen, $use_cache = true )
{
	global $tlogic_settings_cache;

	// screen slug
	$screen_slug = tlogic_settings_slug( $screen );

	// skip cache or first request?
	if ( true !== $use_cache || !isset( $tlogic_settings_cache[ $screen ] ) ) {
		// update cache
		$tlogic_settings_cache[ $screen ] = get_option( $screen_slug . '_settings' );
	}

	// return settings array
	return $tlogic_settings_cache[ $screen ];
}

/**
 * Get the value of one specific setting
 *
 * @param string $screen
 * @param string $section
 * @param string $field
 * @return mixed
 */
function tlogic_get_setting( $screen, $section, $field, $use_cache = true )
{
	global $tlogic_settings_cache;

	// get all options for screen
	if ( true === $use_cache && isset( $tlogic_settings_cache[ $screen ] ) ) {
		// grab from cache
		$options = $tlogic_settings_cache[ $screen ];
	} else {
		// look 'em up
		$options = tlogic_get_settings( $screen, $use_cache );
	}

	// format option name
	$option_name = tlogic_settings_slug( $screen ) . '_' . $section . '_' . $field;

	// is it set?
	if ( isset( $options[ $option_name ] ) ) {
		// yep, return it
		return $options[ $option_name ];
	} else {
		// not found
		return null;
	}
}

//
// Helpers
//

/**
 * Return an array of all pages
 * @param type $args
 * @return type
 */
function tlogic_settings_pages( $args = array() )
{
	$defaults = array(
//		'child_of' => 0,
//		'sort_order' => 'ASC',
//		'sort_column' => 'post_title',
		'hierarchical' => 0,
//		'exclude' => array(),
//		'include' => array(),
//		'meta_key' => '',
//		'meta_value' => '',
//		'authors' => '',
//		'parent' => -1,
//		'exclude_tree' => '',
//		'number' => '',
//		'offset' => 0,
//		'post_type' => 'page',
//		'post_status' => 'publish',
	);

	$r = wp_parse_args( $args, $defaults );
	extract( $r, EXTR_SKIP );

	$pages = get_pages( $r );

	// the array to return
	$return_array = array(
		'' => __( 'Select a Page', 'travel-logic' )
	);

	if ( !empty( $pages ) ) {
		// loop all pages
		foreach ( $pages as $page ) {
			// append id => title to return array
			$return_array[ $page->ID ] = $page->post_title;
		}
	}

	return $return_array;
}
?>
