(function() {
  'use strict';

  angular
    .module('app')
    .factory('ProvincialService', ProvincialService);

  ProvincialService.$inject = ["$http"];
  function ProvincialService($http) {
    var service = {};

    service.GetAll = GetAll;
    return service;

    function GetAll(page) {
      return $http.get('api/provincials').then(handleSuccess, handleError('Error getting all posts'));
    };

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
