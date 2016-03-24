(function() {
  'use strict';

  angular
    .module('app')
    .factory('CartService', CartService);

  CartService.$inject = ["$http"];
  function CartService($http) {
    var service = {};

    service.GetAll = GetAll;
    service.GetByLink = GetByLink;
    service.UpdateNum = UpdateNum;
    service.Create = Create;
    return service;

    function GetAll(page) {
      return $http.get('api/carts?page=' +page).then(handleSuccess, handleError('Error getting all posts'));
    };

    function GetByLink(link) {
      return $http.get('api/categories/' + link).then(handleSuccess, handleError('Error getting all posts'));
    };

    function UpdateNum(cart) {
      return $http.patch('api/carts/' + cart.id, cart).then(handleSuccess, handleError('Error getting all posts'));
    }
    function handleSuccess(res) {
      return res.data;
    }

    function Create(cart){
      return $http.post('api/carts' , cart).then(handleSuccess, handleError('Error getting all posts'));
    }
    function handleError(error) {
      return function () {
          return { success: false, message: error };
      };
    }
  }
})();
