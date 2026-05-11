<?php

file_put_contents("php://stderr", getenv('db_name'));
file_put_contents("php://stderr", getenv('db_usr'));
file_put_contents("php://stderr", getenv('db_pwd'));

define('DB_NAME', getenv('db_name'));
define('DB_USER', getenv('db_usr'));
define('DB_PASSWORD', getenv('db_pwd'));
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
