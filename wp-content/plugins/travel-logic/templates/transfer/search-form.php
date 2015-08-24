
<?php
/**
 * Travel Logic - transfer search form template
 */
?>

<?php

 if (!tlogic_frontend_is_transfer_search()) { ?>
<div id="myCarousel" class="carousel slide">

    <!-- Carousel items -->
    <div class="carousel-inner">
        <div class="active item"><img src="<?php echo get_template_directory_uri(); ?>/images/slide10.jpg"></div>
        <div class="item"><img src="<?php echo get_template_directory_uri(); ?>/images/slide20.jpg"></div>
        <div class="item"><img src="<?php echo get_template_directory_uri(); ?>/images/slide30.jpg"></div>
    </div>
    <!-- Carousel nav -->
    <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div>
<?php  } ?>

<script type="text/javascript">
/*	
jQuery(document).ready(function($)
	{	
			$( "#fromDestination1" ).change(function() {
				 val=$( "#fromDestination1" ).val();
				 var $select = $("#transferPickUpCity"), options = '';
      			// $select.empty();      
				// var $select = $('#transferPickUpCity');
				 alert( "Handler for .change() called."+val );
				
				 var data = {
							'action': 'tlogic_transfer_autosuggest',
							'query': val,
							'dataType': 'json'
							};
							
				$.post('<?php //echo admin_url( 'admin-ajax.php' ); ?>', data, function(response) {
				alert(response);
				//document.write(response);
				$select.empty();      
		
			 for ( i in response ) {
							options += "<option value='"+response[i].Text+"'>"+ response[i].Text +"</option>";  
							}
			  // alert(response[i]);
			
			   
			   $select.append(options);
			   
					
				});			
							
			});
	});
	*/
	
</script>



<script type="text/javascript">
	jQuery(document).ready(function($)
	{
		$('#fromDestination1').change(		
			function(e) {
			/*
			 $('#toDestination option').prop("disabled", false);
    		 $("#toDestination").not(this).find("option[value="+ $(this).val() + "]").prop('disabled', true);
			*/ 
			 val=$("#fromDestination1" ).val();
			 var $select = $("#transferPickUpCity"), options = '';
				$.post(
					'<?php echo admin_url( 'admin-ajax.php' ); ?>',
					{
						'action': 'tlogic_transfer_autosuggest',
						'query': val
					},
					function( response ) {
						if ( response ) {
							$select.empty();    
							for ( i in response ) {
							options += "<option value='"+response[i].Id+"/"+response[i].Value+"'>"+ response[i].Text +"</option>";
							}
							 $select.append(options);
						}
					},
					'json'
				);

				e.preventDefault();
			}
		);
	});
</script>



<script type="text/javascript">
	jQuery(document).ready(function($)
	{
		$('#toDestination').change(		
			function(e) {
			/*
			 $('#fromDestination1 option').prop("disabled", false);
    		 $("#fromDestination1").not(this).find("option[value="+ $(this).val() + "]").prop('disabled', true);
			*/
			 val=$("#toDestination" ).val();
			 var $select = $("#toPickUpCity"), options = '';
				$.post(
					'<?php echo admin_url( 'admin-ajax.php' ); ?>',
					{
						'action': 'tlogic_transfer_autosuggest',
						'query': val
					},
					function( response ) {
						if ( response ) {
						//document.write(response);
							$select.empty();    
							for ( i in response ) {
							options += "<option value='"+response[i].Id+"/"+response[i].Value+"'>"+ response[i].Text +"</option>";  
							}
							 $select.append(options);
						}
					},
					'json'
				);

				e.preventDefault();
			}
		);
	});
	
	
	function showHideDeparture (box1,box2) {
    var chboxs = document.getElementsByName("oneway");
    var vis = "block";
    for(var i=0;i<chboxs.length;i++) { 
        if(chboxs[i].checked){
         vis = "none";
            break;
        }
    }
    document.getElementById(box1).style.display = vis;
	document.getElementById(box2).style.display = vis;
}




	
</script>


