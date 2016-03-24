(function() {
  'use - strict';
  angular
    .module('app')
    .directive('addCart', addCart);

  function addCart() {
    return {
      restrict: 'E',

    }
  }

})();
