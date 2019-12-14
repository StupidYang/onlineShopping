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

function skip_search_result() {
    var searchtext = "searchtext="+document.getElementById("searchtext").value;
    skip("shop",searchtext);
}

function skip(url,extra) {
    var html = url+".html";
    window.location.href= html+"?"+extra;
}

function ajax_search() {
    var name = getQueryVariable("searchtext");
    console.log(name);
    var data = "name="+name+"&pagename=1";
    Ajax("/search",data,search_result());
}

function search_result(){
    //json数据给过来
    //然后刷新id为results的div
    var html = '<!-- Item -->\n' +
        '                            <div class="col-md-4">\n' +
        '                                <div class="item">\n' +
        '                                    <!-- Sale Tags -->\n' +
        '                                    <div class="on-sale"> 10% <span>OFF</span> </div>\n' +
        '                                    <!-- Item img -->\n' +
        '                                    <div class="item-img"> <img class="img-1" src="sp_image/jk/s3.jpg" alt="" > <img class="img-2" src="sp_image/jk/s2.jpg" alt="" >\n' +
        '                                        <!-- Overlay -->\n' +
        '                                        <div class="overlay">\n' +
        '                                            <div class="position-center-center">\n' +
        '                                                <div class="inn">\n' +
        '                                                    <a href="images/product-2-2.jpg" data-lighter><i class="icon-magnifier"></i></a>\n' +
        '                                                    <a href="#."><i class="icon-basket"></i></a>\n' +
        '                                                </div>\n' +
        '                                            </div>\n' +
        '                                        </div>\n' +
        '                                    </div>\n' +
        '                                    <!-- Item Name -->\n' +
        '                                    <div class="item-name"> <a href="productdetail.html">JK制服定制</a>\n' +
        '                                        <p>简单介绍balabala</p>\n' +
        '                                    </div>\n' +
        '                                    <!-- Price -->\n' +
        '                                    <span class="price">¥99999</span> </div>\n' +
        '                            </div>';
    document.getElementById("results").innerHTML=""+html;
}