<style type="text/css">
.selectPickDrop
{
width:250px;
}
.selectToFrom
{
width:130px;
}
</style>
<div class="container-fluid">
	<div class="text-slider">
		<div class="row-fluid">
			<div class="span8 offset2 is-center">
				<span class="title-slider">Book your Transfers</span>
				<span class="sub-title-slider">The best deals on Transfers</span>
			</div>
		</div>
		<div class="row-fluid boxes-home">


			<div class="span6 search-box">
				<form action="<?php tlogic_the_transfer_search_action() ?>" method="GET">
				<input type="hidden" name="<?php echo TLOGIC_TRANSFER_SEARCH_KEY ?>" value="1">
				<div class="content-box">
					<?php if ( tlogic_frontend_has_errors() ): ?>
					<div class="alert alert-error">
						<?php _e( 'An error occured. Please make the necessary corrections and try again.', 'travel-logic' ); ?>
					</div>
					<?php endif; ?>

                      
                       <div class="form-inline">
							<div class="control-group span5">
                            <label>Select your way</label>
                            </div>
                            <div class="control-group span7">
                           <input type="checkbox" name="oneway" onclick="showHideDeparture('departure','departure_label')"/> One-way transfer only
                            </div>
                           </div>
                        <div class="form-inline">
							<div class="control-group span4 <?php tlogic_the_transfer_search_ctrlgrp_class( 'fromDestination1' ) ?>">
								<label class="control-label">
									<div class="input-append">									
                                        <select name="fromDestination1" placeholder="From"  id="fromDestination1" class="selectToFrom">
                                         <option value=''>FROM</option>
                                        <option value="TR">Terminal</option>
                                        <option value="HO">Hotel</option>
                                        </select>
									</div>
								</label>
									<?php //tlogic_the_transfer_search_field_error( 'fromDestination1' ); ?>

							</div>
							<div class="control-group span8 <?php tlogic_the_transfer_search_ctrlgrp_class( 'transferPickUpCity' ) ?>">
								<label class="control-label">
									<div class="input-append">
									 <select name="transferPickUpCity" class="span12" id="transferPickUpCity" style="width:280px;">
                                <option value=''>Pick-up Location</option>
                                
                               
                            </select>			
									</div>
								</label>
									<?php tlogic_the_transfer_search_field_error( 'transferPickUpCity' ); ?>

							</div>
						</div>
                        
                        <div class="form-inline">
							<div class="control-group span4 <?php tlogic_the_transfer_search_ctrlgrp_class( 'toDestination' ) ?>">
								<label class="control-label">
									<div class="input-append">
									
                                        <select name="toDestination" placeholder="To"  id="toDestination" class="selectToFrom">
                                         <option value=''>TO</option>
                                        <option value="TR">Terminal</option>
                                        <option value="HO">Hotel</option>
                                        </select>
									</div>
								</label>
									<?php //tlogic_the_transfer_search_field_error( 'fromDestination1' ); ?>

							</div>
							<div class="control-group span8 <?php tlogic_the_transfer_search_ctrlgrp_class( 'toPickUpCity' ) ?>">
								<label class="control-label">
									<div class="input-append">
									 <select name="toPickUpCity" class="span12" id="toPickUpCity" style="width:280px;">
                                <option value=''>Drop-off Location</option>
                                
                                <?php //tlogic_the_trasfer_search_pickup_city_options_Hotel(); ?>
                            </select>			
									</div>
								</label>
									<?php tlogic_the_transfer_search_field_error( 'toPickUpCity' ); ?>

							</div>
						</div>
                        
                         
                         <div class="form-inline">
                         <label>Select your transfer date and time</label>
						</div>
                        <div class="form-inline">
                         <label>Arrival Date and Time</label>
						</div>
						<div class="form-inline">
							<div class="control-group span6 <?php tlogic_the_transfer_search_ctrlgrp_class( 'arrival_date' ) ?>">
								<label class="control-label">							
								
									<div class="input-append">
										<input id="dpd1" name="arrival_date" type="text" class="span10">
										<span class="add-on"><i class="icon-calendar"> </i></span>
									</div>
								</label>
									<?php tlogic_the_transfer_search_field_error( 'arrival_date' ); ?>

							</div>
                             <!-- <label style="margin-bottom:0px !important;">Arrival time</label>-->
						
                        
                        <div class="control-group span3 <?php tlogic_the_transfer_search_ctrlgrp_class( 'arrival_hour' ) ?>">
								<label class="control-label">
									<div class="input-append">                                   
										 <select name="arrival_hour" class="span12">
                                         <option value="00">hh</option>
										<?php tlogic_the_transfer_search_hours('arrival_hour'); ?>
									</select>
										
									</div>
                                  
								</label>
									<?php tlogic_the_transfer_search_field_error( 'arrival_hour' ); ?>

							</div>
                            
                            	<div class="control-group span3 <?php tlogic_the_transfer_search_ctrlgrp_class( 'arrival_minutes' ) ?>">
								<label class="control-label">
									<div class="input-append">
                                    
										 <select name="arrival_minutes" class="span12">
                                         <option value="00">mm</option>
                                         <option value="00">00</option>
                                         <option value="05">05</option>
                                         <option value="10">10</option>
                                         <option value="15">15</option>
                                         <option value="20">20</option>
                                         <option value="25">25</option>
                                         <option value="30">30</option>
                                         <option value="35">35</option>
                                         <option value="40">40</option>
                                         <option value="45">45</option>
                                         <option value="50">50</option>
                                         <option value="55">55</option>
										<?php //tlogic_the_transfer_search_minutes('arrival_minutes'); ?>
									</select>
										
									</div>
                                  
								</label>
									<?php tlogic_the_transfer_search_field_error( 'arrival_minutes' ); ?>

							</div>
						
						</div>
                      
                        
                        <div class="form-inline" id="departure_label" style="display:block;">
                         <label>Departure Date and Time</label>
						</div>
                        
                        <div class="form-inline" id="departure" style="display:block;">
							<div class="control-group span6 <?php tlogic_the_transfer_search_ctrlgrp_class( 'departure_date' ) ?>">
								<label class="control-label">
								
								
									<div class="input-append">
										<input id="dpd2" name="departure_date" type="text" class="span10">
										<span class="add-on"><i class="icon-calendar"> </i></span>
									</div>
								</label>
									<?php tlogic_the_transfer_search_field_error( 'departure_date' ); ?>

							</div>
                           <!--   <label style="margin-bottom:0px !important;">Departure time</label>-->
						
                        
                        <div class="control-group span3 <?php tlogic_the_transfer_search_ctrlgrp_class( 'departure_hour' ) ?>">
								<label class="control-label">
									<div class="input-append">                                   
										 <select name="departure_hour" class="span12">
                                         <option value="00">hh</option>
										<?php tlogic_the_transfer_search_hours('departure_hour'); ?>
									</select>
										
									</div>
                                  
								</label>
									<?php tlogic_the_transfer_search_field_error( 'departure_hour' ); ?>

							</div>
                            
                            	<div class="control-group span3 <?php tlogic_the_transfer_search_ctrlgrp_class( 'departure_minutes' ) ?>">
								<label class="control-label">
									<div class="input-append">
                                    
										 <select name="departure_minutes" class="span12">
                                         <option value="00">mm</option>
                                         <option value="00">00</option>
                                         <option value="05">05</option>
                                         <option value="10">10</option>
                                         <option value="15">15</option>
                                         <option value="20">20</option>
                                         <option value="25">25</option>
                                         <option value="30">30</option>
                                         <option value="35">35</option>
                                         <option value="40">40</option>
                                         <option value="45">45</option>
                                         <option value="50">50</option>
                                         <option value="55">55</option>
										<?php //tlogic_the_transfer_search_minutes('departure_minutes'); ?>
									</select>
										
									</div>
                                  
								</label>
									<?php tlogic_the_transfer_search_field_error( 'departure_minutes' ); ?>

							</div>
						
						</div>
                        
                        

						 <label>Select # of passengers</label>
						<div class="row-fluid" id="transferRoomDetail">
							<div class="span4 adult-box">
								<label>Adult(s)
									 <select name="num_adult" class="span12">
										<?php tlogic_the_transfer_search_num_adult_options(); ?>
									</select>
									<?php tlogic_the_transfer_search_field_error( 'num_adult' ); ?>
								</label>
							</div>
							<div class="span4 children-box">
								<label>Children
									 <select name="num_child" class="num_child" data-child="1" class="span12">
										<?php tlogic_the_transfer_search_num_child_options(); ?>
									</select>
									<?php tlogic_the_transfer_search_field_error( 'num_child' ); ?>
								</label>
							</div>
						</div>

						<div id="receiveChildAge">
						</div>

						<div id="receiveTicketDeails">
						</div>
				</div>

				<input type="submit" value="Search" class="btn-search" />
				</form>
			</div>


