<?php
/**
 * Travel Logic - hotel search result (single item) template
 */
?>
<div class="row-fluid">
    <div class="span12">
        <div class="results">
            <div class="inner">
            	 <div class="row-fluid">
            	 	<div class="span4">
            	 		<a href="<?php tlogic_the_hotel_permalink() ?>"><img class="pull-left result-imgs" src="<?php tlogic_the_hotel_thumb() ?>"></a>
            	 	</div>
            	 	<div class="span6">
            	 		<div class="hotel-descriptions">
 				             <p class="hotel-name">
 					             <a href="<?php tlogic_the_hotel_permalink() ?>"><strong><?php tlogic_the_hotel_name(); ?></strong></a><br>
 				             </p>
 				             <p class="hotel-description">
 					             <?php tlogic_the_hotel_description(); ?>
 				             </p>
 				            <!-- <strong><?php _e( 'Amenities:', 'travel-logic'); ?></strong> -->
 		                    <br />
 				            <!--<ul class="amenities">
 					            <li>habitant morbi</li>
 					            <li>habitant morbi</li>
 					            <li>habitant morbi</li>
 				            </ul>-->
 				            <img src="<?php echo get_template_directory_uri(); ?>/images/amenities.png" class="incomplete"> 				            
 			             </div>
            	 	</div>
            	 	<div class="span2">            	 		
            	 		<div class="stars"><?php tlogic_the_hotel_stars_icons(); ?></div>
            	 		<div class="prices">
 				             <span class="price"><?php tlogic_the_hotel_currency(); ?> <?php tlogic_the_hotel_price_low(); ?></span>
                             <span class="avg">avg/night</span>
                            
                             <br /><br />
 				             <input name="HotelId" type="hidden" value="<?php tlogic_the_hotel_id() ?>">
 				             <a href="<?php tlogic_the_hotel_permalink() ?>" class="btn-select"><?php _e( 'Select', 'travel-logic'); ?></a>
 			             </div>
            	 	</div>
            	 </div>
            </div>
        </div>
		<div class="clearfix"></div>
    </div>
</div>