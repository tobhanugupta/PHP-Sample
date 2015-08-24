<?php
/*
 * Travel Logic - classes
 */

session_start();

/**
 * All travel logic classes should throw this class or an implementation of it
 */
class Travel_Logic_Exception extends Exception
{
    // nothing special yet
}

/**
 * In case of the exception be an HTTP 400 error
 */
class Travel_Logic_Bad_Request_Exception extends Travel_Logic_Exception
{

    private $errors = array();

	public function __construct( $message ) {
        $json = (array)json_decode( $message );

        foreach ( $json['ModelState'] as $value ) {

            $this->errors[] = $value[0];
        }


        parent::__construct( $json['Message'], 400, null );
    }

    public function getErrors() {
        return $this->errors;
    }
}

/**
 * Abstract base class for making requests to the
 * Travel Logic API end points.
 */
abstract class Travel_Logic_Request
{
	/**
	 * The request method.
	 *
	 * @var string
	 */
	private $method = 'POST';

	/**
	 * Array of request field values
	 *
	 * @var array
	 */
	private $fields = array();

	/**
	 * Results of successful request
	 *
	 * @var array of stdClass instances
	 */
	private $result;

	/**
	 * Use HTTP codes for validation instead of JSON object
	 *
	 * @var boolean
	 */
	private $http_validation = false;

	/**
	 * Switch the request method.
	 *
	 * @param string $method
	 * @return Travel_Logic_Request
	 */
	protected function method( $method )
	{
		// set the method
		$this->method = strtoupper( $method );

		// maintain the chain
		return $this;
	}

	/**
	 * Toggle HTTP validation on/off
	 *
	 * @param boolean $toggle
	 * @return Travel_Logic_Request
	 */
	protected function http_validation( $toggle )
	{
		// set it
		$this->http_validation = (boolean) $toggle;

		// maintain the chain
		return $this;
	}

	/**
	 * Decode a JSON string and return an array
	 *
	 * @param string $json
	 * @return array
	 */
	protected function decode( $json )
	{
		// trim and decode the string
		$result = json_decode( trim( $json ) );

		// check result
		if ( null !== $result ) {
			// looks good!
			return $result;
		} else {
			// not good, throw exception
			throw new Travel_Logic_Exception(
				__( 'Decoding API data failed.', 'travel-logic' )
			);
		}
	}

	/**
	 * Prepare a string for most types of processing
	 *
	 * @param string $string
	 * @return string
	 */
	protected function clean_string( $string )
	{
		// just a trim
		return stripslashes( trim( $string ) );
	}

	/**
	 * Prepare a really messy string for processing by a service
	 *
	 * @param string $string
	 * @return string
	 */
	final protected function deep_clean_string( $string )
	{
		// start with a basic cleaning
		$string_1 = $this->clean_string( $string );

		// convert newlines, carriage returns, tabs and two or more spaces into one space
		$string_2 = preg_replace( '/[\n\r\t]+|\s{2,}/u', ' ', $string_1 );

		// all done
		return $string_2;
	}

	/**
	 * Return absolute URL for the given end point
	 *
	 * @param string $end_point
	 * @return string
	 */
	static public function url( $end_point )
	{
        $url = 'http://travellogix.api.test.conceptsol.com';

        if ( $end_point[0] !== '/' ) {
            $url .= '/api/';
        }

		return $url . $end_point;
	}

	/**
	 * Return the value of a request field from the last fetch
	 *
	 * @param string $field_name
	 * @return mixed
	 * @throws Travel_Logic_Exception
	 */
	public function field( $field_name )
	{
		// grab all fields
		$fields = $this->fields();

        // field name must be a key in the fields array
        if ( array_key_exists( $field_name, $fields ) ) {
            // key is set, return value
            return $fields[ $field_name ];
        } else {
            // var_dump($fields);
            // key is not set, developer issue
			throw new Travel_Logic_Exception(
				sprintf(
					__( 'The request field "%s" does not exist.', 'travel-logic' ),
					$field_name
				)
			);
		}
	}

	/**
	 * Get/Set request fields array
	 *
	 * @param array $fields
	 * @return Travel_Logic_Request
	 */
	public function fields( $fields = array() )
	{
		$session_key = get_class( $this ) . '_fields';

		if ( 1 === func_num_args() ) {

			$this->fields = $fields;
			$_SESSION[ $session_key ] = $this->fields;

			return $this;

		} else {

			if ( empty( $this->fields ) && isset( $_SESSION[ $session_key ] ) ) {
				$this->fields = $_SESSION[ $session_key ];
			}

			return $this->fields;
		}
	}