<!--

			<div class="span4">
				<a href="#">
					<div class="box-mask">
						<img src="<?php //echo get_template_directory_uri(); ?>/images/slide2.jpg">
						<div class="footer-box">
							<span class="destination">Cancun</span>
							<span class="price">$59.99</span>
						</div>
					</div>
				</a>
			</div>

-->
			<div class="span4">
				<a href="#">
					<div class="box-mask">
						<img src="<?php echo get_template_directory_uri(); ?>/images/slide3.jpg">
						<div class="footer-box">
							<span class="destination">Belize</span>
							<span class="price">$59.99</span>
						</div>
					</div>
				</a>
			</div>

		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row-fluid has-space">
		<div class="span12">
			<h2>Today's Top Deals <small>Start your search with a look at the best rates on our site</small></h2>
		</div>
	</div>
</div>

<div class="bg-city">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="carousel slide span12" id="myCarousel2">
				<div class="carousel-inner">

							<?php
									// TODO move to template tag function
									$loop = new WP_Query( array( 'post_type' => 'deal', 'posts_per_page' => 6, 'category_name' => 'top-deals' ) );

									$count_posts = 0;
									$count_active = 0;

							 		while ( $loop->have_posts() ) : $loop->the_post();
							 			$count_posts++;
							 			$count_active++;

							 			if ($count_posts === 1) {
							 				$opened = true;

							 				if ($count_active === 1) {
							 					echo '<div class="active item">
													<ul class="thumbnails">';
											} else {
												echo '<div class="item">
													<ul class="thumbnails">';
											}
							 			}
							 ?>


								<li class="span4">

									<div class="box-mask">
										<a href="<?php the_permalink(); ?>"><?php the_post_thumbnail(); ?></a>
										<div class="footer-box">
											<span class="destination"><?php the_title(); ?></span>
											<span class="price">Save up to <?php //echo types_render_field("save-up-to", array()); ?></span>
										</div>
									</div>

								</li>

							<?php
									if ($count_posts === 3) {
						 				echo '</ul>
										</div>';
										$count_posts = 0;
										$opened = false;
						 			}

								endwhile;

								if ($opened === true) {
									echo '</ul>
									</div>';
								}

							?>

				</div>
				<a data-slide="prev" href="#myCarousel2" class="left carousel-control">‹</a>
				<a data-slide="next" href="#myCarousel2" class="right carousel-control">›</a>
			</div>
		</div>
	</div>
