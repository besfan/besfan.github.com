resume_fw.apps.init_resume_screen = function () {
    return {
        init_my_resume: function () {
            var $aMenuOneLi = $(".item_character");
            var $aMenuTwo = $(".item_article");
            $aMenuOneLi.hover(
                function () {
                    $(this).addClass("item_character_hover");
                },
                function () {
                    $(this).removeClass("item_character_hover");
                }
            );
            $aMenuOneLi.each(function (i) {
                var $item_character = $(this);
                var $pic_arrow = $item_character.find("span:last-child");
                var $item_article = $($aMenuTwo[i]);
                $(this).toggle(function () {
                    //$item_character.css("background", "#252525");
                    $item_article.slideUp(300);
                    $pic_arrow.attr("class", "arrow_hide")
                }, function () {
                    // $item_character.css("background", "#1c1c1c");
                    $item_article.slideDown(300);
                    $pic_arrow.attr("class", "arrow_show")
                });
            });

            $(window).bind("scroll", function () {

                // 获取网页文档对象滚动条的垂直偏移
                var scrollTopNum = $(document).scrollTop(),
                // 获取浏览器当前窗口的高度
                    winHeight = $(window).height(),
                    return_top = $("div.return_top");

                // 滚动条的垂直偏移大于 0 时显示，反之隐藏
                (scrollTopNum > 0) ? return_top.fadeIn("fast") : return_top.fadeOut("fast");

                // 给 IE6 定位
                if (!-[1, ] && !window.XMLHttpRequest) {
                    return_top.css("top", scrollTopNum + winHeight - 200);
                }

            });
            $("div.return_top").hover(
                function () {
                    $(this).addClass("return_top_hover");
                },
                function () {
                    $(this).removeClass("return_top_hover");
                });
            // 点击按钮后，滚动条的垂直方向的值逐渐变为0，也就是滑动向上的效果
            $("div.return_top").click(function () {
                $("html, body").animate({ scrollTop: 0 }, 500);
            });
        }
    }
}();