	/**
	 * Fetch remote raw API raw from a URL
	 *
	 * @param string $end_point end point to call
	 * @return Travel_Logic_Request
	 */
	protected function fetch( $end_point, $args = array() )
	{
		// format URL for end point
		$url = $this->url( $end_point );

        // prevent the infinite loop
        if ( strcasecmp( '/Token', $end_point ) !== 0 ) {
            $authenticate = new Travel_Logic_Customer_Token();

            if ( is_array( $args['headers'] ) ) {
                $args['headers']['Authorization'] = $authenticate->token();
            }
            else {
                $args['headers'] = array(
                    'Authorization' => $authenticate->token() );
            }
        }

		// build up request args
		$request_args = wp_parse_args(
            $args,
			array(
				'method' => $this->method,
				// TODO should be a constant
				'timeout' => 20
			)
		);

		// make request to end point url
		$response = wp_remote_request( $url, $request_args );

		// get response code
		$response_code = wp_remote_retrieve_response_code( $response );

        // var_dump($url, $request_args, '======================================');

		// only HTTP 200 is acceptable
		if ( 200 == $response_code ) {
			// parse response body
			$this->result = $this->parse(
				trim( wp_remote_retrieve_body( $response ) )
			);
        // if bad request, give the feedback
		} else if ( 400 == $response_code ) {

            throw new Travel_Logic_Bad_Request_Exception(
                wp_remote_retrieve_body( $response ) );

        } else {
            var_dump($response);

            // throw exception, include invalid response code
            throw new Travel_Logic_Exception(
				sprintf(
					__( 'Fetching data from API failed. Error code was: %s.', 'travel-logic' ),
					$response_code
				)
			);
		}

		// maintain the chain
		return $this;
	}

	/**
	 * Perform a JSON fetch.
	 *
	 * @param string $end_point
	 * @return Travel_Logic_Request
	 */
	protected function fetch_json( $end_point )
	{
		// call fetch with custom headers/body
		$this->fetch(
			$end_point,
			array(
				'headers' => array(
					'Content-Type' => 'application/json; charset=utf-8'
				),
				'body' => json_encode( $this->fields() )
			)
		);

		// maintain the chain
		return $this;
	}

	/**
	 * Parse fetched data and return result.
	 *
	 * Automatically decodes, validates, and handle response errors.
	 *
	 * @param string $string
	 * @return stdClass
	 * @throws Travel_Logic_Exception
	 */
	private function parse( $string )
	{
		// string must have some meat to it
		if ( strlen( $string ) ) {

			// decode it
			$data = $this->decode( $string );

			// is http validation enabled?
			if ( true === $this->http_validation ) {

				// yep, we are done
				return $data;

			} elseif ( $this->is_valid_response( $data ) ) {

				// response is valid, check code
				if ( 0 === $data->Code ) {
					// successful request, return result
					if ( is_array( $data->Result ) ) {
						return $data->Result;
					} else {
						return array( $data->Result );
					}
				} else {
                    // response is an error
                    throw new Travel_Logic_Exception(
						sprintf(
							__( 'Fetching data from API failed. Error message was: "%s"', 'travel-logic' ),
							$data->ErrorMessage
						)
					);
				}

			} else {
                return $data;

				// response is invalid/malformed
				// throw new Travel_Logic_Exception(
				// 	__( 'Fetching data from API failed. Invalid or malformed data was returned.', 'travel-logic' )
				// );
			}
		} else {
			// empty string is not good
			throw new Travel_Logic_Exception(
				__( 'Fetching data from API failed. No data was returned.', 'travel-logic' )
			);
		}
	}

	/**
	 * Returns true if response is valid
	 *
	 * @param mixed $data
	 * @return boolean
	 */
	private function is_valid_response( $data )
	{
		// data must be an object
		if ( $data instanceof stdClass ) {

			// object must have these three props
			$props = array( 'Code', 'ErrorMessage', 'Result' );

			// loop required props
			foreach ( $props as $prop ) {
				// check if exists
				if ( !property_exists( $data, $prop ) ) {
					// property is missing, not good
					return false;
				}
			}

			// made it, data is valid
			return true;
		}

		// not an object
		return false;
	}

	/**
	 * Return all or part of the result set
	 *
	 * @param integer $offset
	 * @param integer $length
	 * @return array
	 */
	public function result( $offset = 0, $length = 10 )
	{
		// partial result?
		if ( 2 === func_num_args() ) {
			// yep, slice it up
			return array_slice( $this->result, $offset, $length );
		} else {
			// return entire result
			return $this->result;
		}
	}

	/**
	 * Return total number of items in result
	 *
	 * @return integer
	 */
	public function result_count()
	{
		return count( $this->result );
	}

	/**
	 * Make request and return results as an array.
	 *
	 * @param array $args
	 * @return self
	 */
	abstract public function request( $args );

}

/**
 * Get Customer information request
 */
class Travel_Logic_Get_Customer extends Travel_Logic_Request
{
	/**
	 */
	public function request( $args )
	{
		// fetch results
		$this
			->method('GET')
			->http_validation( true )
			->fetch( 'GetCustomer/' . $args['CustomerId'] )
			->fields( $args );

		// maintain the chain
		return $this;
	}
}



/**
 * SaveCustomer request
 */
