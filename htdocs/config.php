<?php

require_once "MDB2.php";

# Change this
# be aware: json_encode used later depends on correct utf8 encoding
$DBdsn = 'mysql:dbname=egroupware;host=mysqlaccounting;charset=utf8';
$DBuser = 'are';
$DBpassword = '';

date_default_timezone_set("Europe/Berlin");

# map fields, these values work for egroupware
$config = array (
  'timezone' => 'Europe/Berlin',
  'accountingsqlfieldmap' => array (
    'accounting_id' => 'ts_id',
    'timeentry' => ' FROM_UNIXTIME(egw_timesheet.ts_modified,\'%Y-%m-%d %h:%i\')',
    'project' => 'egw_timesheet.ts_project',
    'ticketid' => '\'ticketid\'',
    'start' => 'FROM_UNIXTIME(egw_timesheet.ts_modified,\'%Y-%m-%d %h:%i\')',
    'duration' => 'egw_timesheet.ts_duration',
    'text' => 'egw_timesheet.ts_title||egw_timesheet.ts_description',
    'supporter' => 'egw_accounts.account_lid',
    'accountinghint' => '\'acchint\'',
    'accountingstatus' => '\'open\'',
  ),
  'accountinglistfrom' => "egw_timesheet JOIN egw_accounts ON egw_timesheet.ts_owner=egw_accounts.account_id",
);

$PROJECTLISTSQL = "SELECT DISTINCT pm_title AS projects FROM egw_pm_projects";
$ACCOUNTINGLISTSQL = "SELECT ".
  $config['accountingsqlfieldmap']['accounting_id']." AS accounting_id, ".
  $config['accountingsqlfieldmap']['timeentry']." AS timeentry, ".
  $config['accountingsqlfieldmap']['project']." AS project, ".
  $config['accountingsqlfieldmap']['ticketid']." AS ticketid, ".
  $config['accountingsqlfieldmap']['start']." AS start, ".
  $config['accountingsqlfieldmap']['duration']." AS duration, ".
  $config['accountingsqlfieldmap']['accountinghint']." AS accountinghint, ".
  $config['accountingsqlfieldmap']['accountingstatus']." AS accountingstatus, ".
  $config['accountingsqlfieldmap']['supporter']." AS supporter, ".
  "0 FROM ".$config['accountinglistfrom']." LIMIT 10";
?>