</div>

<div class="container-fluid has-space">
	<div class="row-fluid">
		<div class="span3">
			<h2>Featured <br />Offers</h2>
			<p>Start your search with a look <br />
			at the best rates on our site.</p>
		</div>
		<div class="span9">
			<div class="row-fluid">
				<div class="carousel slide span12" id="myCarousel3">
					<div class="carousel-inner">
						<?php
									// TODO move to template tag function
									$loop = new WP_Query( array( 'post_type' => 'deal', 'posts_per_page' => 6, 'category_name' => 'featured-offers' ) );

									$count_posts = 0;
									$count_active = 0;

							 		while ( $loop->have_posts() ) : $loop->the_post();
							 			$count_posts++;
							 			$count_active++;

							 			if ($count_posts === 1) {
							 				$opened = true;

							 				if ($count_active === 1) {
							 					echo '<div class="active item">
													<ul class="thumbnails">';
											} else {
												echo '<div class="item">
													<ul class="thumbnails">';
											}
							 			}
							 ?>


								<li class="span4">

									<div class="box-mask">
										<a href="<?php the_permalink(); ?>"><?php the_post_thumbnail(); ?></a>
										<div class="footer-box">
											<span class="destination"><?php the_title(); ?></span>
											<span class="price">Save up to <?php //echo types_render_field("save-up-to", array()); ?></span>
										</div>
									</div>

								</li>

							<?php
									if ($count_posts === 3) {
						 				echo '</ul>
										</div>';
										$count_posts = 0;
										$opened = false;
						 			}

								endwhile;

								if ($opened === true) {
									echo '</ul>
									</div>';
								}

							?>
					</div>
					<a data-slide="prev" href="#myCarousel3" class="left carousel-control">‹</a>
					<a data-slide="next" href="#myCarousel3" class="right carousel-control">›</a>
				</div>
			</div>
		</div>
	</div>
</div>



