<?php
/*
Template Name: Concierge Page
*/
?>

<?php get_header(); ?>
			<div class="container-fluid">
				<div class="row-fluid">
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
			</div>

			<div class="container-fluid">
				<div class="row-fluid">
				<div id="content" class="clearfix row-fluid">
				
					<div id="main" class="span12 clearfix" role="main">
						<header class="concierge-header">
							<h1 class="entry-title"><?php the_title(); ?></h1>
							<?php the_meta(); ?>
						</header>

						<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
						
						<article id="post-<?php the_ID(); ?>" <?php post_class('clearfix'); ?> role="article">
							
							<header>
								
								<!--<div class="page-header"><h1><?php the_title(); ?></h1></div>-->
							
							</header> <!-- end article header -->
						
							<section class="post_content concierge-page">
								<?php the_content(); ?>
						
							</section> <!-- end article section -->
						
						 </article> <!-- end article -->
						
						
						
						<?php endwhile; ?>	
						
						<?php else : ?>
						
						<article id="post-not-found">
						    <header>
						    	<h1><?php _e("Not Found", "bonestheme"); ?></h1>
						    </header>
						    <section class="post_content">
						    	<p><?php _e("Sorry, but the requested resource was not found on this site.", "bonestheme"); ?></p>
						    </section>
						    <footer>
						    </footer>
						</article>
						
						<?php endif; ?>
				
					</div> <!-- end #main -->
				    
					<?php //get_sidebar(); // sidebar 1 ?>
				    
				</div> <!-- end #content -->
			</div>
		</div>

<?php get_footer(); ?>