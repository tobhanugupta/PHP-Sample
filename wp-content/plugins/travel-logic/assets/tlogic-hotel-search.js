'use strict';

/* Controllers */
var travelLogicApp = angular.module('travelLogicApp', ['ngAnimate', 'angularUtils.directives.dirPagination']);

// Search Controller
travelLogicApp.controller('SearchController', ['$scope', function($scope) {

    // init
    $scope.hotelsPerPage = 10;
    $scope.config        = tlogic_result.config;
    $scope.hotels        = tlogic_result.result;
    $scope.currentPage   = tlogic_result.pagination.current;
    $scope.filters       = {
        rating:         undefined,
        priceRangeFrom: undefined,
        priceRangeTo:   undefined
    };

    // this filter is used in the ng-repeat (dir-paginate)
    $scope.filterHotels = function (item){
        // shortcode to the filters object
        var f = $scope.filters;

        // there is a filter but the rating is not equal to this item
        if (f.rating && f.rating != Math.floor(parseInt(item.StarsLevel))) {
            return false;
        }

        // there is a filter by price and this item is not inside the range
        if (f.priceRangeFrom || f.priceRangeTo) {
            if (item.MinAverPrice < f.priceRangeFrom || item.MinAverPrice > f.priceRangeTo) {
                return false;
            }
        }

        // the criteria was met, show this item
        return true;
    };

    // everytime a filter is performed, we need to update the min and max prices
    $scope.$watchCollection('filteredHotels', function(filteredHotels) {
        // the hotel with min price
        $scope.minPrice = _.min(filteredHotels, function (hotel) {
            return hotel.MinAverPrice;
        }).MinAverPrice;

        // the hotel with max price
        $scope.maxPrice = _.max(filteredHotels, function (hotel) {
            return hotel.MinAverPrice;
        }).MinAverPrice;

        // the count of start
        $scope.starsCount = _.countBy(filteredHotels, function(hotel){
            return Math.floor(parseInt(hotel.StarsLevel));
        });
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