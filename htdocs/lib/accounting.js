$(document).ready( function() {
  var accstatus = [ "open", "done", "ignore" ];
  var $container = $("#accountingedit");
  $container.handsontable({
    data: accountingtable,
    startRows: 5,
    startCols: 11,
    colHeaders: ["ID", "E-Time", "Customer", "Buzzword", "TickedID", "Start", "End", "Text", "Supporter", "Accountinghint", "Status"],
    columns: [
      { data: 0, type: 'numeric', readOnly: true},
      { data: 1, type: 'text'},
      { data: 2, type: 'text'},
      { data: 3, type: 'text'},
      { data: 4, type: 'text'},
      { data: 5, type: 'text'},
      { data: 6, type: 'text'},
      { data: 7, type: 'text'},
      { data: 8, type: 'text'},
      { data: 9, type: 'numeric', format: '0%'},
      { data: 10, type: 'autocomplete', source: accstatus},
    ],
    minSpareRows: 1,
    currentRowClassName: 'currentRow',
    currentColClassName: 'currentCol',
  });
})

