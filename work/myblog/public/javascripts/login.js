blog_fw.app.login = function () {
    return {
        init_login: function () {
            var $login_form = $("#login_form_id");
            $login_form.find("#name").bind('keyup', function () {
                blog_fw.app.login.check_user_name();
            });
            $login_form.find("#password").bind('keyup', function () {
                blog_fw.app.login.check_user_password();
            });
            $login_form.bind("submit", function () {
                if (blog_fw.app.login.check_user_name() && blog_fw.app.login.check_user_password()) {
                    return true;
                } else {
                    return false;
                }
            })
        },
        check_user_name: function () {
            var user_name_length = $("#login_form_id").find("#name").val().length;
            if (user_name_length == 0) {
                $("#login_form_id").find("#name_error").text("Please enter User Name");
                return false;
            } else {
                $("#login_form_id").find("#name_error").text("");
                return true;
            }
        },
        check_user_password: function () {
            var user_password_length = $("#login_form_id").find("#password").val().length;
            if (user_password_length == 0) {
                $("#login_form_id").find("#password_error").text("Please enter User Password!");
                return false;
            } else {
                $("#login_form_id").find("#password_error").text("");
                return true;
            }
        }
    }
}();