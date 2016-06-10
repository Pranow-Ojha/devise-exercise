$(document).ready(function(){

    $(document).bind('ajaxError', 'form#new_interview_feedback', function(event, jqxhr, settings, exception){

        // note: jqxhr.responseJSON undefined, parsing responseText instead
        $(event.data).render_form_errors( $.parseJSON(jqxhr.responseText) );

    });
});

(function($) {

    $.fn.modal_success = function(){
        // close modal
        this.modal('hide');

        // clear form input elements
        // todo/note: handle    textarea, select, etc
        this.find('form input[type="text"]').val('');
        this.find('form textarea').val('');

        // clear error state
        this.clear_previous_errors();
    };

    $.fn.render_form_errors = function(errors){

        $form = this;
        this.clear_previous_errors();
        model = this.data('model');

        // show error messages in input form-group help-block
        $.each(errors, function(field, messages){
            $input = $('input[name="' + model + '[' + field + ']"]');
            $input_area = $('textarea[name="' + model + '[' + field + ']"]');
            $input.closest('.form-group').addClass('field_with_errors').find('#error_explanation').html( messages.join(' & ') );
            $input_area.closest('.form-group').addClass('field_with_errors').find('#error_explanation').html( messages.join(' & ') );
        });
    };

    $.fn.clear_previous_errors = function(){
        //alert($(this).val());
        //$('#error_explanation').html('');
        $('.form-group.field_with_errors', this).each(function(){
            $('#error_explanation', $(this)).html('');
            $(this).removeClass('field_with_errors');
        });
    }
}(jQuery));