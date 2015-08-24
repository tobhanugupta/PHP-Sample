<?php get_header(); ?>
			
			<div class="container-fluid posts-page">
				<div id="content" class="clearfix row-fluid">
				
					<div id="main" class="span8 clearfix" role="main">
				
						<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
						
						<article id="post-<?php the_ID(); ?>" <?php post_class('clearfix'); ?> role="article" itemscope itemtype="http://schema.org/BlogPosting">
							
							<header class="article-header">
								<div class="post-date">
									<span class="month"><?php the_time('M') ?></span>
									<span class="day"><?php the_time('j') ?></span>
									<span class="year"><?php the_time('Y') ?></span>
								</div>	
								<h1><a href="<?php the_permalink() ?>" rel="bookmark" title="<?php the_title_attribute(); ?>"><?php the_title(); ?></a></h1>
								<div class="clearfix"></div>
							</header> <!-- end article header -->

							<section class="article-posted">
								<p>Posted by <?php the_author_posts_link(); ?> | <?php comments_popup_link('No Comments »', '1 Comment', '% Comments'); ?></p>
							</section>		

							<section class="post_content clearfix" itemprop="articleBody">
								<?php the_post_thumbnail('full'); ?>
								<div class="content">
									<?php the_content(); ?>
									
									<?php wp_link_pages(); ?>
								</div>


							</section> <!-- end article section -->
							
							<div class="post-info">
								<p class="tags"><?php the_tags('<span class="tags-title">' . __('Tags:', 'jointstheme') . '</span> ', ', ', ''); ?></p>
								<p class="categories">Categories: <?php the_category(', '); ?></p>
							</div>

							<footer>
				
								<?php the_tags('<p class="tags"><span class="tags-title">' . __("Tags","bonestheme") . ':</span> ', ' ', '</p>'); ?>
								
								<?php 
								// only show edit button if user has permission to edit posts
								if( $user_level > 0 ) { 
								?>
								<a href="<?php echo get_edit_post_link(); ?>" class="btn btn-success edit-post"><i class="icon-pencil icon-white"></i> <?php _e("Edit post","bonestheme"); ?></a>
								<?php } ?>
								
							</footer> <!-- end article footer -->
						
						</article> <!-- end article -->


						<section class="comments-area">
							<?php comments_template('',true); ?>
						</section>
						
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
				    
					<?php get_sidebar(); // sidebar 1 ?>
				    
				</div> <!-- end #content -->
			</div>

<?php get_footer(); ?>