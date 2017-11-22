

function saveModify(objId,fieldName,table){
    var newValue= $("input").val();

    $.ajax({
        url: "/wx/parentCenter/saveModify",
        type: 'post',
        dataType: 'json',
        data: {
            "newValue": newValue,
            "objId": objId,
            "fieldName":fieldName,
            "table":table
        },
        success: function(){
            window.location.href=document.referrer;
        },
        error: function(){

        }
    });
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



