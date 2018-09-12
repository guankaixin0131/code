/**
 * Plugin: Form Cache
 * Author: Luka Vidakovic
 * URL: lukavidakovic.com
 * E-mail: luka@uxpassion.com
 * 
 * Description
 * @param jquery Object form   jquery object from form element
 * Pass entity name to this plugin after selecting form and form
 * will be serialized and stored under that entity name in
 * local storage
 */
(function($){
    // @param Object options contains configuration parameters;
    // for now just "entity" that stands for key under which 
    // form elements will be stored
    var formCache = function(form, options) {
        this.entity = options.entity;

        if(window.localStorage) {

            // populate empty form fields from cache
            populateFormValues(form);
            clearFromLocalStorage();
            updateCachedValues();

            // on change udpate cache
            $('input, select, textarea', form).each(function() {
                $(this).bind('change',function() {
                    updateCachedValues();
                    $(this).keyup();
                    
                });
            });
        }

        function updateCachedValues(form) {
            var cached = {};
            $('input, select, textarea', form).each(function() {
                // Some elements' name are null,but we only save the element who has name.
                if(this.getAttribute('name')){
                    if('radio'==$(this).attr('type')){
                        cached[this.getAttribute('name')] = {'value':$('[name="'+this.getAttribute('name')+'"]:checked').val(),'type':this.getAttribute('type')};
                    } else{
                        cached[this.getAttribute('name')] ={'value':this.value,'type':this.getAttribute('type')};
                    }
                }
            });
            cached = JSON.stringify(cached);
            localStorage.setItem(options.entity, cached);
        }

        function populateFormValues(form) {
            if(localStorage.getItem(options.entity) !== null && localStorage.getItem(options.entity).length>0) {
                var data = JSON.parse(localStorage.getItem(options.entity));
                $('input, select, textarea', form).each(function() {
                    //confirm this element's value is empty and this element's value in cache,otherwise this element's value is string undefined.
                    if(!this.value && data[this.getAttribute('name')]) {
                        if('radio'==data[this.getAttribute('name')].type){
                            $('[name="'+data[this.getAttribute('name')]+'"][value="'+data[this.getAttribute('name')].value+'"]').attr('checked',true);
                        } else{
                            try{
                                this.value = data[this.getAttribute('name')].value;    
                            }
                            catch(error){
                                
                            }
                            
                        }
                    }
                });
            }
        }

        function clearFromLocalStorage() {
            if(localStorage.getItem(options.entity) !== null) {
                localStorage.removeItem(options.entity);
            }
        }

    };

    $.fn.formCache = function(options) {
        var opts = $.extend({}, options);
    
        return this.each(function(){
            new formCache($(this), opts);
        });

    };

}(jQuery));