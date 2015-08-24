<?php
/*
 * Travel Logic - admin settings template
 */
?>
<div class="wrap">
	<div id="icon-options-general" class="icon32"></div>
	<h2><?php _e( 'Travel Logic', 'travel-logic' ); ?></h2>
	<?php tlogic_settings_screen('global')->settings(); ?>
</div>
