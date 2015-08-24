<?php
# Database Configuration
define( 'DB_NAME', 'wp_kaluahb2c' );
define( 'DB_USER', 'root' );
define( 'DB_PASSWORD', '' );
define( 'DB_HOST', 'localhost' );
define( 'DB_HOST_SLAVE', 'localhost' );
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', 'utf8_unicode_ci');
$table_prefix = 'wp_';

# Security Salts, Keys, Etc
define('AUTH_KEY',         'DXBXbxftpK8yJWMG;Y-@MoADO@[Llrm~wxnB>xzb_b1O~b_t&5?zuNHvb1i+L;<Y');
define('SECURE_AUTH_KEY',  '`9Qe(,,Ripk~v4zGHh|v^uI).c:,{fDg<{@G8m<3M4_^p.5-c(d7ar?x0Qethe1;');
define('LOGGED_IN_KEY',    '_gr?q^fVLGv~iA|^{.#!Y+W85nG0F8cYC&W{)Iu{`/q*+XAcfcK%};S@]iOAIs@M');
define('NONCE_KEY',        'hcVH!Ks.?Kp{_*6&7FoAr5.<-Kn~Oy%td-]8./=#Ui,F9DBDa08r$wo$*aN>=bty');
define('AUTH_SALT',        'r8[067|xv|+|r}+PGtMmhv;*6Se_9jFyHJ aV$53AUZOn/_0C74/Akw-#]X09tJK');
define('SECURE_AUTH_SALT', 'ell//)>X_5*=pjQQwDn{H1q!AA-zi?`uNJ&kqOZT8@#-O`hq=#FK:@KhO0.V1y[M');
define('LOGGED_IN_SALT',   '$;Dx_w-+_[eMwHEsWWFgaa:LjrD_[*dVhN[;8=Y?a:kBJ+!ubYZjXJ%2rnBr~R.u');
define('NONCE_SALT',       'xL2wmGH a*!,H$0!p|+%n^T8|}=-K?5<{uNar315qx0gSN^|+sekpxA6E9+%uNgn');


# Localized Language Stuff

define( 'WP_CACHE', TRUE );

define( 'WP_AUTO_UPDATE_CORE', false );

define( 'PWP_NAME', 'kaluahb2c' );

define( 'FS_METHOD', 'direct' );

define( 'FS_CHMOD_DIR', 0775 );

define( 'FS_CHMOD_FILE', 0664 );

define( 'PWP_ROOT_DIR', '/nas/wp' );

define( 'WPE_APIKEY', '6b533526bc086250c3eb747276f8f5e05b273807' );

define( 'WPE_FOOTER_HTML', "" );

define( 'WPE_CLUSTER_ID', '1879' );

define( 'WPE_CLUSTER_TYPE', 'pod' );

define( 'WPE_ISP', true );

define( 'WPE_BPOD', false );

define( 'WPE_RO_FILESYSTEM', false );

define( 'WPE_LARGEFS_BUCKET', 'largefs.wpengine' );

define( 'WPE_SFTP_PORT', 22 );

define( 'WPE_LBMASTER_IP', '198.58.98.160' );

define( 'WPE_CDN_DISABLE_ALLOWED', true );

define( 'DISALLOW_FILE_EDIT', FALSE );

define( 'DISALLOW_FILE_MODS', FALSE );

define( 'DISABLE_WP_CRON', false );

define( 'WPE_FORCE_SSL_LOGIN', false );

define( 'FORCE_SSL_LOGIN', false );

/*SSLSTART*/ if ( isset($_SERVER['HTTP_X_WPE_SSL']) && $_SERVER['HTTP_X_WPE_SSL'] ) $_SERVER['HTTPS'] = 'on'; /*SSLEND*/

define( 'WPE_EXTERNAL_URL', false );

define( 'WP_POST_REVISIONS', FALSE );

define( 'WPE_WHITELABEL', 'wpengine' );

define( 'WP_TURN_OFF_ADMIN_BAR', false );

define( 'WPE_BETA_TESTER', false );

umask(0002);

$wpe_cdn_uris=array ( );

$wpe_no_cdn_uris=array ( );

$wpe_content_regexs=array ( );

$wpe_all_domains=array ( 0 => 'kaluahb2c.wpengine.com', );

$wpe_varnish_servers=array ( 0 => 'pod-1879', );

$wpe_special_ips=array ( 0 => '198.58.98.160', );

$wpe_ec_servers=array ( );

$wpe_largefs=array ( );

$wpe_netdna_domains=array ( );

$wpe_netdna_domains_secure=array ( );

$wpe_netdna_push_domains=array ( );

$wpe_domain_mappings=array ( );

$memcached_servers=array ( 'default' =>  array ( 0 => 'unix:///tmp/memcached.sock', ), );
define('WPLANG','');

# WP Engine ID


# WP Engine Settings






# That's It. Pencils down
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');

$_wpe_preamble_path = null; if(false){}
