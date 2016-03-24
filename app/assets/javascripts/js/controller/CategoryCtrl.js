(function() {

  angular
    .module('app')
    .controller('CategoryCtrl', CategoryCtrl);

  CategoryCtrl.$inject = ["$location","$routeParams", "ProductService", "CategoryService","$location",
    "$stateParams", "$window", "$state"]
  function CategoryCtrl($location, $routeParams, ProductService, CategoryService, $location, $stateParams, $window, $state) {
    vm =this;

    vm.result = {priceSelect: 1, cateSelect: 'all'};
    vm.this_cate_nd = {have: false};
    vm.toFilter = false;
    vm.currentPage = 1;
    vm.totalProducts = 0;

    vm.ApplyFilter = ApplyFilter;
    vm.SetCate = SetCate;
    vm.PageChanged = PageChanged;

    GetAllCate();
    GetByLink();
    GetAllProduct();


    function GetAllCate() {
      CategoryService.GetAll().then(function(data){

        if(data.categories)
          vm.all_cate = data.categories;
        else
          $state.go('_404', null, { location: false })
      });
    }

    function GetByLink() {
      if($stateParams.CategoryLink) {
        CategoryService.GetByLink($stateParams.CategoryLink).then(function(data) {
          vm.category = data;
          console.log(data);
        });
      }
    }

    function GetAllProduct() {
      // console.log($location);
      if($location.$$hash && $location.$$hash.indexOf("find")!=0){
        ProductService.GetInCate($location.$$hash, vm.currentPage).then(function(data) {
        vm.products = data.products;
        vm.totalProducts = data.total_record;
        vm.currentPage = data.page;
      });
      }
      else if ($location.$$hash && $location.$$hash.indexOf("find") == 0) {
        console.log($location);
        link = $location.$$hash.replace(/find/i, '');
        ProductService.FindByQuerry(link).then(function(data){
          vm.products = data.products;
          vm.totalProducts = data.total_record;
          vm.currentPage = data.page;
          vm.result.priceSelect = data.price;
        });
      }
      else{
        ProductService.GetAll(vm.currentPage).then(function(data) {
        vm.products = data.products;
        vm.totalProducts = data.total_record;
        vm.currentPage = data.page;
      });
      }
    }

    function SetCate(cate_nd) {
      ProductService.GetInCate(cate_nd.link, vm.currentPage).then(function(data) {
        vm.products = data.products;
        vm.totalProducts = data.total_record;
        vm.currentPage = data.page;
        vm.this_cate_nd = cate_nd;
        vm.this_cate_nd.have = true;
        vm.result.cateSelect = cate_nd.link;

        vm.currentPage = 1;
      });
    }

    function ApplyFilter() {
      ProductService.FindProduct(vm.result.cateSelect, vm.result.priceSelect, vm.currentPage).then(function(data) {
        vm.products = data.products;
        vm.totalProducts = data.total_record;
        vm.currentPage = data.page;
      });
       vm.currentPage = 1;
    }


    function PageChanged( cate_nd) {
       ProductService.GetInCate(cate_nd.link, vm.currentPage).then(function(data) {
        vm.products = data.products;
        vm.totalProducts = data.total_record;
        vm.currentPage = data.page;
        vm.this_cate_nd = cate_nd;
        vm.this_cate_nd.have = true;
        vm.result.cateSelect = cate_nd.link;
      });
    }

    function PageChanged() {
      console.log($window.location );
      // $window.location.href  = "sacsdcsd"
      // $location.$$hash[$location.$$hash.length]=2
      if(!$location.$$hash.indexOf("find"))
        ProductService.FindProduct(vm.result.cateSelect, vm.result.priceSelect, vm.currentPage).then(function(data) {
        vm.products = data.products;
        vm.totalProducts = data.total_record;
        vm.currentPage = data.page;
      });
      else
        GetAllProduct();
    }
  }
})();
