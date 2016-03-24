(function() {
  'use strict';

  angular
    .module('app')
    .factory('CategoryService', CategoryService);

  CategoryService.$inject = ["$http"];
  function CategoryService($http) {
    var service = {};

    service.GetAll = GetAll;
    service.GetByLink = GetByLink;
    return service;

    function GetAll() {
      return $http.get('api/categories').then(handleSuccess, handleError('Error getting all posts'));
    };

    function GetByLink(link) {
      return $http.get('api/categories/' + link).then(handleSuccess, handleError('Error getting all posts'));
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
