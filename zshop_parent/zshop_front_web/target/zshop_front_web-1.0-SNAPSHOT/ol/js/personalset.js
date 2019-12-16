var a = new Array();
function personalSet() {
        document.getElementById("cancel").classList.remove("hide");
        var list = document.getElementById("personalbox").getElementsByTagName("li");
        window.a[0] = list[0].innerHTML;
        window.a[1] = list[1].innerHTML;
        window.a[2] = list[2].innerHTML;
        window.a[3] = list[4].innerHTML;
        window.a[4] = list[5].innerHTML;
        window.a[5] = list[6].innerHTML;
        window.a[6] = list[3].innerHTML;
        list[0].innerHTML="<input id=\"name\" type=\"text\" class=\"form-control\" placeholder=\"姓名\">";
        list[3].innerHTML="<input type=\"text\" id=\"address\" class=\"form-control\" placeholder=\"我的地址\">";
        list[4].innerHTML="<input onBlur='Checktelfun()' id=\"tel\" type=\"text\" class=\"form-control\" placeholder=\"电话号码\"><p id=\"telp\"  class='hide' style='color: red;margin-top: 10px;margin-bottom: 0px;'>电话号码有误！</p>";
        //var last = document.getElementById('lilast');
        //last.insertAdjacentHTML('afterend', "<li class=\"list-group-item text-right\"><a id='cancel' class='btn btn-w-m btn-warning'>取消</a>&nbsp;&nbsp;<button type='submit' class='btn btn-w-m btn-info'>提交</button></li>");
}

function reset(){
    document.getElementById("cancel").classList.add("hide");
    var list = document.getElementById("personalbox").getElementsByTagName("li");
    list[0].innerHTML=window.a[0];
    list[1].innerHTML=window.a[1];
    list[2].innerHTML=window.a[2];
    list[4].innerHTML=window.a[3];
    list[3].innerHTML=window.a[6];
    list[5].innerHTML=window.a[4];
    list[6].innerHTML=window.a[5];
}

function checkPhonefun() {
    var mobile = document.getElementById("tel").value;
    var tel = /^0\d{2,3}-?\d{7,8}$/;
    var phone = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
    if(mobile.length == 11){//手机号码
        if(phone.test(mobile)) {
            //console.log(mobile);
            return true;
        }
    }else if(mobile.length == 13 && mobile.indexOf("-") != -1 ){//电话号码
        if(tel.test(mobile)) {
            //console.log(mobile);
            return true;
        }
    }
    return false;
}

function Checktelfun() {
    //console.log(!(document.getElementById("tel").value.length>0));
    if(!(document.getElementById("tel").value.length>0)){
        document.getElementById("tijiao").removeAttribute("disabled");
        document.getElementById("telp").classList.add("hide");
    }
    else if(checkPhonefun()==false){
        document.getElementById("tijiao").setAttribute("disabled", "disabled");
        document.getElementById("telp").classList.remove("hide");
    }else {
        document.getElementById("tijiao").removeAttribute("disabled");
        document.getElementById("telp").classList.add("hide");
    }
}
