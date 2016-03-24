(function() {
  'use strict';

  angular
    .module('app')
    .factory('CategoryNdService', CategoryNdService);

  CategoryNdService.$inject = ["$http"];
  function CategoryNdService($http) {
    var service = {};

    service.GetByLink = GetByLink;
    service.GetInCategory = GetInCategory
    return service;

    // function GetAll() {
    //   return $http.get('http://localhost:3000/api/categories').then(handleSuccess, handleError('Error getting all posts'));
    // };

    function GetByLink(link) {
      return $http.get('api/category_nds/' + link).then(handleSuccess, handleError('Error getting all posts'));
    };

    function GetInCategory(link) {
      return $http.get('api/category_nds/' + link +"/category_nds").then(handleSuccess, handleError('Error getting all posts'));
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
