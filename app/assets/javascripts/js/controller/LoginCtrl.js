(function() {
  'use strict';

  angular.module('app')
  .controller('LoginCtrl', LoginCtrl);

  LoginCtrl.$inject = ["$uibModalInstance", "$scope", "$location","LoginService", "FlashService"];
  function LoginCtrl($uibModalInstance, $scope, $location, LoginService, FlashService) {
    // vm = this;
    // $scope.show_product = false;
    //   vm.this_product = item;
    //   $scope.this_product = item;
    //   $scope.current_user = current_user;

    // $scope.order = {};
    // if(!angular.equals({},$scope.this_product)) {
    //   $scope.show_product = true;
    // }

    // // if(!angular.equals({}, current_user)) {
    // //   $scope.order_name = current_user.name;
    // // }

    $scope.login = {email: "",
      pass: ""};

  $scope.ok = function () {
    console.log($scope.login.email, $scope.login.pass)
      LoginService.Login($scope.login.email, $scope.login.pass, function(response) {
        if(response.data){
          LoginService.SetCurrentUser(response.data.user);
          window.location.reload();
        }
        else
          FlashService.Error(response.message);
      })
    $uibModalInstance.close();
  };

  // $scope.ok = function (is_all) {
  //   if($location.$$path != "/gio-hang")
  //     is_all = false;
  //   $scope.order = {
  //     name:       $scope.order.nname,
  //     street:     $scope.order.street,
  //     town:       $scope.order.town.name,
  //     district:   $scope.order.district.name,
  //     phone:      $scope.order.phone,
  //     all:        is_all
  //   };
  //   console.log($scope.order);
  //   OrderService.Create($scope.order).then(function(data) {
  //     console.log(data);
  //   })
  //   $uibModalInstance.close();
  //   $window.location.href = '/gio-hang';
  // };

  $scope.cancel = function () {
    $uibModalInstance.dismiss('cancel');
  };
  }
})();
