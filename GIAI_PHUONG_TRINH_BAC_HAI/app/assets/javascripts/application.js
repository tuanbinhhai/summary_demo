//= require jquery.min
//= require suggest.min
//= require angular
//= require bootstrap.min
//= require angular-strap.min
//= require angular-resource
//= require services/sessionService
//= require services/recordService
//= require controllers/app
//= require controllers/record
//= require controllers/users

angular.module('giaiphuongtrinhbachai', ['sessionService','recordService','$strap.directives'])
  .config(['$httpProvider', function($httpProvider){
        $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');

        var interceptor = ['$location', '$rootScope', '$q', function($location, $rootScope, $q) {
            function success(response) {
                return response
            };

            function error(response) {
                if (response.status == 401) {
                    $rootScope.$broadcast('event:unauthorized');
                    $location.path('/users/giai_phuong_trinh_bac_hai');
                    return response;
                };
                return $q.reject(response);
            };

            return function(promise) {
                return promise.then(success, error);
            };
        }];
        $httpProvider.responseInterceptors.push(interceptor);
  }])
  .config(['$routeProvider', function($routeProvider){
    $routeProvider
      .when('/users/giai_phuong_trinh_bac_hai', {templateUrl:'/users/giai_phuong_trinh_bac_hai.html', controller:UsersCtrl})
      .when('/', {templateUrl:'/home/index.html'});
  }]);
