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
        list[0].innerHTML="<input id=\"name\" type=\"text\" class=\"form-control\" placeholder=\"姓名\">";
        list[1].innerHTML="<select id=\"sex\" class=\"form-control\">\n" +
            "<option value=\"男\">男</option>\n" +
            "<option value=\"女\">女</option>\n" +
            "</select>";
        list[2].innerHTML="<input type=\"date\" id=\"date\" class=\"form-control\" value=\"2019-01-01\">";
        list[4].innerHTML="<input onBlur='Checkidfun()' id=\"id\" type=\"text\" class=\"form-control\" placeholder=\"身份证号码\"><p id=\"idp\" class='hide' style='color: red;margin-top: 10px;margin-bottom: 0px;'>身份证号码有误！</p>";
        list[5].innerHTML="<input type=\"text\" id=\"work\" class=\"form-control\" placeholder=\"工作单位\">";
        list[6].innerHTML="<input onBlur='Checktelfun()' id=\"tel\" type=\"text\" class=\"form-control\" placeholder=\"电话号码\"><p id=\"telp\"  class='hide' style='color: red;margin-top: 10px;margin-bottom: 0px;'>电话号码有误！</p>";
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
    list[5].innerHTML=window.a[4];
    list[6].innerHTML=window.a[5];
}

function checkIDCardfun(){
    var idcode = document.getElementById("id").value;
    // 加权因子
    var weight_factor = [7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2];
    // 校验码
    var check_code = ['1', '0', 'X' , '9', '8', '7', '6', '5', '4', '3', '2'];
    var code = idcode + "";
    var last = idcode[17];//最后一位
    var seventeen = code.substring(0,17);
    // 判断最后一位校验码是否正确
    var arr = seventeen.split("");
    var len = arr.length;
    var num = 0;
    for(var i = 0; i < len; i++){
        num = num + arr[i] * weight_factor[i];
    }
    // 获取余数
    var resisue = num%11;
    var last_no = check_code[resisue];
    /*
    第一位不可能是0
    第二位到第六位可以是0-9
    第七位到第十位是年份，所以七八位为19或者20
    十一位和十二位是月份，这两位是01-12之间的数值
    十三位和十四位是日期，是从01-31之间的数值
    十五，十六，十七都是数字0-9
    十八位可能是数字0-9，也可能是X
    */
    var idcard_patter = /^[1-9][0-9]{5}([1][9][0-9]{2}|[2][0][0|1][0-9])([0][1-9]|[1][0|1|2])([0][1-9]|[1|2][0-9]|[3][0|1])[0-9]{3}([0-9]|[X])$/;
    // 判断格式是否正确
    var format = idcard_patter.test(idcode);
    // 返回验证结果，校验码和格式同时正确才算是合法的身份证号码
    return last === last_no && format ? true : false;
}

function Checkidfun() {
    //console.log(!(document.getElementById("id").value.length>0));
    if(!(document.getElementById("id").value.length>0)){
        document.getElementById("tijiao").removeAttribute("disabled");
        document.getElementById("idp").classList.add("hide");
    }
    else if(checkIDCardfun(a)==false){
        document.getElementById("tijiao").setAttribute("disabled", "disabled");
        document.getElementById("idp").classList.remove("hide");
    }else {
        document.getElementById("tijiao").removeAttribute("disabled");
        document.getElementById("idp").classList.add("hide");
    }
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
