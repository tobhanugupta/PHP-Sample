<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wp_kaluahb2c');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'pU mqI2{7](uF,%>|c.wIE%=ULH>(1COL-y-mX$<.xv[vUqzv--NaRoShL%u=o|M');
define('SECURE_AUTH_KEY',  'x+#&4,J[XQm84&J&yAi!Dj|7%{d6h{B_wFc`+oiUG/6w+B8p1SH-+!+$%AeVkKhu');
define('LOGGED_IN_KEY',    'O[OC-4|}-79_}^@v,4GK?|]u/^6Vq4)C;L|E5fft/+K,7_UvIFz{_ndidT}ZsN~+');
define('NONCE_KEY',        'cYu1mp|,-<>kqs(X&@b3`|d (_U7JiESRaX}S<,WfQe0(Yw.|cSt4I+O@Sw]8$n1');
define('AUTH_SALT',        'K&T8wi)DD@YIul+k7&fIbp.>=co*)gtxB{W)*p|Dv>a&|}Gny|i5$NZ+~{mN5%H:');
define('SECURE_AUTH_SALT', 'P(f%-V!$u!.!&e;wOBT9i OGhCom;ziDjC$fyuhv6.s&uCQ+Tl?Gx5vMpITYhME+');
define('LOGGED_IN_SALT',   'rv#(L.s>>UE^,6Na57jDetjfS<od)AIA^eG=BN+,uh-cQ O6zWoj!l({&wR)ea<+');
define('NONCE_SALT',       '9YN3#8(&Kn|vX6qDb;Dw-5w{@$_7tzLM6+Cv7I/`9hxy{4?+x!XUmo]]n|=4SL6N');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
