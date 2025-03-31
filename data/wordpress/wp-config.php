<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'database_name' );

/** Database username */
define( 'DB_USER', 'database_user' );

/** Database password */
define( 'DB_PASSWORD', 'database_user_password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          '-v3-p+cO1h(lpA%CbcoKHbj|VIm1%[pw$ai pWV vw]Ho.-}4jc+:DQ{Cd ?%N?M' );
define( 'SECURE_AUTH_KEY',   ':>ZGoa:bt-!r&dVM2{Wejo)m|!w8*u(W0RjQ|L%SEXmU;1[m.r$n2F}v;i.Yr2gU' );
define( 'LOGGED_IN_KEY',     '1)!mpmSe@8c%[Z^1SW=Xx/z?07P#J4#bq~9fi3tWPwzR^Mqz,XpJ])B9q@>uY.~K' );
define( 'NONCE_KEY',         'Vzl5W0/LEz/9ZwY@23{,spF,]<AVQ(10k$BxJz$uYu2IjC9IJ|1ubOhFYOLEjkPE' );
define( 'AUTH_SALT',         'B(;kC7uUWo,CdW$wVN)Ujgspf:)o1=S%LC^+mj =~I2Gbq3[%pr25KrSdOq$}yQo' );
define( 'SECURE_AUTH_SALT',  'V/`<~n{PO>z}s#=cS.8y7g)JHcfI.>*jt}4RG`1M/vLv6|hd/.igLiU40+G~<IMY' );
define( 'LOGGED_IN_SALT',    'Tv=g5,W0qy@5~NbNa:HIU^x#=/lP[}VV[:,R^QcevFP:wGJy=Czk-.eTw1rwpv0.' );
define( 'NONCE_SALT',        'leC6O`dIVB*cT:ptj}1tRcR/8(B{@y^% @l!=&uQAgU5-_o#(6%RjJd,$T-rP<j=' );
define( 'WP_CACHE_KEY_SALT', 'A^!Z,Rsqr!+.8Eju(h/otItb]^0($1DJIjJy|rkE14S/8WBUt]V}^OVz[&m+2p~w' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
