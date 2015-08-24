<?php
/*
 * Travel Logic - hotel service classes.
 */

/**
 * Destination (auto suggest) request
 */
class Travel_Logic_Hotel_Auto_Suggest extends Travel_Logic_Request
{
	/**
	 */
	public function request( $args )
	{
		// fetch results
		$this
			->method('GET')
			->http_validation( true )
			->fetch( 'Hotel/AutoSuggest/' . $args['query'] )
			->fields( $args );

		// maintain the chain
		return $this;
	}
}

/**
 * Hotel/Search request
 */
class Travel_Logic_Hotel_Search extends Travel_Logic_Request
{
	/**
	 */
	public function request( $args )
	{
		// fetch results
		$this
			->method('POST')
			->fields( $args )
			->fetch_json( 'Hotel/Search' );

		// maintain the chain
		return $this;
	}
}

/**
 * Hotel/GetDetails request
 */
class Travel_Logic_Hotel_Details extends Travel_Logic_Request
{

	/**
	 */
	public function request( $args )
	{

		// fetch results
		$this
			->method('POST')
			->fields( $args )
			->fetch_json( 'Hotel/GetDetails');



		// maintain the chain
		return $this;
	}

	public function get_rooms()
	{
		// new hotel rooms instance
		$rooms = new Travel_Logic_Hotel_Rooms();

		// make request
		$rooms->request( $this->fields() );

		// get result
		$result = $rooms->result();

		if ( $result[0] ) {
			return $result[0];
		} else {
			return array();
		}
	}

	public function get_room_to_book( $room_id, $room_sec_id )
	{
 		// new hotel rooms instance
		$rooms = new Travel_Logic_Hotel_Rooms();

		$args = $this->fields();

		$args[ 'roomIdentified' ] = $room_id;
		$args[ 'RoomSecIdentified' ] = $room_sec_id;

		//$rooms = new Travel_Logic_Hotels_Template();
		// make request
		//$rooms->request( $this->fields() );
		// get rooms result
		//$rooms_result = $rooms->result();
		// new hotel room to book instance
		
		$room_to_book = new Travel_Logic_Hotel_Room_To_Book();

		// make request
		$room_to_book->request( $args );

		// get result
		$result = $room_to_book->result();

		if ( $result[ 0 ] ) {
			return $result[ 0 ];
		} else {
			return array();
		}
	}

}

/**
 * Hotel/GetRooms request
 */
class Travel_Logic_Hotel_Rooms extends Travel_Logic_Request
{
	/**
	 */
	public function request( $args )
	{
		// fetch results
		$this
			->method( 'POST' )
			->fields( $args )
			->fetch_json( 'Hotel/GetRooms' );

		// maintain the chain
		return $this;
	}
}

/**
 * Hotel/GetRoomToBook request
 */
class Travel_Logic_Hotel_Room_To_Book extends Travel_Logic_Request
{
	/**
	 */
	public function request( $args )
	{
		// fetch results
		$this
			->method( 'POST' )
			->fields( $args )
			->fetch_json( 'Hotel/GetRoomToBook' );

		// maintain the chain
		return $this;
	}
}


/**
 * Hotel/GetCancellationPolicy request
 */
class Travel_Logic_Hotel_Cancel_Policy extends Travel_Logic_Request
{
	/**
	 */
	public function request( $args )
	{
		// fetch results
		$this
			->method( 'POST' )
			->fields( $args )
			->fetch_json( 'Hotel/GetCancellationPolicy' );

		// maintain the chain
		return $this;
	}
}

/**
 * Hotel/BookHotel request
 */
class Travel_Logic_Hotel_Book_Room extends Travel_Logic_Request
{
	/**
	 */
	public function request( $args )
	{
		// fetch results
		$this
			->method( 'POST' )
			->fetch( 'BookHotel' )
			->fields( $args );

		// maintain the chain
		return $this;
	}

}

/**
 * Hotels Loop
 */
class Travel_Logic_Hotels_Template
{
	/**
	 * @var Travel_Logic_Request
	 */
	private $request;

	private $result;
	private $result_count;
	private $current_key = -1;
	private $current_item;
	private $item_count;

	private $page_number;
	private $page_limit;

	private $sort_by;
	private $order_by;

	private $in_the_loop;

