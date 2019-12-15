function Ajax() {
    var xhr = null;

    if (window.XMLHttpRequest){
        xhr = new XMLHttpRequest();
    }else if(window.ActiveXObject){
        var versions = ['Microsoft.XMLHTTP',
            'MSXML.XMLHTTP',
            'Msxml2.XMLHTTP.7.0',
            'Msxml2.XMLHTTP.6.0',
            'Msxml2.XMLHTTP.5.0',
            'Msxml2.XMLHTTP.4.0',
            'MSXML2.XMLHTTP.3.0',
            'MSXML2.XMLHTTP'
        ];
        for (var i=0;i<versions.length;i++){
            xhr = new ActiveXObject(versions[i]);
            if(xhr){
                break;
            }
        }
    }else {
        return false;
    }

    function checkAndUse(func) {
        xhr.onreadystatechange=function(){
            if(xhr.readyState == 4){
                if(xhr.status == 200){
                    if(xhr.responseText != null){
                        func(xhr.responseText)
                    }
                }
            }
        }
    }

    function ajaxGET(url,func) {
        xhr.open('get', url);
        xhr.send(null);
        checkAndUse(func);
    }

    function ajaxPOST(url,data,func) {
        xhr.open('post', url);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send(data);
        checkAndUse(func);
    }

    return {
        get:ajaxGET,
        post:ajaxPOST
    }
}//使用方式Ajax().get(/login?xxx=xxx&xxx=xxx,alert)
//使用方式Ajax().post(/login,data,alert),发送data数据的格式为data="xxx=xxx&xxx=xxx"

//url取值函数
/*if(getQueryVariable("null")==false)
  若url不存在的，则会返回false，无需双引号*/
function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
        var pair = vars[i].split("=");
        if(pair[0] == variable){return pair[1];}
    }
    return(false);
}

function detailsget() {
    
}
