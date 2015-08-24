<?php
/*
 * Travel Logic - car service classes.
 */

/**
 * Pickup Country request
 */
class Travel_Logic_Car_Pickup_Country extends Travel_Logic_Request
{
	/**
	 */
	public function request( $args )
	{
		// fetch results
		$this
			->method('GET')
			->http_validation( true )
			->fetch( 'Car/GetPickUpCountry/' . $args['Language'] )
			->fields( $args );

		// maintain the chain
		return $this;
	}
}

/**
 * Pickup City request
 */
class Travel_Logic_Car_Pickup_City extends Travel_Logic_Request
{
    /**
     */
    public function request( $args )
    {

        // fetch results
        $this
            ->method('POST')
            ->fields( $args )
            ->fetch_json( 'Car/GetPickUpCity' );

        // maintain the chain
        return $this;
    }
}

/**
 * Pickup Location request
 */
class Travel_Logic_Car_Pickup_Location extends Travel_Logic_Request
{
    /**
     */
    public function request( $args )
    {

        // fetch results
        $this
            ->method('POST')
            ->fields( $args )
            ->fetch_json( 'Car/GetPickUpLocation' );

        // maintain the chain
        return $this;
    }
}

/**
 * Car/Search request
 */
class Travel_Logic_Car_Search extends Travel_Logic_Request
{
	/**
	 */
	public function request( $args )
	{

		// fetch results
		$this
			->method('POST')
			->fields( $args )
			->fetch_json( 'Car/Search' );

		// maintain the chain
		return $this;
	}
}

/**
 * Car/GetCarDetails request
 */
class Travel_Logic_Car_Details extends Travel_Logic_Request
{

	/**
	 */
	public function request( $args )
	{

		// fetch results
		$this
			->method('POST')
			->fields( $args )
			->fetch_json( 'Car/GetCarDetails');

		// maintain the chain
		return $this;
	}
}

/**
 * Car/GetCarValuation request
 */
class Travel_Logic_Car_Valuation extends Travel_Logic_Request
{
	/**
	 */
	public function request( $args )
	{
        echo '<pre>' . json_encode( $args ) . '</pre>';

        // fetch results
        $this
            ->method( 'POST' )
            ->fields( $args )
            ->fetch_json( 'Car/GetCarValuation' );

        // var_dump($this->result());

		// maintain the chain
		return $this;
	}
}

/**
 * Car/BookCar request
 */
class Travel_Logic_Car_Book_Car extends Travel_Logic_Request
{
	/**
	 */
	public function request( $args )
	{
        echo '<pre>' . json_encode( $args, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES ) . '</pre>';

		// fetch results
		$this
			->method( 'POST' )
			->fields( $args )
			->fetch_json( 'Car/BookCar' );

		// maintain the chain
		return $this;
	}
}


/**
 * Car/GetCancellationPolicy request
 */
class Travel_Logic_Car_Confirm_Booking extends Travel_Logic_Request
{
	/**
	 */
	public function request( $args )
	{
		// fetch results
		$this
			->method( 'POST' )
			->fields( $args )
			->fetch_json( 'Car/ConfirmBooking' );

		// maintain the chain
		return $this;
	}
}

/**
 * Cars Loop
 */
class Travel_Logic_Cars_Template
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
            'details_page' => $this->details_page_fields()
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
	private function details_page_fields() {
        $fields = array_merge(

            // the existing search
            $this->request->fields(),

            // the parameters that details page need
            array(
                'ModaliTyCode'   => null,
                'ModaliTyName'   => null,
                'CarCode'     => null,
                'AvailToken'     => null,
                'ContractName'   => null,
                'IncomingOffice' => null,
            )
        );

		return array(
            'base_url' => tlogic_page_permalink( 'car-details' ),
            'fields'   => $fields
        );
	}
}