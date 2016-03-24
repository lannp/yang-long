(function() {
  'use strict';

  angular
    .module('app')
    .factory('ProductService', ProductService);

  ProductService.$inject = ["$http"];
  function ProductService($http) {
    var service = {};

    service.GetAll = GetAll;
    service.GetByLink = GetByLink;
    service.GetInCate = GetInCate;
    service.FindInCateNd = FindInCateNd;
    service.FindInCate = FindInCate;
    service.FindByQuerry = FindByQuerry;
    service.GetInCateSt = GetInCateSt;
    return service;

    function GetAll(page) {
      return $http.get('api/products?page=' +page).then(handleSuccess, handleError('Error getting all posts'));
    };

    function GetByLink(link) {
      return $http.get('api/products/' + link).then(handleSuccess, handleError('Error getting all posts'));
    };

    function GetInCate(link, page) {
      return $http.get('api/category_nds/' + link +'/products?page=' +page).then(handleSuccess, handleError('Error getting all posts'));
    }

    function FindInCateNd(cate_nd,price, page) {
      return $http.get('api/products?category_nd_id=' + cate_nd +'&price='+price+'&page=' +page).then(handleSuccess, handleError('Error getting all posts'));
    }

    function FindInCate(cate,price, page) {
      return $http.get('api/products?category_id=' + cate +'&price='+price+'&page=' +page).then(handleSuccess, handleError('Error getting all posts'));
    }

    function FindByQuerry(querry) {
      return $http.get('api/products'+ querry).then(handleSuccess, handleError('Error getting all posts'));
    }

    function GetInCateSt(cate_st, page) {
      return $http.get('api/categories/'+ cate_st+'/products?page=' +page).then(handleSuccess, handleError('Error getting all posts'));

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
