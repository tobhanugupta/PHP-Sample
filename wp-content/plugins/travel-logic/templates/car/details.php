<?php
/**
 * Travel Logic - car details template
 */
?>

<?php if ( tlogic_has_cars() ): ?>
	<?php while ( tlogic_cars() ): tlogic_the_car(); ?>

<section class="big-city-large">
	<div class="container-fluid">
		 <div class="span12 has-transparency">
		 	<ul class="breadcrumbs">
			  <li class="is-home"></li>
			  <li><a href="#">Cars</a></li>
			  <li><a href="#">Shopping Cart</a></li>
			  <li class="pull-right last"><a href="#"><img src="<?php echo get_template_directory_uri(); ?>/images/back.png"></a></li>
			</ul>

			<div class="separator"></div>
		</div>
	</div>

    <div class="container-fluid">
        <div class="span8">
            <h1>Services</h1>
            <div class="separator"></div>

            <h4>Cars and Excursions</h4>
            <p><strong><?php tlogic_the_car_name(); ?></strong></p>
            <p>From: <?php tlogic_the_car_date_from(); ?></p>
            <p>To: <?php tlogic_the_car_date_to(); ?></p>

            <div class="span10"><?php tlogic_the_car_modality_name(); ?></div>
            <div class="span1">$<?php tlogic_the_car_total(); ?></div>

            <p><strong>Contract Remarks</strong></p>

            <div>
            <?php foreach ( tlogic_get_car_all_comments() as $comment ): ?>
                <p><?php echo nl2br( $comment->Value ); ?></p>
            <?php endforeach; ?>
            </div>

            <div class="separator"></div>

            <div class="span3 offset8">
                <a href="<?php tlogic_the_car_book_permalink(); ?>" class="btn btn-primary btn-large btn-block">Continue</a>
            </div>


        </div>

        <div class="span4">
            <h4>Ticket Details</h4>
            <p><strong><?php tlogic_the_car_name(); ?></strong></p>
            <p>From: <?php tlogic_the_car_date_from(); ?></p>
            <p>To: <?php tlogic_the_car_date_to(); ?></p>
            <p><?php tlogic_the_car_modality_name(); ?></p>

            <h4 class="span10">Ticket Total</h4>
            <h4 class="span1">$<?php tlogic_the_car_total(); ?></h4>
        </div>
    </div>

</section>

	<?php endwhile; ?>
<?php endif; ?>