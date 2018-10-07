jQuery(function($) {
    //日期选择
    $('.date-picker').datepicker({
        autoclose: true,
        todayHighlight: true
    }).on('changeDate', function() {
        $('.form-horizontal').valid();
    });

    //日期选择图标
    $('.date-picker').next().on('click', function() {
        if (!$(this).closest('.input-group').find('input').attr('disabled')) {
            $(this).prev().focus();
        }
    });


    //验证
    $('.form-horizontal').validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        highlight: function(e) {
            $(e).closest('.miniGroup').addClass('has-error');
        },

        success: function(e) {
            $(e).closest('.miniGroup').removeClass('has-error');
            $(e).remove();
        },

        errorPlacement: function(error, element) {
            if (element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
                var controls = element.closest('div[class*="col-"]');
                if (controls.find(':checkbox,:radio').length > 1) controls.append(error);
                else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
            }
            else if (element.is('.select2')) {
                error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
            }
            else if (element.is('.chosen-select')) {
                error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
            }
            else error.insertAfter(element.parent());
        },
        //验证成功
        submitHandler: function(form) {


        },
        //验证不成功
        invalidHandler: function(form) {

        }
    });
});