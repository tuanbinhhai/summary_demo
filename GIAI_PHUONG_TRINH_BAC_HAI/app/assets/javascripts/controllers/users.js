function UsersCtrl($scope, Session) {"use strict";
    $scope.giai_phuong_trinh_bac_hai = function(user) {
        $scope.authError = null;

        Session.giai_phuong_trinh_bac_hai(user.a, user.b, user.c)
        .then(function(response) {
            if (!response) {
                $scope.authError = 'Invalid email or password!!!';
            } else {
                $scope.authError = 'Success!';
            }
        }, function(response) {
            $scope.authError = 'Server offline, please try later';
        });
    };
}

