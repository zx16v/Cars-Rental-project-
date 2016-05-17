
    $(document).ready(function () {
        //Dropdownlist Selectedchange event
        $("#CarsMakers").change(function () {
            $("#Car Model").empty();
            $.ajax({
                type: 'POST',
                url: '@Url.Action("GetCarModelsByMaker")', // we are calling json method

                dataType: 'json',

                data: { id: $("#CarsMakers").val() },
                // here we are get value of selected country and passing same value
                //  as inputto json method GetStates

                success: function (CarModels) {
                    // states contains the JSON formatted list
                    // of states passed from the controller

                    $.each(CarModels, function (i, CarModel) {
                        $("#Car Model").append('<option value="' + CarModel.val + '">' +
                           CarModel.Text + '</option>');
                        // here we are adding option for States

                    });
                },
                error: function (ex) {
                    alert('Failed to retrieve CarModels.' + ex);
                }
            });
            return false;
        })
    });
