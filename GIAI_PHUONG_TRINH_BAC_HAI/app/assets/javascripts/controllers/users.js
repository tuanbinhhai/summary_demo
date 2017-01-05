function UsersCtrl($scope, Session) {"use strict";
    $scope.giai_phuong_trinh_bac_hai = function(user) {
        $scope.authError = null;

        Session.giai_phuong_trinh_bac_hai(user.a, user.b, user.c)
        .then(function(response) {
            user.title = response.title;
            if (response.value == 'nghiem_kep') {
                user.nghiem_1 = response.nghiem_1;
            } else if (response.value == 'nghiem_thuc') {
                user.nghiem_2 = response.nghiem_2;
                user.nghiem_3 = response.nghiem_3;
            } else {
                user.nghiem_4 = response.nghiem_4;
                user.nghiem_5 = response.nghiem_5;
            }
        }, function(response) {
            $scope.authError = 'Server offline, please try later';
        });
    };
}

