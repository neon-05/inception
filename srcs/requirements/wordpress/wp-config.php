<?php
define('DB_NAME', getenv('DB_NAME'));
define('DB_USER', getenv('DB_USER'));
define('DB_PASSWORD', getenv('DB_PASS'));
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
