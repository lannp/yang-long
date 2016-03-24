(function() {
  'use strict';

  angular
    .module('app')
    .factory('UserService', UserService);

  UserService.$inject = ["$http"];
  function UserService($http) {
    var service = {};

    service.GetByLink = GetByLink;
    service.Update = Update;
    return service;

    function GetByLink(link, page) {
      return $http.get('api/users/'+ link+ '?page=' +page).then(handleSuccess, handleError('Error getting all posts'));
    };

    function Update(user) {
      return $http.patch('api/users/'+ user.link, user).then(handleSuccess, handleError('Error getting all posts'));
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
