$(function () {

    // showItem控制顯示項恆亮燈, 未顯示項hover亮燈
    $("#cardBlacklist").hover(function () {
        var showItem = ($(this).attr('showItem') === 'true');
        if (!showItem) {
            $(this).find('.icon-shape').removeClass('icon-shape-gray-700').addClass('icon-shape-milktea');
        }
    }, function () {
        var showItem = ($(this).attr('showItem') === 'true');
        if (!showItem) {
            $(this).find('.icon-shape').removeClass('icon-shape-milktea').addClass('icon-shape-gray-700');
        }
    })

    $("#cardRuleEngine").hover(function () {
        var showItem = ($(this).attr('showItem') === 'true');
        if (!showItem) {
            $(this).find('.icon-shape').removeClass('icon-shape-gray-700').addClass('icon-shape-cyan');
        }
    }, function () {
        var showItem = ($(this).attr('showItem') === 'true');
        if (!showItem) {
            $(this).find('.icon-shape').removeClass('icon-shape-cyan').addClass('icon-shape-gray-700');
        }
    })

    $("#cardAIRisk").hover(function () {
        var showItem = ($(this).attr('showItem') === 'true');
        if (!showItem) {
            $(this).find('.icon-shape').removeClass('icon-shape-gray-700').addClass('icon-shape-blue');
        }
    }, function () {
        var showItem = ($(this).attr('showItem') === 'true');
        if (!showItem) {
            $(this).find('.icon-shape').removeClass('icon-shape-blue').addClass('icon-shape-gray-700');
        }
    })

    var iconShapeColor = ['icon-shape-milktea', 'icon-shape-cyan', 'icon-shape-blue'];
    $('.cardRiskItem').click(function () {
        var reportActive = ($(this).attr('reportActive') === 'true');
        if (reportActive) {
            var index = $('.cardRiskItem').index(this);
            $('.riskreport').each(function (i) {
                if (i == index) {
                    $(this).show(400);
                }
                if (i != index) {
                    $(this).hide();
                }
            });
            $('.cardRiskItem').each(function (j) {
                if (j == index) {
                    $(this).attr('showItem', 'true');
                    $(this).find('.icon-shape').removeClass('icon-shape-gray-700').addClass(iconShapeColor[j]);
                }
                if (j != index) {
                    $(this).attr('showItem', 'false');
                    $(this).find('.icon-shape').removeClass(iconShapeColor[j]).addClass('icon-shape-gray-700');
                }
            });
        }
    })

    $(".ch_plan_perf").click(function () {
        $('#cb_detail').show(400);
    })
    $("#cb_detail_angleup").click(function(){
        $('#cb_detail').hide(200);
    })
});