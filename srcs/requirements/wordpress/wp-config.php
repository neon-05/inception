<?php

define('DB_NAME', 'db');
define('DB_USER', 'mysql');
define('DB_HOST', 'mariadb');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('WP_DEBUG', true);

if (!defined('ABSPATH')){
	define('ABSPATH', __DIR__ . '/');
}

$table_prefix = 'wp_';

require_once ABSPATH . 'wp-settings.php';

?>
