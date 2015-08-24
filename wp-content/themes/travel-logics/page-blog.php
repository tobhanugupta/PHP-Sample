<?php
/*
Template Name: Blog
*/
?>

<?php get_header(); ?>
			
			<div id="content-fluid" class="clearfix row-fluid">
			
				<?php if (is_page()) {
				  $cat=get_cat_ID($post->post_title); //use page title to get a category ID
				  $posts = get_posts ("cat=$cat&showposts=5");
				  if ($posts) {
				    foreach ($posts as $post):
				      setup_postdata($post); ?>
				      <a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
				    <?php endforeach;
				  }
				} ?>
				    
			</div> <!-- end #content -->

<?php get_footer(); ?>