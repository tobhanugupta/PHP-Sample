'use strict';

/* Controllers */
var travelLogicApp = angular.module('travelLogicApp', ['ngAnimate', 'ngSanitize',
    'angularUtils.directives.dirPagination']);

// Search Controller
travelLogicApp.controller('SearchController', ['$scope', '$sanitize',
    function($scope, $sanitize) {

    });
}]);

/* Filters */
travelLogicApp.filter('range', function() {
    return function(input, total) {
        total = Math.floor(parseInt(total));

        for (var i = 1; i <= total; i++)
            input.push(i);

        return input;
    };
});
