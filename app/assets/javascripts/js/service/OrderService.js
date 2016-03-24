(function() {
  'use strict';

  angular
    .module('app')
    .factory('OrderService', OrderService);

  OrderService.$inject = ["$http"];
  function OrderService($http) {
    var service = {};

    service.GetAll = GetAll;
    service.Create = Create;
    return service;

    function GetAll(page) {
      return $http.get('api/carts?page=' +page).then(handleSuccess, handleError('Error getting all posts'));
    };

    function GetByLink(link) {
      return $http.get('api/categories/' + link).then(handleSuccess, handleError('Error getting all posts'));
    };

    function Create(order) {
      return $http.post('api/orders', order).then(handleSuccess, handleError('Error getting all posts'));
    }
    function handleSuccess(res) {
      return res.data;
    }

    function handleError(error) {
      return function () {
          return { success: false, message: error };
      };
    }
  }
})();
