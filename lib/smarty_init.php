<?php
define("ROOT",dirname(__FILE__).'/../');
require_once('smarty/Smarty.class.php');
$smarty = new Smarty();
$smarty->setTemplateDir(ROOT.'tpls');
$smarty->compile_dir = 'saemc://smartycompile/';
$smarty->cache_dir = 'saemc://smartycache/';
$smarty->compile_locking = false;
$smarty->left_delimiter = "<{";
$smarty->right_delimiter = "}>";
