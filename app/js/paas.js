/**
 * Created by Aliaksei Syrel on 02/09/16.
 */
define(['jquery', 'underscore', 'autosize'], function($, _, autosize){

    function PaaS() {
        var _this = this;
        var pillar = $('#pillar');
        var preview = $('#preview');

        _this.initalize = function () {
            _this.attachPillarListener();
            _this.load();
            autosize(pillar);
        };

        _this.onPillarChanged = function() {
            var text = pillar.val();
            $.post(/*'http://127.0.0.1:6561/'*/'http://paas.syrel.ch/render/html', { pillar: text },
                function( data ) {
                    preview.html( data );
                });
        };

        _this.attachPillarListener = function () {
            var oldValue = pillar.val();
            var preview = _.debounce(function(){
                var newValue = pillar.val();
                if (newValue != oldValue) {
                    oldValue = newValue;
                    _this.onPillarChanged();
                    _this.save();
                }
            },300);
            pillar.on('input change keyup keydown paste', preview);
        };

        _this.save = function () {
            var file = pillar.val();
            // sets the file string to hold the data
            localStorage.setItem('pillar', JSON.stringify(file));
        };

        _this.load = function () {
            var autosave = localStorage.getItem('pillar');
            if (_.isUndefined(autosave)) return;
            // parses the string (btw. its UTF-8)
            var text = JSON.parse(autosave);
            //modifies the textarea with the id="inputTextArea"
            pillar.val(text);
            _this.onPillarChanged();
        };

        _this.initalize();
    }

    PaaS.init = function() {
        new PaaS();
    };

    return PaaS;
});