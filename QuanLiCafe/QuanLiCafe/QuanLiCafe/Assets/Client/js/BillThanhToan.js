$(document).ready(function () {
   
    //ChangeValue Db
    
    $('.ChangValue').off('keypress').on('keypress', function (e) {
        if (e.which == 13) {
            var id = $(this).attr('data-id');
            var value = $(this).val();
            Update(id, value);
        }
    });
    function Update(idbill, value) {
        var billid = $('.ChangValue').attr('data-role');
        var data = {
            BillInfo_id: idbill,
            count: value
        };
        $.ajax({
            url: '/HomeClient/EditBill',
            type: 'POST',
            dataType: 'json',
            data: {model:JSON.stringify(data)},
            success: function (response) {
                if (response.status) {
                    //alert('update thành công');
                    showBill(billid);
                }
                else
                {
                    alert('thất bại');
                }

            }
        });
    }
    function showBill(id_bill) {
        $.ajax({
            url: '/HomeClient/GetBill',
            type: 'POST',
            data: {
                id_bill
            },
            success: function (d) {
                $('#TT_danhmuc').html(d);
                $('#thanhToan').show();
            }
        });
    }
    // Xóa món

});
