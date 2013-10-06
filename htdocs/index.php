<?php
require_once 'smarty3/Smarty.class.php';
require_once 'config.php';

$smarty = new Smarty;
$smarty->compile_check = true;

date_default_timezone_set($config['timezone']);
$smarty->assign('error',"");
try {
  $dbh = new PDO($DBdsn,$DBuser,$DBpassword);
} catch (PDOException $e) { $smarty->assign('error', "Connection failed: " . $e->getMessage()); $smarty->display('accounting.tpl'); exit(); }

$sql = $ACCOUNTINGLISTSQL;
try {
  $sth = $dbh->prepare($sql);
} catch (PDOException $e) { $smarty->assign('error', "$sql failed: " . $e->getMessage()); $smarty->display('accounting.tpl'); exit(); }
try {
  $sth->execute();
} catch (PDOException $e) { $smarty->assign('error', "$sql failed: " . $e->getMessage()); $smarty->display('accounting.tpl'); exit(); }
$accountingarray = array();
while ($result = $sth->fetchObject()) {
  $accountingarray[] = $result;
}
$accountingjson = json_encode($accountingarray);
$smarty->assign('accountingtable', $accountingjson);

$sql = $PROJECTLISTSQL;
try {
  $sth = $dbh->prepare($sql);
} catch (PDOException $e) { $smarty->assign('error', "$sql failed: " . $e->getMessage()); $smarty->display('accounting.tpl'); exit(); }
try {
  $sth->execute();
} catch (PDOException $e) { $smarty->assign('error', "$sql failed: " . $e->getMessage()); $smarty->display('accounting.tpl'); exit(); }
$projectarray = array();
while ($result = $sth->fetch()) {
  $smarty->append('projects', $result['projects']);
}

$smarty->assign('debug', $sql);
$smarty->display('accounting.tpl');
?>
