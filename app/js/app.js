requirejs.config({
    paths: {
        "jquery": '../assets/jquery/dist/jquery.min',
        "foundation": '../assets/foundation-sites/dist/foundation.min',
        "what-input": '../assets/what-input/what-input.min',
        "motion-ui": '../assets/motion-ui/dist/motion-ui.min'
    },
    shim: {
        "foundation": ['jquery']
    }
});

// Add any foundation modules you require to the end of this line.
require(['jquery', 'foundation', 'what-input'], function($) {
    // Foundation JavaScript
    // Documentation can be found at: http://foundation.zurb.com/docs
    $(document).load(function() {
        $(this).foundation();
        alert('haba');
    });
});