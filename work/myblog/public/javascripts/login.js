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
        },
        init_user_index: function () {
            var x = 10;
            var y = 20;
            $("a.tooltip")
                .mouseover(function (e) {
                    this.myTitle = this.title;
                    this.title = "";
                    var tooltip = "<div id='tooltip'>" + this.myTitle + "<\/div>"; //创建 div 元素
                    $("body").append(tooltip);	//把它追加到文档中
                    $("#tooltip").css({
                        "top": (e.pageY + y) + "px",
                        "left": (e.pageX + x) + "px"
                    }).show("fast");	  //设置x坐标和y坐标，并且显示
                })
                .mouseout(function () {
                    this.title = this.myTitle;
                    $("#tooltip").remove();
                }).mousemove(function (e) {
                    $("#tooltip").css({
                        "top": (e.pageY + y) + "px",
                        "left": (e.pageX + x) + "px"
                    });
                });
        },
        init_post_show: function (jump_to) {
            if (jump_to.length > 0) {
                var comment_area_windowsY = $(".article_body .feedback_area_title")[0].offsetTop;
                $("html, body").animate({ scrollTop: comment_area_windowsY }, 500);
            }

        },
        init_post_edit: function () {
            var oCKeditor = CKEDITOR.replace('post[body]');
            oCKeditor.on('instanceReady', function (event) {
                var editor = event.editor;
                editor.resize(editor.container.getStyle('width'), 600);
            }, null, null, 9999);
        },
        init_post_new:function(){
            var oCKeditor = CKEDITOR.replace('post[body]');
            oCKeditor.on('instanceReady', function (event) {
                var editor = event.editor;
                editor.resize(editor.container.getStyle('width'), 600);
            }, null, null, 9999);
        }

    }
}();