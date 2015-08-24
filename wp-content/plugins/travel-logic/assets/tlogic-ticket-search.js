'use strict';

/* Controllers */
var travelLogicApp = angular.module('travelLogicApp', ['ngAnimate', 'ngSanitize',
    'angularUtils.directives.dirPagination']);

// Search Controller
travelLogicApp.controller('SearchController', ['$scope', '$sanitize',
    function($scope, $sanitize) {

    // init
    $scope.ticketsPerPage = 10;
    $scope.config         = tlogic_result.config;
    $scope.fields         = tlogic_result.fields;
    $scope.tickets        = tlogic_result.result;
    $scope.currentPage    = tlogic_result.pagination.current;
  $scope.filters        = {
        activityType:   undefined,
        priceRangeFrom: undefined,
        priceRangeTo:   undefined
    };
	

    $scope.book = function(ticket, modality) {
        var base   = tlogic_result.config.details_page.base_url;
        var fields = angular.copy(tlogic_result.config.details_page.fields);
        var selected   = modality._operationDateList_selected;

        var initialDate = moment(selected.Date, 'YYYYMMDD');

        fields.DateFrom = initialDate.format('MM/DD/YYYY');
        fields.DateTO   = initialDate
                            .add(selected.MaximumDuration - 1, 'd')
                            .format('MM/DD/YYYY');

        fields.TicketCode     = ticket.TicketInfo.Code;
        fields.AvailToken     = ticket.AvailToken;
        fields.ModaliTyCode   = modality.Code;
        fields.ModaliTyName   = modality.Name;
        fields.ContractName   = modality.Contract.Name;
        fields.IncomingOffice = modality.Contract.IncomingOffice.Code;

        window.location = base + '?' + $.param(fields);
    };

    // this filter is used in the ng-repeat (dir-paginate)
    $scope.filterTickets = function (item){
        // shortcode to the filters object
        var f = $scope.filters;

        // there is a filter but the rating is not equal to this item
        if (f.activityType && f.activityType != $sanitize(item.TicketInfo.Classification.Value)) {
            return false;
        }

        // there is a filter by price and this item is not inside the range
        if (f.priceRangeFrom || f.priceRangeTo) {

            var modality = item.AvailableModality;

            var thisMin = _.min(modality, function(price) {
                return price.PriceList[3].Amount;
            }).PriceList[3].Amount;

            var thisMax = _.max(modality, function(price) {
                return price.PriceList[3].Amount;
            }).PriceList[3].Amount;

            if (thisMin < f.priceRangeFrom || thisMax > f.priceRangeTo) {
                return false;
            }
        }

        // the criteria was met, show this item
        return true;
    };

    // everytime a filter is performed, we need to update the min and max prices
    $scope.$watchCollection('filteredTickets', function(filteredTickets) {

        var min = 1000000;
        var max = 0;

        _.each(filteredTickets, function (ticket) {
            var modality = ticket.AvailableModality;

            var thisMin = _.min(modality, function(price) {
                return price.PriceList[3].Amount;
            }).PriceList[3].Amount;

            var thisMax = _.max(modality, function(price) {
                return price.PriceList[3].Amount;
            }).PriceList[3].Amount;

            if (thisMin < min) {
                min = thisMin;
            }

            if (thisMax > max) {
                max = thisMax;
            }
        });

        $scope.minPrice = min;
        $scope.maxPrice = max;

        $scope.activityTypes = _.countBy(filteredTickets, function(ticket){
            return $sanitize(ticket.TicketInfo.Classification.Value);
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

travelLogicApp.filter('operationDateFormat', function() {
    return function(input) {
        var y = input.substr(0,4),
            m = input.substr(4,2) - 1,
            d = input.substr(6,2);
        var D = new Date(y,m,d);

        return (D.getFullYear() == y && D.getMonth() == m && D.getDate() == d) ? D : '';
    }
});