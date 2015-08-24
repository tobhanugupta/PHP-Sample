			<!--<footer role="contentinfo">
			
				<div id="inner-footer" class="clearfix">
		          <hr />
		          <div id="widget-footer" class="clearfix row-fluid">
		            <?php if ( !function_exists('dynamic_sidebar') || !dynamic_sidebar('footer1') ) : ?>
		            <?php endif; ?>
		            <?php if ( !function_exists('dynamic_sidebar') || !dynamic_sidebar('footer2') ) : ?>
		            <?php endif; ?>
		            <?php if ( !function_exists('dynamic_sidebar') || !dynamic_sidebar('footer3') ) : ?>
		            <?php endif; ?>
		          </div>
					
					<nav class="clearfix">
						<?php bones_footer_links(); // Adjust using Menus in Wordpress Admin ?>
					</nav>
					
					
			
					<p class="attribution">&copy; <?php bloginfo('name'); ?></p>
				
				</div> <!-- end #inner-footer -->
				
			<!--</footer> <!-- end footer -->
			<footer>
				<div class="container-fluid">
				<div class="row-fluid">
					<div class="span3">
						<h3>Let's socialize</h3>
						<ul class="inline-list social-medias">
						  <li><a href="#"><i class="icon-facebook"></i></a></li>
						  <li><a href="#"><i class="icon-twitter"></i></a></li>
						  <li><a href="#"><i class="icon-google"></i></a></li>
						  <li><a href="#"><i class="icon-youtube"></i></a></li>
						</ul>

						<img src="<?php echo get_template_directory_uri(); ?>/images/logo-footer.png">
						<br><br>
						<div class="all-rights">
							© 2014  |  <a href="#">Privacy Policy</a><br>
							All Rights Reserved
						</div>
					</div>
					<div class="span3">
						<h3>Travel Specialists</h3>
						<ul class="footer-list">
							<li><a href="#">Golf Vacations</a></li>
							<li><a href="#">Ski &amp; Snowboarding</a></li>
							<li><a href="#">Disney Parks Vacations</a></li>
							<li><a href="#">Disneyland Vacations</a></li>
							<li><a href="#">Disney World Vacations</a></li>
							<li><a href="#">Vacation As Advertised</a></li>
						</ul>
					</div>
					<div class="span3">
						<h3>Travel Specialists</h3>
						<ul class="footer-list">
							<li><a href="#">Weedings</a></li>
							<li><a href="#">Acessible Travel</a></li>
							<li><a href="#">Disney Parks</a></li>
							<li><a href="#">Cruises</a></li>
							<li><a href="#">Round the World</a></li>
							<li><a href="#">First Class Flights</a></li>
						</ul>
					</div>
					<div class="span3 newsletter">
						<h3>Newsletter</h3>

						<div class="row-fluid">
							<div class="span12">
								<div class="input-append">
									<input class="span10" id="appendedInputButton" type="text">
									<button class="btn" type="button"><img src="<?php echo get_template_directory_uri(); ?>/images/arrow-right-footer.png"></button>
								</div>
							</div>
						</div>


						  <h3>Customer Support</h3>
						  <span class="phone-footer">1-866-599-6674</span>
						  <strong>varanda.com</strong>
					</div>
				</div>
				</div>

			</footer>

			<section class="sub-footer">
				<div class="row-fluid">
					<div class="span12">
						<?php
			                wp_nav_menu( array( 'theme_location' => 'footer_links', 'container_class' => 'navigation-footer' ) );
			            ?>

			            <a href="#" class="scroll-to-top"><img src="<?php echo get_template_directory_uri(); ?>/images/go-to-top.png"></a>
					</div>
				</div>
			</section>
		
		</div> <!-- end #container -->
				
		<!--[if lt IE 7 ]>
  			<script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
  			<script>window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
		<![endif]-->
		
		<?php wp_footer(); // js scripts are inserted using this function ?>

	</body>

</html>