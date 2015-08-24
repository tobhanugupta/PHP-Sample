<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link http://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
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
define('AUTH_KEY',         'm}FjW:zmR<PW:eyJ^QL<72P`oi)(3)Gh$31El,=F|N &=|)CGR=W:<{iHmk4^yTz');
define('SECURE_AUTH_KEY',  'X4jEh&L:(kyuZnU0(*t{+B9@jT1$mUJ>l/KNuTk@+e/15Qb=-_AJWF9 s>AL$JQ|');
define('LOGGED_IN_KEY',    'o9Ym r||Q$b3?@D1|-I.:_v__WJ.b4-).z-+4>vRr,+Mc}Kic iaUp<g{;!``@+M');
define('NONCE_KEY',        '~;$,$xtyFd(S(d%@Nr]{6lckqv_#u|;/V,IK9-<YCi9cyk(;V(l&N/]wL;`##n}0');
define('AUTH_SALT',        '3.)0s!v65a<0t!(y+qQB?RRv84OM&k|v&3Kb(WeT43`Ok:25jc V%#|&$O49JZqN');
define('SECURE_AUTH_SALT', 'k)|-|mbo3vDuR&{g3{g8Iu|q%w~It&fNpproSe0}HR|^1~L5K}]+5uqR$l5FLe6t');
define('LOGGED_IN_SALT',   'Ck<+4%knh(~=OaDBe*b_nQF0;@ [#m[ O7hU!R5|hc4X4783f(,)7[7?W+fD?l`4');
define('NONCE_SALT',       'yVbKV$&~f7~JCkXMYGmekD|o!d&`)n*Lk,4J eme0MK+ !>38rBJ}~a^a*1N|A?W');

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

