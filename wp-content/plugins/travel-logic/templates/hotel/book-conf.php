<?php
/**
 * Travel Logic - booking confirmation template
 */

 //getting Hotel ID
 $tlogic_the_hotel_room_details = new Travel_Logic_Hotel_Details();
 $tlogic_the_hotel_room_to_book = $tlogic_the_hotel_room_details->get_room_to_book( trim( $_GET['room_id'] ), trim( $_GET['RoomSecIdentified'] ) );

 $hotelid = $tlogic_the_hotel_room_to_book->HotelId;

$hotel_details = new Travel_Logic_Hotel_Details();

$args = array(
    "id"=> $hotelid
);

$hotel_details->request( $args );

$result = $hotel_details->result();
$result = $result[0];
//0 - Tourico Provider / 1 = GTA Provider
if ($result->Supplier == 0 ) {
    $HotelSupplier = 'Tourico';
} elseif ($result->Supplier == 1 ) {
   $HotelSupplier = 'GTA';
}

//echo '<br><br>';

tlogic_the_hotel_room_to_book();

//$travel_logic_reservation = new Travel_Logic_Hotel_Book_Room();

 $expDate = $_POST['ExpDateMonth'].'/'.$_POST['ExpDateYear'];
 //$checkin = tlogic_the_hotel_room_to_book_checkin();
 //$checkout = tlogic_the_hotel_room_to_book_checkout();
 //$adults = tlogic_the_hotel_room_to_book_num_guests();

 global $tlogic_the_hotel_rooms;
$args = array(
	"CustomerId"=> tlogic_get_user_id(),
    "HotelSupplier"=> $HotelSupplier,
    "CardType"=> $_POST['CardType'], //1 (MasterCard),2 (Visa),4(AmericanExpress)
    "ExpDate"=> $expDate,
    "CardNumber"=> $_POST['CardNumber'],
    "CVV"=> $_POST['CVV'],
    "jsonHotelRequest"=> array(
    "checkIn"=> $tlogic_the_hotel_rooms->field('checkIn'),
    "checkOut"=>  $tlogic_the_hotel_rooms->field('checkOut'),
    "adults"=> $tlogic_the_hotel_rooms->field('adults'),
    "childrensAge"=> "",
    "childrens"=> "0"
    ),
    "HotelId"=> $hotelid,
    "RoomIdentified"=> $_GET['room_id'],
    "RoomSecIdentified"=> $_GET['RoomSecIdentified']
);

?>

<section>
	 <div class="container-fluid">
		 <div class="span10">
			 <div class="row-fluid">
				<div class="span12">
					<div class="span8">
						 <h2>
							 Reservation Confirmed!
						 </h2>
						 <!-- p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p -->
						 <?php tlogic_load_template( 'hotel/book-details.php' ); ?>
					</div>
				 </div>
			 </div>
		 </div>
	 </div>

 </section>