
<?php
/**
 * Travel Logic - car search form template
 */


// tlogic_the_car_search_pickup_city_options();
?>

<?php if (!tlogic_frontend_is_car_search()) { ?>
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

<div class="container-fluid">
	<div class="text-slider">
		<div class="row-fluid">
			<div class="span8 offset2 is-center">
				<span class="title-slider">Car Rental</span>
				<span class="sub-title-slider">--</span>
			</div>
		</div>
		<div class="row-fluid boxes-home">


			<div class="span4 search-box" ng-controller="SearchFormController">
				<form action="<?php tlogic_the_car_search_action() ?>" method="GET">
				<input type="hidden" name="<?php echo TLOGIC_TICKET_SEARCH_KEY ?>" value="1">
				<div class="content-box">
					<?php if ( tlogic_frontend_has_errors() ): ?>
					<div class="alert alert-error">
						<?php _e( 'An error occured. Please make the necessary corrections and try again.', 'travel-logic' ); ?>
					</div>
					<?php endif; ?>

                        <label>Pickup Country (hardcoded to UK)
                            <select name="pickupCountry" class="span12">
                                <option value=''>Select</option>
                                <?php tlogic_the_car_search_pickup_country_options(); ?>
                            </select>
                        </label>
                        <?php tlogic_the_car_search_field_error( 'pickupCountry' ); ?>

                        <label class="incomplete">Pickup City (hardcoded to London)
                            <select name="pickupCity" class="span12">
                                <option value=''>Select</option>
                                <?php tlogic_the_car_search_pickup_city_options(); ?>
                            </select>
                        </label>
                        <?php tlogic_the_car_search_field_error( 'pickupCity' ); ?>

                        <label class="incomplete">Pickup Location (hardcoded to UK)
                            <select name="pickupLocation" class="span12">
                                <option value=''>Select</option>
                                <?php tlogic_the_car_search_pickup_location_options(); ?>
                            </select>
						</label>
						<?php tlogic_the_car_search_field_error( 'pickupLocation' ); ?>


						<div class="form-inline">
							<div class="control-group span6 <?php tlogic_the_car_search_ctrlgrp_class( 'checkin' ) ?>">
								<label class="control-label">Select Dates


									<div class="input-append">
										<input id="dpd1" name="checkin" type="text" class="span10">
										<span class="add-on"><i class="icon-calendar"> </i></span>
									</div>
								</label>
									<?php tlogic_the_car_search_field_error( 'checkin' ); ?>

							</div>
							<div class="control-group span6 <?php tlogic_the_car_search_ctrlgrp_class( 'checkout' ) ?>">
								<label class="control-label">&nbsp;


									<div class="input-append">
										<input id="dpd2" name="checkout" type="text" class="span10">
										<span class="add-on"><i class="icon-calendar"> </i></span>
									</div>
								</label>
									<?php tlogic_the_car_search_field_error( 'checkout' ); ?>

							</div>
						</div>

						<div class="row-fluid" id="carRoomDetail">
							<div class="span6 adult-box">
								<label>Adult(s)
									 <select name="num_adult" class="span12">
										<?php tlogic_the_car_search_num_adult_options(); ?>
									</select>
									<?php tlogic_the_car_search_field_error( 'num_adult' ); ?>
								</label>
							</div>
						</div>

						<div id="receiveChildAge">
						</div>

						<div id="receiveCarDeails">
						</div>
				</div>

				<input type="submit" value="Search" class="btn-search" />
				</form>
			</div>




			<div class="span4">
				<a href="#">
					<div class="box-mask">
						<img src="<?php echo get_template_directory_uri(); ?>/images/slide2.jpg">
						<div class="footer-box">
							<span class="destination">Cancun</span>
							<span class="price">$59.99</span>
						</div>
					</div>
				</a>
			</div>


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
											<span class="price">Save up to <?php echo types_render_field("save-up-to", array()); ?></span>
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
											<span class="price">Save up to <?php echo types_render_field("save-up-to", array()); ?></span>
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