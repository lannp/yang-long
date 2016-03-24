(function() {
  'user strict';
  angular
    .module("app")
    .factory('LoginService', LoginService);

  LoginService.$inject = ['$http','$rootScope', '$cookieStore'];

  function LoginService($http, $rootScope, $cookieStore) {
    var service = {};

    service.Login = Login;
    service.SetCurrentUser = SetCurrentUser;
    service.Logout = Logout;
    return service;

    function Login(email, password, callback) {
      $http.post('api/sessions', {email: email, password:password})
        .then(function(response){
          callback(response);
        }, function(response){
          response = { success: false, message: 'Username or password is incorrect' };
          callback(response);
        });
    };

    function SetCurrentUser(user) {
       $rootScope.globals = {
        currentUser: user
       };
       $cookieStore.put('yang', $rootScope.globals);
       $http.defaults.headers.common['Authorization'] = user.auth_token;

    };

    function Logout () {
      $rootScope.globals = {};
      $cookieStore.remove('yang');
      $http.defaults.headers.common.Authorization = 'Basic';
    }
  }
})();
