<?php
/**
 * Travel Logic - hotel rooms template
 */
?>

<?php tlogic_the_hotel_rooms(); ?>
<h3>Room type</h3>

<?php while ( tlogic_the_hotel_room_type() ): ?>
   <hr class="separator-sidebar" />

	<div class="row-fluid results">
   		<div class="span4 incomplete"></div>
		<div class="span5">
			<h4><?php tlogic_the_hotel_room_type_name() ?></h4>
			<span class="incomplete"><strong>Max Occupancy:</strong> 2 adults</span><br />
			<img src="<?php echo get_template_directory_uri(); ?>/images/amenities.png" class="incomplete">
			
			<!-- TODO: Crete icon for amenities -->
			<?php foreach( tlogic_get_the_hotel_amenities() as $Amenity ): ?>
			   <li><?php echo $Amenity->Name; ?></li>
			<?php endforeach; ?>
			
			<ul class="room-details-list incomplete">
				<li>FREE Cancellation</li>
				<li>Pay at hotel or pay today</li>
			</ul>
		</div>
   		<div class="span3">
   			<div class="prices">
	   			<span class="price"><?php tlogic_the_hotel_rooms_currency(); ?> <?php tlogic_the_hotel_room_type_avg_price(); ?></span>
	            <span class="avg">avg/night</span>
				<br /><br />
	   			<a href="<?php tlogic_the_hotel_room_to_book_permalink( tlogic_get_the_hotel_room_type_id() ) ?>" class="btn-select"><?php _e( 'Book', 'travel-logic'); ?></a>
	   		</div>
   		</div>
	</div>
	<!--<a href="#" data-tlogic-room-type-id="<?php tlogic_the_hotel_room_type_id() ?>" class="tlogic-cancel-policy"><?php _e( 'View cancellation policy', 'travel-logic' ) ?></a>-->
<?php endwhile; ?>

<div id="room-cancel-policy" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<h3 id="myModalLabel"><?php _e( 'Room Cancellation Policy', 'travel-logic' ); ?></h3>
	</div>
	<div class="modal-body">
		<ul>
		<!-- AJAX result li items are injected here -->
		</ul>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
	</div>
</div>

<script type="text/javascript">
	jQuery(document).ready(function($)
	{
		$('a.tlogic-cancel-policy').click(
			function(e) {
				$.post(
					'<?php echo admin_url( 'admin-ajax.php' ); ?>',
					{
						action: 'tlogic_cancel_policy',
						hotel_id: '<?php tlogic_the_hotel_id() ?>',
						room_type_id: $(this).attr( 'data-tlogic-room-type-id' )
					},
					function( response ) {
						if ( response ) {
							var policy = $('div#room-cancel-policy'),
								list = $('div.modal-body', policy).empty(),
								i, item;
							for ( i in response ) {
								item = $('<li></li>');
								item.append( response[i] );
								list.append( item );
							}
							policy.modal('show');
						}
					},
					'json'
				);

				e.preventDefault();
			}
		);
	});
</script>