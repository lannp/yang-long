(function() {
  'use strict';

  angular
    .module('app')
    .factory('SlideService', SlideService);

  SlideService.$inject = ["$http"];
  function SlideService($http) {
    var service = {};

    service.GetAll = GetAll;
    return service;

    function GetAll(page) {
      return $http.get('api/slides').then(handleSuccess, handleError('Error getting all posts'));
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
