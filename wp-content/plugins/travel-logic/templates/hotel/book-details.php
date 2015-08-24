<table class="table">
   <thead>
	   <tr colspan="2">
		   <td>
			   <strong><?php tlogic_the_hotel_room_to_book_name() ?></strong>
		   </td>
	   </tr>
   </thead>
   <tbody>
	   <tr>
		   <td><?php tlogic_the_hotel_room_to_book_type_name(); ?></td>
		   <td><?php tlogic_the_hotel_room_to_book_price(); ?> (<?php tlogic_the_hotel_room_to_book_currency() ?>) avg per night</td>
	   </tr>
	   <tr>
		   <td>Check In</td>
		   <td><?php tlogic_the_hotel_room_to_book_checkin() ?></td>
	   </tr>
	   <tr>
		   <td>Check Out</td>
		   <td><?php tlogic_the_hotel_room_to_book_checkout() ?></td>
	   </tr>
	   <tr>
		   <td>Number of Guests</td>
		   <td><?php tlogic_the_hotel_room_to_book_num_guests() ?></td>
	   </tr>
	   <tr>
		   <td>Number of Nights</td>
		   <td><?php tlogic_the_hotel_room_to_book_type_nights(); ?></td>
	   </tr>
	   <!-- tr>
		   <td>Sub-total:</td>
		   <td>$99.00</td>
	   </tr>
	   <tr>
		   <td>Tax:</td>
		   <td>$6.40</td>
	   </tr -->
	   <tr>
		   <td>Total:</td>
		   <td><?php tlogic_the_hotel_room_to_book_price_total() ?> (<?php tlogic_the_hotel_room_to_book_currency() ?>)</td>
	   </tr>
   </tbody>
</table>