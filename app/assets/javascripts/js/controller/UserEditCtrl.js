(function() {

  angular
    .module('app')
    .controller('UserEditCtrl', UserEditCtrl);

  UserEditCtrl.$inject = ["LoginService", "UserService", "$timeout", "Upload", "$rootScope", "$location", 'ProvincialService', "$scope"]
  function UserEditCtrl(LoginService, UserService, $timeout, Upload, $rootScope, $location, ProvincialService, $scope) {
    vm =this;
    vm.current_user = $rootScope.globals.currentUser;
    vm.edit_user = vm.current_user;
    console.log(vm.current_user);
    vm.provincials = [];

    vm.UpdateUser = UpdateUser;
    vm.Update = Update;
    // GetUser();

    // function GetUser() {
    //   UserService.GetByLink(vm.current_user.link, 0).then(function(data) {
    //     vm.this_user = data.user;
    //   });
    // }
    GetTinh();

    function GetTinh() {
      ProvincialService.GetAll().then(function(data) {
        vm.provincials = data.provincials;
        vm.this_provincial = data.provincials[0];
        vm.this_district = data.provincials[0].districts[0];
        angular.forEach(data.provincials, function(provincial) {
          if (vm.edit_user.provincial!= null && vm.edit_user.provincial.name == provincial.name)
            vm.edit_user.provincial = provincial;
        });
      });
    };

    function Update() {
      var user = {
          id:             vm.edit_user.id,
          email:          vm.edit_user.email,
          link:           vm.edit_user.link,
          auth_token:     vm.edit_user.auth_token,
          name:           vm.edit_user.name,
          street:         vm.edit_user.street,
          provincial_id:  vm.edit_user.provincial.id,
          district_id:    vm.edit_user.district.id,
          password:       vm.edit_user.pass,
          password_confirmation: vm.edit_user.passconfirm
          }
      UserService.Update(user).then(function(data) {
        LoginService.SetCurrentUser(data.user);
        console.log(data);
           // window.location.reload();
      })
    }

    function UpdateUser(file) {
      file.upload = Upload.upload({
        url: 'http://localhost:3000/api/users/'+vm.current_user.link,
        method: 'PATCH',
        data: {
          id:             vm.edit_user.id,
          email:          vm.edit_user.email,
          link:           vm.edit_user.link,
          auth_token:     vm.edit_user.auth_token,
          name:           vm.edit_user.name,
          street:         vm.edit_user.street,
          provincial_id:  vm.edit_user.provincial.id,
          district_id:    vm.edit_user.district.id,
          password:       vm.edit_user.pass,
          password_confirmation: vm.edit_user.passconfirm,
          avatar: file},//it is the data that's need to be sent along with image
        file: file,
        fileFormDataName: 'user[avatar]',//user is the name of the entity in which image is saved and image is the name of the attachment
        formDataAppender: function(fd, key, val) {
            if (angular.isArray(val)) {
                angular.forEach(val, function(v) {
                    fd.append('user['+key+']', v);
                });
            } else {
                fd.append('user['+key+']', val);
            }
        }
      });
      file.upload.then(function (response) {
        $timeout(function () {
          file.result = response.data;
          console.log(response.data);
           LoginService.SetCurrentUser(response.data.user);
           window.location.reload();
        });
      }, function (response) {
        if (response.status > 0)
          $scope.errorMsg = response.status + ': ' + response.data;
      }, function (evt) {
        file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
      });
    };

  }
})();
