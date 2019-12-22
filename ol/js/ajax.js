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

function personalx() {
    var name,id,work,tel;
    if(document.getElementById("name").value == ""){
        name = "abc/undefined";
    }else{
        name = document.getElementById("name").value;
    }
    if(document.getElementById("id").value == ""){
        id = "abc/undefined";
    }else{
        id = document.getElementById("id").value;
    }
    if(document.getElementById("work").value == ""){
        work = "abc/undefined";
    }else{
        work = document.getElementById("work").value;
    }
    if(document.getElementById("tel").value == ""){
        tel = "abc/undefined";
    }else{
        tel = document.getElementById("tel").value;
    }
    var data = "name=" + name + "&sex=" + document.getElementById("sex").value + "&date=" + document.getElementById("date").value
        + "&id=" + id + "&work=" + work +"&tel=" + tel;
    //alert(data);
    Ajax().post("personalServlet",data,newform);
}

function newform(data) {
    var json = JSON.parse(data);
    //console.log(json.name+json.date+json.id);
    //console.log(json.name);
    //console.log(json.date);
    document.getElementById("cancel").classList.add("hide");
    var list = document.getElementById("personalbox").getElementsByTagName("li");
    list[0].innerHTML="姓名："+json.name;
    list[1].innerHTML="性别："+json.sex;
    list[2].innerHTML="生日："+json.date;
    list[4].innerHTML="身份证号码："+json.id;
    list[5].innerHTML="工作单位："+json.work;
    list[6].innerHTML="联系电话："+json.tel;
}