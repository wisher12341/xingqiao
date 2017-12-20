function tGround_2_change(obj) {
    $.ajax({
        type: 'post',
        url: '/area/getArea3ByArea2Name',
        data:{
            'area2_name':obj.value
        },
        dataType: 'json',
        success: function (data) {
            if(data.success==true){
                var $select=$("#tGround_3_select");
                $select.html("");
                for(var i=0;i<data.data.length;i++) {
                    var $option = $("<option value='" + data.data[i].name + "'>" + data.data[i].name + "</option>");
                    $select.append($option);
                }
            }
        }
    });
}

function saveModify(objId,fieldName,table) {
    if (fieldName == "ground" && ($("#tGround_1_select").val() == "" || $("#tGround_2_select").val() == "" || $("#tGround_3_select").val() == "" || $("#addressInput").val() == "")) {
        alert("请完成填写后提交。");
    }
    else if ($("input").val() == "") {
        alert("请完成填写后提交。");
    }
    else {
        if (fieldName == "ground") {
            var newValue = $("#tGround_1_select").val() + "-" + $("#tGround_2_select").val() + "-" + $("#tGround_3_select").val() +
                "_" + $("#addressInput").val();
        }
        else if(fieldName=="gender"){
            var newValue=$("input[type='radio']:checked").val();
        }
        else
            var newValue = $("input").val();

        $.ajax({
            url: "/wx/parentCenter/saveModify",
            type: 'post',
            dataType: 'json',
            data: {
                "newValue": newValue,
                "objId": objId,
                "fieldName": fieldName,
                "table": table
            },
            success: function () {
                window.location.href = document.referrer;
            },
            error: function () {

            }
        });
    }
}

function modifyRecoveryHis(demandId,index) {
    var name= $("#name").val();
    var time= $("#time").val();
    var count= $("#count").val();
    var detail= $("#detail").val();

    $.ajax({
        url: "/wx/parentCenter/modifyRecoveryHis",
        type: 'post',
        dataType: 'json',
        data: {
            "demandId":demandId,
            "name": name,
            "time": time,
            "count":count,
            "detail":detail,
            "index":index
        },
        success: function(){
            window.location.href=document.referrer;
        },
        error: function(){

        }
    });
}

function addRecoveryHis(demandId) {
    var name= $("#name").val();
    var time= $("#time").val();
    var count= $("#count").val();
    var detail= $("#detail").val();

    $.ajax({
        url: "/wx/parentCenter/addRecoveryHis",
        type: 'post',
        dataType: 'json',
        data: {
            "demandId":demandId,
            "name": name,
            "time": time,
            "count":count,
            "detail":detail,
        },
        success: function(){
            window.location.href=document.referrer;
        },
        error: function(){

        }
    });
}


function deleteMessage(messageId) {
    $.ajax({
        url: "/wx/parentCenter/deleteMessage",
        type: 'post',
        dataType: 'json',
        data: {
            "messageId":messageId
        },
        success: function(data){
            if(data.success==true){
                window.location.reload();
            }
        },
        error: function(){

        }
    });
}







