<?php
/*
 * Travel Logic - admin functions
 */

function tlogic_admin_menu()
{
		// register index page
		add_menu_page(
			__( 'Welcome', 'travel-logic' ),
			__( 'Travel Logic', 'travel-logic' ),
			'update_core',
			'travel-logic',
			'tlogic_admin_page_index'
		);

		// register settings page
		add_submenu_page(
			'travel-logic',
			__( 'Welcome', 'travel-logic' ),
			__( 'Welcome', 'travel-logic' ),
			'update_core',
			'travel-logic',
			'tlogic_admin_page_index'
		);

		// register settings page
		add_submenu_page(
			'travel-logic',
			__( 'Settings', 'travel-logic' ),
			__( 'Settings', 'travel-logic' ),
			'update_core',
			'travel-logic-settings',
			'tlogic_admin_page_settings'
		);
}
add_action( 'admin_menu', 'tlogic_admin_menu', 99 );

/**
 * Return path to an admin template, load it by default
 * 
 * @param string $name
 * @param bool $load
 * @return string
 */
function tlogic_admin_template( $name, $load = true )
{
	$path = TLOGIC_ADMIN_DIR . '/' . $name . '.php';
	
	if ( true === $load ) {
		require_once $path;
	}

	return $path;
}

function tlogic_admin_page_index()
{
	tlogic_admin_template( 'index' );
}

function tlogic_admin_page_settings()
{
	tlogic_admin_template( 'settings' );
}

?>