	public function __construct( Travel_Logic_Request $request, $args = array() )
	{
		// init local props
		$this->request = $request;

		// init args used in this scope
		$page_number = 1;
		$page_limit = 10;

		// extract 'em
		extract( $args, EXTR_IF_EXISTS );

		// set paging props
		$this->page_number = ( isset( $_REQUEST['page_number'] ) ) ? intval( $_REQUEST['page_number'] ) : $page_number;
		$this->page_limit = ( isset( $_REQUEST['page_limit'] ) ) ? intval( $_REQUEST['page_limit'] ) : $page_limit;

		// get total result count
		$this->result_count = $this->request->result_count();

		// get result from request object
		$this->result =
			$this->request->result(
				( $this->page_number - 1 ) * $page_limit,
				$this->page_limit
			);

		// calc item count
		$this->item_count = count( $this->result );
	}

	/**
	 * Return the request object
	 *
	 * @return Travel_Logic_Request
	 */
	public function request()
	{
		return $this->request;
	}

	public function has_items()
	{
		return ( $this->item_count >= 1 );
	}

	public function next_item()
	{
		$this->current_key++;
		$this->current_item = $this->result[ $this->current_key ];

		return $this->current_item;
	}

	public function rewind()
	{
		$this->current_key = -1;

		if ( $this->item_count >= 1 ) {
			$this->current_item = $this->result[0];
		}
	}

	public function items()
	{
		if ( $this->current_key + 1 < $this->item_count ) {
			return true;
		} elseif ( $this->current_key + 1 == $this->item_count ) {
			// loop just ended
			do_action('loop_end');
			// reset loop
			$this->rewind();
		}

		$this->in_the_loop = false;

		return false;
	}

	public function the_item()
	{
		$this->next_item();
		$this->in_the_loop = true;

		// are we at the first key?
		if ( 0 == $this->current_key ) {
			// loop has just started
			do_action( 'loop_start' );
		}
	}

	public function the_item_property( $property )
	{
		return $this->current_item->{$property};
	}

	public function get_item()
	{
		return $this->current_item;
	}

	public function pagination()
	{
		// build up query string
		$query = $_GET;

		// remove page number
		unset( $query[ 'page_number' ] );

		// re/set these
		$query[ 'page_limit' ] = $this->page_limit;
		$query[ 'sort_by' ] = $this->sort_by;
		$query[ 'order_by' ] = $this->order_by;

		// return the pagination markup
		return paginate_links( array(
			'add_args' => array_map( 'urlencode', $query ),
			'format' => '?page_number=%#%',
			'total' => ceil( $this->result_count / $this->page_limit ),
			'current' => $this->page_number,
			'prev_text' => '<i class="icon-previous"></i>',
			'next_text' => '<i class="icon-next"></i>',
			'end_size' => 3,
			'mid_size' => 4,
		));
	}

	/**
	 * Return the ARRAY object
	 *
	 * @return array
	 */
	public function toArray()
	{
		$to_json = array();
		$to_json['fields'] = $this->request->fields();
		$to_json['result'] = $this->request->result();

		$to_json['config'] = array(
			'details_page' => $this->buildDetailsUrl()
		);

		// TODO this possibly insecure
		// build up query string
		$query = $_GET;

		// remove page number
		unset( $query['page_number'] );

		// TODO new private method that generates pagination args
		// re/set these
		$query['page_limit'] = $this->page_limit;
		$query['sort_by']    = $this->sort_by;
		$query['order_by']   = $this->order_by;

		$to_json['pagination'] = array(
			'add_args'  => array_map( 'urlencode', $query ),
			'format'    => '?page_number=%#%',
			'total'     => ceil( $this->result_count / $this->page_limit ),
			'current'   => $this->page_number,
			'prev_text' => '<i class="icon-previous"></i>',
			'next_text' => '<i class="icon-next"></i>',
			'end_size'  => 3,
			'mid_size'  => 4,
		);

		return $to_json;
	}

	/**
	 * Build the details url based on the current search fields
	 * @return string
	 */
	private function buildDetailsUrl() {
		$fields       = $this->request->fields();
		$details_page = tlogic_page_permalink( 'hotel-details' );

		$params = array(
			'checkIn'          => $fields['checkIn'],
			'checkOut'         => $fields['checkOut'],
			'destination'      => $fields['destination'],
			'HotelSupplier'    => $fields['HotelSupplier'],
			'RoomsInformation' => $fields['RoomsInformation'],
			'id'               => ''
		);

		return $details_page . '?' . http_build_query( $params );
	}
}