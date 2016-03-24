(function() {

  angular
    .module('app')
    .controller('UserCtrl', UserCtrl);

  UserCtrl.$inject = ["$routeParams", "UserService", "$stateParams", "$uibModal", "$rootScope", "$location"]
  function UserCtrl($routeParams, UserService, $stateParams, $uibModal, $rootScope, $location) {
    vm =this;
    vm.current_user = $rootScope.globals.currentUser;
    vm.total_cart = 0;
    vm.total_price = 0;
    vm.currentPage = 1;

    vm.PageChanged = PageChanged;

    GetUser();

    function GetUser() {
      var Page = vm.currentPage;
      if ($location.$$url.indexOf("page")>-1) {
          Page = $location.$$url.match(/[\?\&]page=(\d+)/)[1]
        };
      UserService.GetByLink(vm.current_user.link, Page).then(function(data) {
        vm.this_user = data.user;
        vm.carts = data.carts;
        vm.total_cart = data.total_cart;
        vm,currentPage = data.page;
      });
    }

    function PageChanged() {
      UserService.GetByLink(vm.current_user.link,vm.currentPage).then(function(data){
        vm.carts = data.carts;
        vm.currentPage = data.page;
        $location.url('?page='+ vm.currentPage);
      });
    }
  }
})();
