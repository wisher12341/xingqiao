

function saveModify(userId,fieldName){
    var newValue= $("input").val();

    $.ajax({
        url: "/wx/parentCenter/saveModify",
        type: 'post',
        dataType: 'json',
        data: {
            "newValue": newValue,
            "userId": userId,
            "fieldName":fieldName
        },
        success: function(){
            window.location.href="/wx/parentCenter/"+userId+"/myInfo";
        },
        error: function(){

        }
    });
}

function saveDemandModify(userId,demandId,fieldName){
    var newValue= $("input").val();

    $.ajax({
        url: "/wx/parentCenter/saveDemandModify",
        type: 'post',
        dataType: 'json',
        data: {
            "newValue": newValue,
            "demandId": demandId,
            "fieldName":fieldName
        },
        success: function(){
            window.location.href="/wx/parentCenter/"+userId+"/myDemands/"+demandId+"/demandDetail";
        },
        error: function(){

        }
    });
}