<?php
/**
 * Travel Logic - hotel details template
 */
?>

<?php if ( tlogic_has_hotels() ): ?>
	<?php while ( tlogic_hotels() ): tlogic_the_hotel(); ?>

<section class="big-city-large">
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

	<div class="container-fluid">
		<div class="row-fluid container-shadow">
			<div class="span8">
				<div id="slider" class="flexslider">
		          <ul class="slides">
					<?php 
						foreach( tlogic_get_the_hotel_images() as $Image ): 
							echo '<li><img src="'.$Image->Path.'" /></li>';
						endforeach; 
					?>
		          </ul>
		        </div>
		        <div id="carousel" class="flexslider">
		          <ul class="slides">
		            <?php 
						foreach( tlogic_get_the_hotel_images() as $Image ): 
							echo '<li><img src="'.$Image->Path.'" /></li>';
						endforeach; 
					?>
		          </ul>
		        </div>
				
			</div>
			<div class="span4">
				<h1 class="hotel-name"><?php tlogic_the_hotel_name(); ?></h1>
				<?php tlogic_the_hotel_stars_icons(); ?>

				<hr class="separator-sidebar" />

				<div class="content-details">
					<?php tlogic_the_hotel_short_description(); ?>

					<br /><br />
					<a href="#" id="ShowRooms" class="btn-search">Book Now</a>
				</div>
			</div>
		</div>


		<div class="row-fluid mt-20">
			<div class="span8 container-shadow">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#summary" data-toggle="tab"><i class="icon-summary"></i> Summary</a></li>
					<li><a href="#rooms" data-toggle="tab"><i class="icon-room"></i> Room rates</a></li>
					<li><a href="#maps" data-toggle="tab"><i class="icon-maps"></i> Maps</a></li>
					<li><a href="#review" data-toggle="tab"><i class="icon-reviews"></i> Reviews</a></li>
				</ul>

				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade active in" id="summary">
						<?php tlogic_the_hotel_description(); ?>
					</div>
					<div class="tab-pane fade" id="rooms">
						
					<img src="<?php echo get_template_directory_uri(); ?>/images/hotel-listing.jpg" class="incomplete">
						<?php tlogic_load_template( 'hotel/rooms.php', false ); ?>
					</div>
					<div class="tab-pane fade" id="maps">
						<iframe width="425" height="350" class="incomplete" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=portofino+bay+hotel&amp;sll=37.6,-95.665&amp;sspn=58.928785,114.169922&amp;ie=UTF8&amp;hq=portofino+bay+hotel&amp;hnear=&amp;t=m&amp;z=13&amp;iwloc=A&amp;cid=10832516566347033634&amp;ll=28.480464,-81.459998&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=portofino+bay+hotel&amp;sll=37.6,-95.665&amp;sspn=58.928785,114.169922&amp;ie=UTF8&amp;hq=portofino+bay+hotel&amp;hnear=&amp;t=m&amp;z=13&amp;iwloc=A&amp;cid=10832516566347033634&amp;ll=28.480464,-81.459998" style="color:#0000FF;text-align:left">View Larger Map</a></small>
					</div>
					<div class="tab-pane fade" id="review">
						<p class="incomplete">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim, libero, a! Officia, culpa commodi non eos minima vitae corporis officiis facilis incidunt eligendi. Corporis eos autem cumque minima, repellendus. Ex.</p>
					</div>
				</div>
			</div>
			<div class="span4">
				<div class="row-fluid">
					<div class="span12 container-shadow incomplete">
						<div class="testimonial">
							It was very comfortable to stay and staff were pleasant and welcoming. <br />
							<span class="author">by Ellison from United Kingdom</span>
						</div>
					</div>
				</div>

				<div class="row-fluid">
					<div class="span12 container-shadow mt-20">
						<div class="assistance">
							<h3>Need Assistance?</h3>
							Our team is 24/7 at your service to help you with your booking issues or answer any related questions<br /><br />
							<span class="phone">1-866-599-6674</span>
						</div>
					</div>
				</div>

				<div class="row-fluid">
					<div class="span12 container-shadow mt-20 incomplete">
						
						<div class="row-fluid you-may mt-10">
							<div class="span12 offset1">
								<h3 class="location">You May Also Like</h3>
							</div>

							<ul>
								<li>
									<img src="<?php echo get_template_directory_uri(); ?>/images/placeholder-pic.png" class="pull-left">
									<div class="pull-right you-may-list">
										<strong>Hotel Amaragua</strong><br />
										
										<span class="price">$35-$160</span> <span class="avg">avg/night</span>
										<div class="stars">
											<i class="icon-star-blue"></i>
											<i class="icon-star-blue"></i>
											<i class="icon-star-blue"></i>
											<i class="icon-star-blue"></i>
											<i class="icon-star-blue"></i>
										</div>

									</div>
									<div class="clearfix"></div>
								</li>
								<li>
									<img src="<?php echo get_template_directory_uri(); ?>/images/placeholder-pic.png" class="pull-left">
									<div class="pull-right you-may-list">
										<strong>Hotel Amaragua</strong><br />
										
										<span class="price">$35-$160</span> <span class="avg">avg/night</span>
										<div class="stars">
											<i class="icon-star-blue"></i>
											<i class="icon-star-blue"></i>
											<i class="icon-star-blue"></i>
											<i class="icon-star-blue"></i>
											<i class="icon-star-blue"></i>
										</div>

									</div>
									<div class="clearfix"></div>
								</li>
								<li>
									<img src="<?php echo get_template_directory_uri(); ?>/images/placeholder-pic.png" class="pull-left">
									<div class="pull-right you-may-list">
										<strong>Hotel Amaragua</strong><br />
										
										<span class="price">$35-$160</span> <span class="avg">avg/night</span>
										<div class="stars">
											<i class="icon-star-blue"></i>
											<i class="icon-star-blue"></i>
											<i class="icon-star-blue"></i>
											<i class="icon-star-blue"></i>
											<i class="icon-star-blue"></i>
										</div>

									</div>
									<div class="clearfix"></div>
								</li>
							</ul>
						</div>

						<div class="cleafix"></div>
						
						
					</div>
				</div>
				
			</div>
		</div>

	</div>

</section>

	<?php endwhile; ?>
<?php endif; ?>