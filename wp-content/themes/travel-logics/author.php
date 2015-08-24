<?php get_header(); ?>
			
			<div class="container-fluid posts-page">
				<div id="content" class="clearfix row-fluid">
				
					<div id="main" class="span8 clearfix" role="main">
					
						<div class="page-header"><h1 class="archive_title h2">
							<span><?php _e("Posts By:", "bonestheme"); ?></span> 
							<?php 
								// If google profile field is filled out on author profile, link the author's page to their google+ profile page
								$curauth = (get_query_var('author_name')) ? get_user_by('slug', get_query_var('author_name')) : get_userdata(get_query_var('author'));
								$google_profile = get_the_author_meta( 'google_profile', $curauth->ID );
								if ( $google_profile ) {
									echo '<a href="' . esc_url( $google_profile ) . '" rel="me">' . $curauth->display_name . '</a>'; 
							?>
							<?php 
								} else {
									echo get_the_author_meta('display_name', $curauth->ID);
								}
							?>
						</h1></div>
						
						<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
						
						<article id="post-<?php the_ID(); ?>" <?php post_class('clearfix'); ?> role="article">
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

							
							<section class="entry-content clearfix" itemprop="articleBody">
								<?php the_post_thumbnail('full'); ?>
								<div class="content"><?php the_excerpt();?> <p></p></div>
								
								<div class="post-info">
									<p class="tags"><?php the_tags('<span class="tags-title">' . __('Tags:', 'jointstheme') . '</span> ', ', ', ''); ?></p>
							    	<p class="categories">Categories: <?php the_category(', '); ?></p>
						    	</div>

							</section> <!-- end article section -->
						
						</article> <!-- end article -->
						
						<?php endwhile; ?>	
						
						<?php if (function_exists('page_navi')) { // if expirimental feature is active ?>
							
							<?php page_navi(); // use the page navi function ?>

						<?php } else { // if it is disabled, display regular wp prev & next links ?>
							<nav class="wp-prev-next">
								<ul class="clearfix">
									<li class="prev-link"><?php next_posts_link(_e('&laquo; Older Entries', "bonestheme")) ?></li>
									<li class="next-link"><?php previous_posts_link(_e('Newer Entries &raquo;', "bonestheme")) ?></li>
								</ul>
							</nav>
						<?php } ?>
									
						
						<?php else : ?>
						
						<article id="post-not-found">
						    <header>
						    	<h1><?php _e("No Posts Yet", "bonestheme"); ?></h1>
						    </header>
						    <section class="post_content">
						    	<p><?php _e("Sorry, What you were looking for is not here.", "bonestheme"); ?></p>
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