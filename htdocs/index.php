<?php
require_once 'smarty3/Smarty.class.php';

$smarty = new Smarty;
$smarty->compile_check = true;
$smarty->display('accounting.tpl');
?>
