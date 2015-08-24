<?php
/*
 * Travel Logic - Transfer service classes.
 */

/**
 * Destination (auto suggest) request
 */
 
class Travel_Logic_Transfer_Auto_Suggest extends Travel_Logic_Request
{
	/**
	 */
	 
	public function request( $args )
	{
		// fetch results
		
			   $this
			   ->method('POST')
			   ->fields( $args )
			   ->fetch_json( 'Transfer/AutoSuggest' );
			
		//die($this);
		// maintain the chain
		return $this;
	}
}

/**
 * Transfer/Search request
 */
class Travel_Logic_Transfer_Search extends Travel_Logic_Request
{
	/**
	 */
	public function request( $args )
	{
	


		// fetch results
		$this
			->method('POST')
			->fields( $args )
			->fetch_json( 'Transfer/Search' );
		//var_dump($this);
		//die('requesting');
		
		// maintain the chain
		return $this;
	}
}

/**
 * Transfer/GetTransferDetails request
 */

class Travel_Logic_Transfer_Details extends Travel_Logic_Request
{

	/**
	 */
	public function request( $args )
	{

		// fetch results
		$this
			->method('POST')
			->fields( $args )
			->fetch_json( 'Transfer/GetTransferDetails');

		// maintain the chain
		return $this;
	}
}

/**
 * Transfer/GetTransferValuation request
 */
class Travel_Logic_Transfer_Valuation extends Travel_Logic_Request
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
            ->fetch_json( 'Transfer/GetTransferValuation' );

        // var_dump($this->result());

		// maintain the chain
		return $this;
	}
}

/**
 * Transfer/BookTransfer request
 */
class Travel_Logic_Transfer_Book_Transfer extends Travel_Logic_Request
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
			->fetch_json( 'Transfer/BookTransfer' );

		// maintain the chain
		return $this;
	}
}


/**
 * Transfer/GetCancellationPolicy request
 */
class Travel_Logic_Transfer_Confirm_Booking extends Travel_Logic_Request
{
	/**
	 */
	public function request( $args )
	{
		// fetch results
		$this
			->method( 'POST' )
			->fields( $args )
			->fetch_json( 'Transfer/ConfirmBooking' );

		// maintain the chain
		
		return $this;
	}
}

/**
 * Transfers Loop
 */
 
class Travel_Logic_Transfers_Template
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
                'TransferCode'     => null,
                'AvailToken'     => null,
                'ContractName'   => null,
                'IncomingOffice' => null,
            )
        );

		return array(
            'base_url' => tlogic_page_permalink( 'ticket-details' ),
            'fields'   => $fields
        );
	}
}