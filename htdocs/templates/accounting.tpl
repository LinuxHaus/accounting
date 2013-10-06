<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>LiHAS Accounting</title>
    <script src="lib/jquery-handsontable/lib/jquery.min.js"></script>
    <script src="lib/jquery-handsontable/dist/jquery.handsontable.full.js"></script>
    <script>
var accountingtable = {$accountingtable};
{literal}
$(document).ready( function() {
  var accstatus = [ "open", "done", "ignore" ];
  var $container = $("#accountingedit");
  $container.handsontable({
    data: accountingtable,
    colHeaders: ["ID", "E-Time", "Customer", "Buzzword", "TickedID", "Start", "Dauer", "Text", "Supporter", "Accountinghint", "Status"],
    columns: [
      { data: "accounting_id", readOnly: true},
      { data: "timeentry", type: 'text'},
      { data: "project", type: 'text'},
      { data: "ticketid", type: 'text'},
      { data: "start", type: 'text'},
      { data: "duration", type: 'text'},
      { data: "text", type: 'text'},
      { data: "supporter", type: 'text'},
      { data: "accountinghint", type: 'text'},
      { data: "accountingstatus", type: 'autocomplete', source: accstatus},
    ],
    minSpareRows: 1,
    currentRowClassName: 'currentRow',
    currentColClassName: 'currentCol'
  });
});
{/literal}
</script>
    <link data-jsfiddle="common" rel="stylesheet" media="screen" href="lib/jquery-handsontable/dist/jquery.handsontable.full.css">
  </head>
  <body>
    <h1>LiHAS Accounting</h1>
    <form method="post"><select name='project' size=1>
     {section name=project loop=$projects}<option>{$projects[project]}</option>{/section}
    <input type="submit" name="filter" value="Filter"></form>
    <div class="handsontable" id="accountingedit"></div>
    <div class="lihas" id="debug">{$debug}</div>
    <div class="lihas" id="error">{$error}</div>
  </body>
</html>
