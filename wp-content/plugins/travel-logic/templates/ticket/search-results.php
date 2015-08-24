<?php
/**
 * Travel Logic - ticket search results template
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
	<section class="big-city-large" id="searchController" ng-controller="SearchController" ng-cloak>

		 <div class="container-fluid">
			 <div class="span12 has-transparency">
			 	<ul class="breadcrumbs">
				  <li class="is-home"></li>
				  <li><a href="#">Tickets and Excursions for {{fields.destination}} Area</a></li>
				</ul>

				<div class="separator"></div>

			</div>
		</div>

		<div class="container-fluid" style="background: #fff">
		 	<div class="span12 same-height">

		 		<div class="row-fluid">
		 			<div class="span3">
		 				<div class="sidebar">
							<div class="tickets-starting-at">
								<span>
									<strong>{{filteredTickets.length}}</strong>
									<ng-pluralize count="filteredTickets.length"
												when="{
													'one': 'Ticket starting at',
													'other': 'Tickets starting at'

												}">
									</ng-pluralize>
								</span>
								<br />
								<!-- <span class="price">${{minPriceTicket.MinAverPrice}}</span><br /> -->
								<span>Narrow results or view all</span>
							</div>

							<div class="search-box-sidebar">
								<h3>Tickets near</h3>

								<form action="<?php tlogic_the_ticket_search_action() ?>" method="GET">
									<input type="hidden" name="<?php echo TLOGIC_TICKET_SEARCH_KEY ?>" value="1">
									<div class="content-box">
										<?php if ( tlogic_frontend_has_errors() ): ?>
										<div class="alert alert-error">
											<?php _e( 'An error occured. Please make the necessary corrections and try again.', 'travel-logic' ); ?>
										</div>
										<?php endif; ?>

											<label>Where do you want to go?
											<input name="destination" type="text" placeholder="Destination" class="span12" autocomplete="off" value="<?php tlogic_the_ticket_search_field_value( 'destination' ) ?>">
											</label>
											<?php tlogic_the_ticket_search_field_error( 'destination' ); ?>

											<div class="form-inline">
												<div class="control-group span6 <?php tlogic_the_ticket_search_ctrlgrp_class( 'checkin' ) ?>">
													<label class="control-label">Check In:


														<div class="input-append">
															<input id="dpd1" name="checkin" type="text" class="span9" value="<?php tlogic_the_ticket_search_field_value( 'checkin' ); ?>">
															<span class="add-on"><i class="icon-calendar"> </i></span>
														</div>
													</label>
													<?php tlogic_the_ticket_search_field_error( 'checkin' ); ?>

												</div>
												<div class="control-group span6 <?php tlogic_the_ticket_search_ctrlgrp_class( 'checkout' ) ?>">
													<label class="control-label">Check Out:


														<div class="input-append">
															<input id="dpd2" name="checkout" type="text" class="span9" value="<?php tlogic_the_ticket_search_field_value( 'checkout' ); ?>">
															<span class="add-on"><i class="icon-calendar"> </i></span>
														</div>
													</label>
													<?php tlogic_the_ticket_search_field_error( 'checkout' ); ?>

												</div>
											</div>

											<div class="row-fluid" id="ticketRoomDetail_1">
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
															<?php tlogic_the_ticket_search_num_adult_options(); ?>
														</select>
														<?php tlogic_the_ticket_search_field_error( 'num_adult' ); ?> -->
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
															<?php tlogic_the_ticket_search_num_child_options(); ?>
														</select>
														<?php tlogic_the_ticket_search_field_error( 'num_child' ); ?> -->
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

											<div id="receiveTicketDeails">
												<?php
													// TODO create a template tags function
													if (isset($_GET['num_room']) && $_GET['num_room'] > 1) {

													for($x = 2; $x <= $_GET['num_room']; $x++) {
														echo '<div class="row-fluid" id="ticketRoomDetail_'. $x .'" style="padding: 10px 0; border-top: 1px solid #fa6044;">'.
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
								<strong>Activity Type</strong>

                                <div ng-repeat="(activity, count) in activityTypes">
                                    <div ng-if="activity && count" class="animate">
                                        <div class="clearfix"></div>
        								<ul class="inline filterByActivity" data-activity="{{activity}}">
                                            <li class="span2">
                                                <input id="activityType_{{$index}}" ng-model="filters.activityType" ng-true-value="'{{activity}}'" type="checkbox" />
                                            </li>
                                            <li class="span9">
                                                <label for="activityType_{{$index}}" ng-bind-html="activity"></label>
                                            </li>
                                            <li class="span1">({{count}})</li>
        								</ul>
                                    </div>
                                </div>

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
		 								<li class="span4"><a href ng-click="sortField='Name';sortReverse=!sortReverse" id="orderByTicketName" data-sort="<?php if ($_GET['orderByTicketName'] == "DESC") { echo "ASC"; } else { echo "DESC"; } ?>"><img src="<?php echo get_template_directory_uri(); ?>/images/ticket-name.jpg"></a></li>
		 								<!-- <li class="span4"><a href ng-click="sortField='MinAverPrice';sortReverse=!sortReverse" id="orderByTicketPrice" data-sort="<?php if ($_GET['orderByTicketPrice'] == "DESC") { echo "ASC"; } else { echo "DESC"; } ?>"><img src="<?php echo get_template_directory_uri(); ?>/images/price.jpg"></a></li> -->
		 								<!-- <li class="span3"><img src="<?php echo get_template_directory_uri(); ?>/images/most-popular.jpg" class="incomplete"></li> -->
		 								<li class="span4"><img src="<?php echo get_template_directory_uri(); ?>/images/display-mode.jpg" class="incomplete"></li>
		 							</ul>
		 						</div>
		 					</div>


			 				<hr class="separator-sidebar" />

			 				<div class="row-fluid animate"
			 						ng-if="tickets.length"
			 						dir-paginate="ticket in filteredTickets = (tickets | filter:filterTickets) | orderBy:sortField:sortReverse | itemsPerPage: ticketsPerPage"
			 						current-page="currentPage">

							    <div class="span12">
							        <div class="results">
							            <div class="inner">
							            	 <div class="row-fluid">
							            	 	<div class="span2">
							            	 		<a href="{{config.details_page}}{{ticket.TicketId}}"><img class="pull-left" ng-src="{{ticket.TicketInfo.ImageList[1].Url}}"></a>
							            	 	</div>
							            	 	<div class="span10">
							            	 		<div class="ticket-descriptions">
							 				             <p class="ticket-name">
							 					            <a ng-href="{{config.details_page}}{{ticket.TicketId}}"><strong>{{ticket.TicketInfo.Name}}</strong></a>
							 				             </p>
                                                        <strong>{{ticket.TicketInfo.Classification.Value}}</strong>
							 				             <p class="ticket-description">{{ticket.TicketInfo.DescriptionList[0].Value}}</p>
							 		                    <br />
							 			             </div>
							            	 	</div>
							            	 </div>
                                             <div class="row-fluid">
                                                <table class="span10 offset1 table table-striped table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Category</th>
                                                            <th>Price / Person</th>
                                                            <th>Date</th>
                                                            <th># Days</th>
                                                            <th>Total Price</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <tr ng-repeat="modality in ticket.AvailableModality">
                                                            <td>{{modality.Name}}</td>
                                                            <td>
                                                                <!-- <p ng-repeat="price in modality.PriceList">
                                                                    <strong ng-show="price.Amount > 0">{{price.Description}}: {{price.Amount}} {{ticket.Currency.Code}}</strong>
                                                                </p> -->

                                                                <p><strong>{{modality.PriceList[0].Description}}: {{modality.PriceList[0].Amount | currency : '' }} {{ticket.Currency.Code}}</strong></p>
                                                                <p><strong>{{modality.PriceList[1].Description}}: {{modality.PriceList[1].Amount | currency : '' }} {{ticket.Currency.Code}}</strong></p>
                                                                <p ng-show="modality.PriceList[2].Amount"><strong>{{modality.PriceList[2].Description}}: {{modality.PriceList[2].Amount | currency : '' }} {{ticket.Currency.Code}}</strong></p>
                                                            </td>
                                                            <td>
                                                                <select
                                                                    ng-init="modality._operationDateList_selected=modality.OperationDateList[0]"
                                                                    ng-model="modality._operationDateList_selected"
                                                                    ng-options="(operation.Date | operationDateFormat | date : 'MM/dd/yyyy') for operation in modality.OperationDateList"
                                                                >
                                                                </select>
                                                            </td>
                                                            <td>{{modality._operationDateList_selected.MaximumDuration}}
                                                                <ng-pluralize count="modality._operationDateList_selected.MaximumDuration"
                                                                    when="{
                                                                        'one':   'day',
                                                                        'other': 'days'
                                                                    }"
                                                                </ng-pluralize>
                                                            </td>
                                                            <td>
                                                                {{ modality.PriceList[3].Amount | currency : '' }} {{ticket.Currency.Code}}
                                                            </td> <!-- Need to create the function to calculate based on number of childs and date -->
                                                            <td>
                                                                <a role="button" class="btn btn-danger" ng-click="book(ticket, modality)">Book</a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                             </div>
							            </div>
							        </div>
									<div class="clearfix"></div>
							    </div>
							</div>

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
	    <h3 id="myModalLabel">Ticket Results</h3>
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
