<?php
/**
 * Travel Logic - global settings config
 */

global $wpsf_settings;

// cache pages array
$pages_cache = tlogic_settings_pages();

// General Settings section
$wpsf_settings[] = array(
    'section_id' => 'pages',
    'section_title' => 'Page Settings',
    'section_description' => 'Configure the pages in which the Travel Logic shortcodes are embedded.',
    'section_order' => 5,
    'fields' => array(

        // Hotel
        array(
            'id' => 'hotel-search',
            'title' => 'Hotel Search',
            'desc' => 'The page in which you have placed the hotel search shortcode.',
            'type' => 'select',
            'std' => null,
            'choices' => $pages_cache
        ),
        array(
            'id' => 'hotel-details',
            'title' => 'Hotel Details',
            'desc' => 'The page in which you have placed the hotel details shortcode.',
            'type' => 'select',
            'std' => null,
            'choices' => $pages_cache
        ),
        array(
            'id' => 'book-room',
            'title' => 'Book Room',
            'desc' => 'The page in which you have placed the book room shortcode.',
            'type' => 'select',
            'std' => null,
            'choices' => $pages_cache
        ),
        array(
            'id' => 'book-conf',
            'title' => 'Book Confirm',
            'desc' => 'The page in which you have placed the booking confirmation shortcode.',
            'type' => 'select',
            'std' => null,
            'choices' => $pages_cache
		),

        // Ticket
        array(
            'id' => 'ticket-search',
            'title' => 'Ticket Search',
            'desc' => 'The page in which you have placed the ticket search shortcode.',
            'type' => 'select',
            'std' => null,
            'choices' => $pages_cache
        ),
        array(
            'id' => 'ticket-details',
            'title' => 'Ticket Details',
            'desc' => 'The page in which you have placed the ticket details shortcode.',
            'type' => 'select',
            'std' => null,
            'choices' => $pages_cache
        ),
        array(
            'id' => 'book-ticket',
            'title' => 'Book Ticket',
            'desc' => 'The page in which you have placed the book ticket shortcode.',
            'type' => 'select',
            'std' => null,
            'choices' => $pages_cache
        ),
        array(
            'id' => 'ticket-conf',
            'title' => 'Ticket Confirm',
            'desc' => 'The page in which you have placed the ticket confirmation shortcode.',
            'type' => 'select',
            'std' => null,
            'choices' => $pages_cache
        ),

        // Car Rental
        array(
            'id' => 'car-search',
            'title' => 'Car Search',
            'desc' => 'The page in which you have placed the car search shortcode.',
            'type' => 'select',
            'std' => null,
            'choices' => $pages_cache
        ),
        array(
            'id' => 'car-details',
            'title' => 'Car Details',
            'desc' => 'The page in which you have placed the car details shortcode.',
            'type' => 'select',
            'std' => null,
            'choices' => $pages_cache
        ),
        array(
            'id' => 'book-car',
            'title' => 'Book car',
            'desc' => 'The page in which you have placed the book car shortcode.',
            'type' => 'select',
            'std' => null,
            'choices' => $pages_cache
        ),
        array(
            'id' => 'car-conf',
            'title' => 'Car Confirm',
            'desc' => 'The page in which you have placed the car confirmation shortcode.',
            'type' => 'select',
            'std' => null,
            'choices' => $pages_cache
        ),
		 array(
            'id' => 'transfer-search',
            'title' => 'Transfer Search',
            'desc' => 'The page in which you have placed the transfer search shortcode.',
            'type' => 'select',
            'std' => null,
            'choices' => $pages_cache
        ),
		 array(
            'id' => 'transfer-details',
            'title' => 'Transfer Details',
            'desc' => 'The page in which you have placed the transfer details shortcode.',
            'type' => 'select',
            'std' => null,
            'choices' => $pages_cache
        )
	)
);

// More Settings section
//$wpsf_settings[] = array(
//    'section_id' => 'more',
//    'section_title' => 'More Settings',
//    'section_order' => 10,
//    'fields' => array(
//        array(
//            'id' => 'more-text',
//            'title' => 'More Text',
//            'desc' => 'This is a description.',
//            'type' => 'text',
//            'std' => 'This is std'
//        ),
//    )
//);

?>