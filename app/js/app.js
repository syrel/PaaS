requirejs.config({
    paths: {
        "jquery": '../assets/jquery/dist/jquery.min',
        "foundation": '../assets/foundation-sites/dist/foundation.min',
        "what-input": '../assets/what-input/what-input.min',
        "motion-ui": '../assets/motion-ui/dist/motion-ui.min',
        "underscore": '../assets/underscore/underscore-min',
        "autosize": '../assets/autosize/dist/autosize.min'
    },
    shim: {
        "foundation": ['jquery']
    }
});


// Add any foundation modules you require to the end of this line.
require(['paas', 'jquery', 'foundation', 'what-input'], function(PaaS, $) {
    $(this).foundation();
    PaaS.init();
});