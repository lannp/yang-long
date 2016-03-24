(function() {
  'use strict';

  angular.module('app')
  .controller('ModalInstanceCtrl', ModalInstanceCtrl);

  ModalInstanceCtrl.$inject = ["$uibModalInstance", "item", "$scope", "current_user", "ProvincialService", "OrderService", "$location", "$window", "$rootScope"];
  function ModalInstanceCtrl($uibModalInstance, item, $scope, current_user, ProvincialService, OrderService, $location, $window, $rootScope) {
    vm = this;
    $scope.show_product = false;
      vm.this_product = item;
      $scope.this_product = item;
      $scope.current_user = $rootScope.globals.currentUser;;

    $scope.order = {
      name: $scope.current_user.name,
      street: $scope.current_user.street,
      provincial: $scope.current_user.provincial,
      district: $scope.current_user.district,
      phone: $scope.current_user.phone
    };
    console.log(current_user);
    if(!angular.equals({},$scope.this_product)) {
      $scope.show_product = true;
    }

    // if(!angular.equals({}, current_user)) {
    //   $scope.order_name = current_user.name;
    // }



    $scope.count = 1;

    GetTinh();

    function GetTinh() {
      ProvincialService.GetAll().then(function(data) {
        $scope.provincials = data.provincials;
        $scope.this_provincial = data.provincials[0];
        $scope.this_district = data.provincials[0].districts[0];
        console.log(data);
        angular.forEach(data.provincials, function(provincial) {
          if ($scope.order.provincial!= null &&$scope.order.provincial.name == provincial.name)
            $scope.order.provincial = provincial;
        });
      });
    };

  $scope.OrderProduct = function () {
    $scope.order = {
      ms:         $scope.this_product.ms,
      name:       $scope.order.nname,
      street:     $scope.order.street,
      provincial_id: $scope.order.provincial.id,
      district_id:   $scope.order.district.id,
      phone:      $scope.order.phone,
      product_id: $scope.this_product.id,
      number:     $scope.this_product.this_number,
      size:       $scope.this_product.this_size,
      all:        false
    };
    console.log($scope.order);
    OrderService.Create($scope.order).then(function(data) {
      console.log(data);
    })
    $uibModalInstance.close();
  };

  $scope.ok = function (is_all) {
    if($location.$$path != "/gio-hang")
      is_all = false;
    $scope.order = {
      name:       $scope.order.nname,
      street:     $scope.order.street,
      provincial_id:       $scope.order.provincial.id,
      district_id:   $scope.order.district.id,
      phone:      $scope.order.phone,
      all:        is_all
    };
    console.log($scope.order);
    OrderService.Create($scope.order).then(function(data) {
      console.log(data);
    })
    $uibModalInstance.close();
    $window.location.href = '/gio-hang';
  };

  $scope.cancel = function () {
    $uibModalInstance.dismiss('cancel');
  };
  }
})();
