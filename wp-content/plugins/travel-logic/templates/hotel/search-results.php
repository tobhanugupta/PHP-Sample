<?php
/**
 * Travel Logic - hotel search results template
 */
?>

<script type="text/javascript">
	jQuery(document).ready(function($)
	{
		var suggestions = {};

		$('.collapse').collapse();

		$('input[name="destination"]')
			.typeahead({
				'items': 25,
				'minLength': 3,
				'source':
					function ( query, process ) {
						if ( query.length ) {
							$.post(
								'<?php echo admin_url( 'admin-ajax.php' ); ?>',
								{
									action: 'tlogic_autosuggest',
									query: query
								},
								function( data ) {

									var i, source = [];
									if ( data ) {
										suggestions = data;

										for ( i in data ) {
											source.push( data[i] );
										}
									}
									process( source );
								},
								'json'
							);
						}
					}
			});
	});
</script>

<div ng-app="travelLogicApp">
	<section class="big-city-large" id="searchController" ng-controller="SearchController">

		 <div class="container-fluid">
			 <div class="span12 has-transparency">
			 	<ul class="breadcrumbs">
				  <li class="is-home"></li>
				  <li><a href="#">Hotels</a></li>
				  <li><a href="#">U.S.A.</a></li>
				  <li class="current"><a href="#">New York</a></li>
				  <li class="pull-right last"><a href="#"><img src="<?php echo get_template_directory_uri(); ?>/images/back.png"></a></li>
				</ul>

				<div class="separator"></div>

			</div>
		</div>

		<div class="container-fluid" style="background: #fff">
		 	<div class="span12 same-height">

		 		<div class="row-fluid">
		 			<div class="span3">
		 				<div class="sidebar">
							<div class="hotels-starting-at">
								<span>
									<strong>{{filteredHotels.length}}</strong>
									<ng-pluralize count="filteredHotels.length"
												when="{
													'one': 'Hotel starting at',
													'other': 'Hotels starting at'

												}">
									</ng-pluralize>
								</span>
								<br />
								<span class="price">${{minPriceHotel.MinAverPrice}}</span><br />
								<span>Narrow results or view all</span>
							</div>

							<div class="search-box-sidebar">
								<h3>Hotels near</h3>

								<form action="<?php tlogic_the_hotel_search_action() ?>" method="GET">
									<input type="hidden" name="<?php echo TLOGIC_HOTEL_SEARCH_KEY ?>" value="1">
									<div class="content-box">
										<?php if ( tlogic_frontend_has_errors() ): ?>
										<div class="alert alert-error">
											<?php _e( 'An error occured. Please make the necessary corrections and try again.', 'travel-logic' ); ?>
										</div>
										<?php endif; ?>

											<label>Where do you want to go?
											<input name="destination" type="text" placeholder="Destination" class="span12" autocomplete="off" value="<?php tlogic_the_hotel_search_field_value( 'destination' ) ?>">
											</label>
											<?php tlogic_the_hotel_search_field_error( 'destination' ); ?>

											<div class="form-inline">
												<div class="control-group span6 <?php tlogic_the_hotel_search_ctrlgrp_class( 'checkin' ) ?>">
													<label class="control-label">Check In:


														<div class="input-append">
															<input id="dpd1" name="checkin" type="text" class="span9" value="<?php tlogic_the_hotel_search_field_value( 'checkin' ); ?>">
															<span class="add-on"><i class="icon-calendar"> </i></span>
														</div>
													</label>
													<?php tlogic_the_hotel_search_field_error( 'checkin' ); ?>

												</div>
												<div class="control-group span6 <?php tlogic_the_hotel_search_ctrlgrp_class( 'checkout' ) ?>">
													<label class="control-label">Check Out:


														<div class="input-append">
															<input id="dpd2" name="checkout" type="text" class="span9" value="<?php tlogic_the_hotel_search_field_value( 'checkout' ); ?>">
															<span class="add-on"><i class="icon-calendar"> </i></span>
														</div>
													</label>
													<?php tlogic_the_hotel_search_field_error( 'checkout' ); ?>

												</div>
											</div>

											<div class="row-fluid" id="hotelRoomDetail_1">
												<div class="span4">
													<label>Room(s)
														<select name="num_room" id="num_room" class="span12">
															<option value="1"<?php if (isset($_GET['num_room']) && $_GET['num_room'] == 1) { echo ' selected="selected"'; } ?>>1</option>
															<option value="2"<?php if (isset($_GET['num_room']) && $_GET['num_room'] == 2) { echo ' selected="selected"'; } ?>>2</option>
															<option value="3"<?php if (isset($_GET['num_room']) && $_GET['num_room'] == 3) { echo ' selected="selected"'; } ?>>3</option>
														</select>
													</label>
												</div>
												<div class="span4 adult-box">
													<label>Adult(s)
														<select name="num_adult_1" class="span12">
															<option value="1" title="1"<?php if (isset($_GET['num_adult_1']) && $_GET['num_adult_1'] == 1) { echo ' selected="selected"'; } ?>>1</option>
															<option value="2" title="2"<?php if (isset($_GET['num_adult_1']) && $_GET['num_adult_1'] == 2) { echo ' selected="selected"'; } ?>>2</option>
															<option value="3" title="3"<?php if (isset($_GET['num_adult_1']) && $_GET['num_adult_1'] == 3) { echo ' selected="selected"'; } ?>>3</option>
															<option value="4" title="4"<?php if (isset($_GET['num_adult_1']) && $_GET['num_adult_1'] == 4) { echo ' selected="selected"'; } ?>>4</option>
															<option value="5" title="5"<?php if (isset($_GET['num_adult_1']) && $_GET['num_adult_1'] == 5) { echo ' selected="selected"'; } ?>>5</option>
															<option value="6" title="6"<?php if (isset($_GET['num_adult_1']) && $_GET['num_adult_1'] == 6) { echo ' selected="selected"'; } ?>>6</option>
															<option value="7" title="7"<?php if (isset($_GET['num_adult_1']) && $_GET['num_adult_1'] == 7) { echo ' selected="selected"'; } ?>>7</option>
															<option value="8" title="8"<?php if (isset($_GET['num_adult_1']) && $_GET['num_adult_1'] == 8) { echo ' selected="selected"'; } ?>>8</option>
															<option value="9" title="9"<?php if (isset($_GET['num_adult_1']) && $_GET['num_adult_1'] == 9) { echo ' selected="selected"'; } ?>>9</option>
															<option value="10" title="10"<?php if (isset($_GET['num_adult_1']) && $_GET['num_adult_1'] == 10) { echo ' selected="selected"'; } ?>>10</option>
														</select>
														<!-- <select name="num_adult_1" class="span12">
															<?php tlogic_the_hotel_search_num_adult_options(); ?>
														</select>
														<?php tlogic_the_hotel_search_field_error( 'num_adult' ); ?> -->
													</label>
												</div>
												<div class="span4 children-box">
													<label>Children
														<select name="num_child_1" class="num_child" data-child="1">
															<option value="0" title="0"<?php if (isset($_GET['num_child_1']) && $_GET['num_child_1'] == 0) { echo ' selected="selected"'; } ?>>0</option>
															<option value="1" title="1"<?php if (isset($_GET['num_child_1']) && $_GET['num_child_1'] == 1) { echo ' selected="selected"'; } ?>>1</option>
															<option value="2" title="2"<?php if (isset($_GET['num_child_1']) && $_GET['num_child_1'] == 2) { echo ' selected="selected"'; } ?>>2</option>
															<option value="3" title="3"<?php if (isset($_GET['num_child_1']) && $_GET['num_child_1'] == 3) { echo ' selected="selected"'; } ?>>3</option>
															<option value="4" title="4"<?php if (isset($_GET['num_child_1']) && $_GET['num_child_1'] == 4) { echo ' selected="selected"'; } ?>>4</option>
															<option value="5" title="5"<?php if (isset($_GET['num_child_1']) && $_GET['num_child_1'] == 5) { echo ' selected="selected"'; } ?>>5</option>
														</select>
														<!-- <select name="num_child_1" class="num_child" data-child="1" class="span12">
															<?php tlogic_the_hotel_search_num_child_options(); ?>
														</select>
														<?php tlogic_the_hotel_search_field_error( 'num_child' ); ?> -->
													</label>
												</div>
											</div>

											<?php
												// TODO move to template tags file
												function generateChildAgesBox($loop) {
													//echo 'loop: '.$loop;


													$generateChildAgesBox = '';
													for($x = 1; $x <= $_GET['num_child_'.$loop]; $x++) {
														//echo 'x: '.$x;

														$generateChildAgesBox .= '<div class="row-fluid" id="childrenAges_Room'. $loop .'_Child'. $x .'">'.
															'<div class="span8 text-right">'.
															'Child '. $x . ' age'.
															'</div>'.
															'<div class="span4 adult-box">'.
															'	<label>'.
															'		<select name="child_age_room'. $loop .'_child'. $x .'" class="span12">';


															for ($y = 0; $y <= 17; $y++) {
																if ($_GET['child_age_room'. $loop .'_child'. $x] == $y) {
																	$generateChildAgesBox .= '			<option value="'.$y.'" title="'.$y.'" selected="selected">'.$y.'</option>';
																} else {
																	$generateChildAgesBox .= '			<option value="'.$y.'" title="'.$y.'">'.$y.'</option>';
																}
															}


														$generateChildAgesBox .= 	'		</select>'.
															'	</label>'.
															'</div>'.
														'</div>';
													}

													return $generateChildAgesBox;
												}
											?>
											<div id="receiveChildAge_1">
												<?php if (isset($_GET['num_child_1']) && $_GET['num_child_1'] > 0) {

													echo generateChildAgesBox(1);

												} ?>
											</div>

											<div id="receiveHotelDeails">
												<?php
													// TODO create a template tags function
													if (isset($_GET['num_room']) && $_GET['num_room'] > 1) {

													for($x = 2; $x <= $_GET['num_room']; $x++) {
														echo '<div class="row-fluid" id="hotelRoomDetail_'. $x .'" style="padding: 10px 0; border-top: 1px solid #fa6044;">'.
																'<div class="span4">'.
																'<br />Room '. $x .
																'</div>'.
																'<div class="span4 adult-box">'.
																'	<label>Adult(s)'.
																'		<select name="num_adult_'. $x .'" class="span12">';

															for ($y = 1; $y <= 10; $y++) {
																if ($_GET['num_adult_'.$x] == $y) {
																	echo '			<option value="'.$y.'" title="'.$y.'" selected="selected">'.$y.'</option>';
																} else {
																	echo '			<option value="'.$y.'" title="'.$y.'">'.$y.'</option>';
																}
															}

														echo	'		</select>'.
																'	</label>'.
																'</div>'.
																'<div class="span4 children-box">'.
																'	<label>Children'.
																'		<select name="num_child_'. $x .'" class="num_child" data-child="'. $x .'" class="span12">';

															for ($y = 1; $y <= 5; $y++) {
																if ($_GET['num_child_'.$x] == $y) {
																	echo '			<option value="'.$y.'" title="'.$y.'" selected="selected">'.$y.'</option>';
																} else {
																	echo '			<option value="'.$y.'" title="'.$y.'">'.$y.'</option>';
																}
															}

														echo	'		</select>'.
																'	</label>'.
																'</div>'.
																'<div id="receiveChildAge_'. $x .'">';

																	if (isset($_GET['num_child_'.$x]) && $_GET['num_child_'.$x] > 0) {
																		echo generateChildAgesBox($x);
																	}

															echo	'</div>'.
															'</div>';
													}
												} ?>
											</div>



									</div>

									<input type="submit" value="Search" class="btn btn-danger" />
									</form>
							</div>

							<hr class="separator-sidebar" />

							<div class="filters">
								<h3>Filter by</h3>
							</div>

							<hr class="separator-sidebar" />

							<div class="filters">
								<strong>Star rating</strong>

								<div class="clearfix"></div>

								<ul class="inline filterByRating<?php if ($_GET['starRatingFilterValue'] == 5) { echo " checked"; } ?>" data-rating="5">
								  <li class="span2"><input ng-model="filters.rating" ng-true-value="5" type="checkbox"<?php if ($_GET['starRatingFilterValue'] == 5) { echo " checked"; } ?> /></li>
								  <li class="span6"><i class="icon-star-blue"></i> <i class="icon-star-blue"></i> <i class="icon-star-blue"></i> <i class="icon-star-blue"></i> <i class="icon-star-blue"></i> </li>
								  <li class="span4">5 Stars ({{starsCount[5] || 0}})</li>
								</ul>
								<div class="clearfix"></div>

								<ul class="inline filterByRating<?php if ($_GET['starRatingFilterValue'] == 4) { echo " checked"; } ?>" data-rating="4">
								  <li class="span2"><input ng-model="filters.rating" ng-true-value="4" type="checkbox"<?php if ($_GET['starRatingFilterValue'] == 4) { echo " checked"; } ?> /></li>
								  <li class="span6"><i class="icon-star-blue"></i> <i class="icon-star-blue"></i> <i class="icon-star-blue"></i> <i class="icon-star-blue"></i> </li>
								  <li class="span4">4 Stars ({{starsCount[4] || 0}})</li>
								</ul>
								<div class="clearfix"></div>

								<ul class="inline filterByRating<?php if ($_GET['starRatingFilterValue'] == 3) { echo " checked"; } ?>" data-rating="3">
								  <li class="span2"><input ng-model="filters.rating" ng-true-value="3" type="checkbox"<?php if ($_GET['starRatingFilterValue'] == 3) { echo " checked"; } ?> /></li>
								  <li class="span6"><i class="icon-star-blue"></i> <i class="icon-star-blue"></i> <i class="icon-star-blue"></i></li>
								  <li class="span4">3 Stars ({{starsCount[3] || 0}})</li>
								</ul>
								<div class="clearfix"></div>

								<ul class="inline filterByRating<?php if ($_GET['starRatingFilterValue'] == 2) { echo " checked"; } ?>" data-rating="2">
								  <li class="span2"><input ng-model="filters.rating" ng-true-value="2" type="checkbox"<?php if ($_GET['starRatingFilterValue'] == 2) { echo " checked"; } ?> /></li>
								  <li class="span6"><i class="icon-star-blue"></i> <i class="icon-star-blue"></i></li>
								  <li class="span4">2 Stars ({{starsCount[2] || 0}})</li>
								</ul>
								<div class="clearfix"></div>

								<ul class="inline filterByRating<?php if ($_GET['starRatingFilterValue'] == 1) { echo " checked"; } ?>" data-rating="1">
								  <li class="span2"><input ng-model="filters.rating" ng-true-value="1" type="checkbox"<?php if ($_GET['starRatingFilterValue'] == 1) { echo " checked"; } ?> /></li>
								  <li class="span6"><i class="icon-star-blue"></i></li>
								  <li class="span4">1 Star ({{starsCount[1] || 0}})</li>
								</ul>
								<div class="clearfix"></div>


							</div>

							<div class="clearfix"></div>

							<hr class="separator-sidebar" />

							<div class="filters filterByPrice">
								<strong>Price Range</strong>

								<input type="text" id="priceRange" />
							</div>

							<hr class="separator-sidebar" />

							<a href="#myModal" role="button" class="btn" data-toggle="modal">
								<img src="" id="load_image_map" width="214" height="214"  />
							</a>
							<br /><br />

		 				</div>
		 			</div>
		 			<div class="span9">
		 				<div class="results-content">
		 					<div class="row-fluid">
		 						<div class="span6 pt-10">
		 							<strong>Sort By:</strong>
		 						</div>
		 						<div class="span6">
		 							<ul class="inline-list sort-by">
		 								<li class="span4"><a href ng-click="sortField='Name';sortReverse=!sortReverse" id="orderByHotelName" data-sort="<?php if ($_GET['orderByHotelName'] == "DESC") { echo "ASC"; } else { echo "DESC"; } ?>"><img src="<?php echo get_template_directory_uri(); ?>/images/hotel-name.jpg"></a></li>
		 								<li class="span4"><a href ng-click="sortField='MinAverPrice';sortReverse=!sortReverse" id="orderByHotelPrice" data-sort="<?php if ($_GET['orderByHotelPrice'] == "DESC") { echo "ASC"; } else { echo "DESC"; } ?>"><img src="<?php echo get_template_directory_uri(); ?>/images/price.jpg"></a></li>
		 								<!-- <li class="span3"><img src="<?php echo get_template_directory_uri(); ?>/images/most-popular.jpg" class="incomplete"></li> -->
		 								<li class="span4"><img src="<?php echo get_template_directory_uri(); ?>/images/display-mode.jpg" class="incomplete"></li>
		 							</ul>
		 						</div>
		 					</div>


			 				<hr class="separator-sidebar" />

			 				<div class="row-fluid animate"
			 						ng-if="hotels.length"
			 						dir-paginate="hotel in filteredHotels = (hotels | filter:filterHotels) | orderBy:sortField:sortReverse | itemsPerPage: hotelsPerPage"
			 						current-page="currentPage">

							    <div class="span12">
							        <div class="results">
							            <div class="inner">
							            	 <div class="row-fluid">
							            	 	<div class="span4">
							            	 		<a href="{{config.details_page}}{{hotel.HotelId}}"><img class="pull-left result-imgs" ng-src="{{hotel.Thumb}}"></a>
							            	 	</div>
							            	 	<div class="span6">
							            	 		<div class="hotel-descriptions">
							 				             <p class="hotel-name">
							 					            <a ng-href="{{config.details_page}}{{hotel.HotelId}}"><strong>{{hotel.Name}}</strong></a><br>
							 				             </p>
							 				             <p class="hotel-description">{{hotel.Desc}}</p>
							 				            <!-- <strong _e( 'Amenities:', 'travel-logic'); </strong> -->
							 		                    <br />
							 				            <!--<ul class="amenities">
							 					            <li>habitant morbi</li>
							 					            <li>habitant morbi</li>
							 					            <li>habitant morbi</li>
							 				            </ul>-->
							 				            <!-- <img src="get_template_directory_uri();/images/amenities.png" class="incomplete"> -->
							 			             </div>
							            	 	</div>
							            	 	<div class="span2">
							            	 		<div class="stars">
							            	 			<i ng-repeat="start in [] | range:hotel.StarsLevel" class="icon-star-blue"></i>
							            	 		</div>
							            	 		<div class="prices">
							 				             <span class="price">{{hotel.Currency}} {{hotel.MinAverPrice}}</span>
							                             <span class="avg">avg/night</span>

							                             <br /><br />
							 				             <input name="HotelId" type="hidden" value="{{hotel.HotelId}}">
							 				             <a href="{{config.details_page}}{{hotel.HotelId}}" class="btn-select">Select</a>
							 			             </div>
							            	 	</div>
							            	 </div>
							            </div>
							        </div>
									<div class="clearfix"></div>
							    </div>
							</div>

							<?php $location_data = array(); ?>

			 				<?php if ( tlogic_has_hotels() ): ?>

								<?php while ( tlogic_hotels() ): tlogic_the_hotel(); ?>


									<?php //tlogic_load_template( 'hotel/search-result.php', false ); ?>

									<?php
										//build array for google maps
										array_push($location_data,  array("hotelID" => tlogic_get_the_hotel_id(), "hotelLat" => tlogic_get_the_hotel_latitude(), "hotelLong" => tlogic_get_the_hotel_longitude(), "hotelName" => tlogic_get_the_hotel_name(), "hotelPrice" => tlogic_get_the_hotel_price_low(), "hotelLink" => tlogic_get_the_hotel_permalink()));
									?>
								<?php endwhile; ?>

							<?php endif; ?>

							<script>
								window.LocationData = <?php echo json_encode($location_data); ?>;
							</script>

							<!-- <input type="text" value='<?php echo json_encode($location_data); ?>' id="locationData" /> -->

							<hr class="separator-sidebar" />

							<dir-pagination-controls></dir-pagination-controls>
			 			</div>
		 			</div>
		 		</div>

	        </div>
	    </div>

	 </section>

	 <!-- Modal -->
	<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	    <h3 id="myModalLabel">Hotel Results</h3>
	  </div>
	  <div class="modal-body">
		<div>
	    	<div id="map-canvas"></div>
		</div>
	  </div>
	   <div class="modal-footer">
	   </div>
	</div>
</div>
