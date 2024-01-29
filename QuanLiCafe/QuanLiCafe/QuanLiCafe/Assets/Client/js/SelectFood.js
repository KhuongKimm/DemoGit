$(document).ready(function () {
    // Hàm active tab nào đó

    $('.danhMuc a').click(function (e) {

        var href = $(this).attr('href');
        $('.danhMuc a').removeClass('current');
        $('.danhmic_listitem').removeClass('current');
        $(this).addClass('current');
        $(href).addClass('current');

        //button
        var list_a = $('.danhMuc a');
        var a_selected = $(e.target);
        console.log(list_a);
        console.log(a_selected);
        list_a.removeClass('current_select');
        a_selected.addClass('current_select');
    })

    // hiện danh mục và hóa đơn
    $('.list_table div').on("click", function () {
        var nameTB = $(this).attr('data-content');
        console.log(nameTB);
       $('#home-tab-TT').text(nameTB);
    });
    //chọn món
    function formatNumber(num) {
        return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
    }
    // Hàm active tab nào đó


});