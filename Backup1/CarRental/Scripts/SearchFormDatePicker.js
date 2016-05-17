    

            $(document).ready(function()
            {
           
                $('#BeginDate').datepicker({ dateFormat: 'dd-mm-yy' }).datepicker("setDate", new Date());
                $('#EndDate').datepicker({ dateFormat: 'dd-mm-yy' }).datepicker("setDate", new Date());
            }
            )
$.datepicker.setDefaults({
            
    dateFormat: 'yy-mm-dd',
    minDate: 0,
    maxDate: 60
});
$('#BeginDate').datepicker({
    onSelect: function (selectedDate) {
        $('#EndDate').datepicker('option', 'minDate', selectedDate );
    }
});
$('#EndDate').datepicker({
    onSelect: function (selectedDate) {
        $('#BeginDate').datepicker('option', 'maxDate', selectedDate );
    }
});
        
//                  $(document).ready(function()
//            {

//                $('#BeginDate').datepicker({ dateFormat: 'dd-mm-yy' }).datepicker("setDate", new Date());
//                $('#EndDate').datepicker({ dateFormat: 'dd-mm-yy' }).datepicker("setDate", new Date());
//            }
//            )
//$.datepicker.setDefaults({

//    dateFormat: 'yy-mm-dd',
//    minDate: 0,
//    maxDate: 60
//});
//$('#BeginDate').datepicker({
//    onSelect: function (selectedDate) {
//        $('#EndDate').datepicker('option', 'minDate', selectedDate );
//    }
//});
//$('#EndDate').datepicker({
//    onSelect: function (selectedDate) {
//        $('#BeginDate').datepicker('option', 'maxDate', selectedDate );
//    }
//});



















