angular.module('sessionService', [])
    .factory('Session', function($location, $http, $q) {
        // Redirect to the given url (defaults to '/')
        function redirect(url) {
            url = url || '/';
            $location.path(url);
        }
        var service = {
            giai_phuong_trinh_bac_hai: function(a, b, c) {
                return $http.post('/api/sessions', {user: {a: a, b: b, c: c} })
                    .then(function(response) {
                        // service.currentUser = response.data.user;
                        // if (service.isAuthenticated()) {
                        //     //$location.path(response.data.redirect);
                        //     $location.path('/record');
                        // }
                    });
            },
        };
        return service;
    });