class Travel_Logic_Customer_Save extends Travel_Logic_Request
{
    private $error = array();

	/**
	 */
	public function request( $args )
	{
        try {
    		// fetch results
    		$this
    			->method( 'POST' )
    			->fields( $args )
    			->fetch_json( 'Customer/Register' );

    		// get result
    		$result = $this->result();

    		// check result
    		if ( is_array( $result ) ) {
    			// get an id?
    			if ( is_int( $result[0] ) && $result[0] >= 1 ) {
    				// yep, authenticate
    				$customer_auth = new Travel_Logic_Customer_Auth();
    				$customer_auth->authenticate( $result[0], $args['UserName'] );
    			}
    		}
        }
        catch (Travel_Logic_Bad_Request_Exception $e) {
            $this->error['message'] = $e->getMessage();
            $this->error['errors']  = $e->getErrors();
			// TODO re-throw exception or supposed to abort error?
        }


		// maintain the chain
		return $this;
	}

    public function error()
    {
        if ( empty( $this->error ) ) {
            return false;
        }

        return $this->error;
    }
}

/**
 * Account request
 */
class Travel_Logic_Customer_Token extends Travel_Logic_Request
{

    /**
     * Get or retrieve a new Authorization Token
     */
    public function token()
    {
        if ( $this->authorized() ) {
            return $this->authorization();
        }

        return $this->request_token()->authorization();
    }

    public function request( $args )
    {
        // empty
    }

    /**
     * Return the request object
     *
     * @return Travel_Logic_Request
     */
    private function request_token()
    {
        // fetch results
        $this
            ->method( 'POST' )
            ->http_validation( true )
            ->fields( array(
                'grant_type' => 'password',
                'username'   => 'test1@test2.com',
                'password'   => 'Aa23456!'
            ) )
            // the foward slash will remove the /api from the url
            ->fetch(
                '/Token',
                array(
                    'headers' => array(
                        'Content-Type' => 'application/x-www-form-urlencoded; charset=utf-8'
                    ),
                    'body' => http_build_query( $this->fields() )
                )
            );

        // get result
        $result = (array) $this->result();

        // check result
        if ( is_array( $result ) ) {
            if ( array_key_exists('access_token', $result) ) {
                // yep, save to session
                $this->set_authorization( $result );
            }
        }

        // maintain the chain
        return $this;
    }

    /**
     * Set the auth cookie
     *
     * @param array $id
     * @param string $username
     */
    private function set_authorization( $result )
    {
        $_SESSION['tlogic_authorization'] = sprintf(
            '%s %s',
            ucfirst( $result['token_type'] ),
            $result['access_token'] );

        $_SESSION['tlogic_authorization_expires'] = strtotime(
            $result['.expires'] );
    }

    /**
     * Return true if customer is authorized.
     *
     * @return boolean
     */
    public function authorized()
    {
        return (
            isset( $_SESSION['tlogic_authorization'] ) &&
            isset( $_SESSION['tlogic_authorization_expires'] ) &&
            $_SESSION['tlogic_authorization_expires'] >= time()
        );
    }

    public function authorization()
    {
        if ( isset( $_SESSION['tlogic_authorization'] ) ) {
            return $_SESSION['tlogic_authorization'];
        } else {
            return null;
        }
    }
}

/**
 * Authenticate request
 */
class Travel_Logic_Customer_Auth extends Travel_Logic_Request
{
	/**
	 */
	public function request( $args )
	{
		// fetch results
		$this
			->method( 'POST' )
			->fields( $args )
			->fetch_json( 'Customer/Authenticate' );

		// get result
		$result = $this->result();

		// check result
		if ( is_array( $result ) ) {
			// get an id?
			if ( is_int( $result[0] ) && $result[0] >= 1 ) {
				// yep, save to session
				$this->authenticate( $result[0], $args['UserName'] );
			}
		}

		// maintain the chain
		return $this;
	}

	/**
	 * Set authenticated customer id
	 *
	 * @param integer $id
	 * @param string $username
	 */
	public function authenticate( $id, $username )
	{
		$_SESSION['tlogic_authenticated_id'] = (integer) $id;
		$_SESSION['tlogic_authenticated_user'] = (string) $username;
	}

	/**
	 * Return true if customer is authenticated.
	 *
	 * @return boolean
	 */
	public function authenticated()
	{
		return (
			isset( $_SESSION['tlogic_authenticated_id'] ) &&
			is_int( $_SESSION['tlogic_authenticated_id'] ) &&
			$_SESSION['tlogic_authenticated_id'] >= 1
		);
	}

	public function authenticated_id()
	{
		if ( isset( $_SESSION['tlogic_authenticated_id'] ) ) {
			return $_SESSION['tlogic_authenticated_id'];
		} else {
			return null;
		}
	}

	public function authenticated_user()
	{
		if ( isset( $_SESSION['tlogic_authenticated_user'] ) ) {
			return $_SESSION['tlogic_authenticated_user'];
		} else {
			return null;
		}
	}

}
