<?php


$APPID='wxbd6d33fdeb93a3da';
$REDIRECT_URI='http://www.quyougou.cn/test.php';
$scope='snsapi_userinfo';
$APPSECRET='d9ec1d60289d0ccf74be77f3804adeba';
//$scope='snsapi_userinfo';//需要授权
$url='https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$APPID.'&redirect_uri='.urlencode($REDIRECT_URI).'&response_type=code&scope='.$scope.'&state='.$state.'#wechat_redirect';
if(isset($_GET['code'])) {
    //code参数已有，获取openid;  
    $url_get='https://api.weixin.qq.com/sns/oauth2/access_token?appid='.$APPID.'&secret='.$APPSECRET.'&code='.$_GET['code'].'&grant_type=authorization_code';
    $token = file_get_contents($url_get);
    $token = json_decode($token,true);
    $url_user = "https://api.weixin.qq.com/sns/userinfo?access_token=".$token['access_token']."&openid=".$token['openid']."&lang=zh_CN";
    $user =  file_get_contents($url_user);
    echo $url_user;
    echo($user);exit;
}
//                  https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
header("Location:".$url);
exit;
GetUserOpenid();
function GetUserOpenid($uri='http://www.saikui.com/index.php?g=Admin&m=Wechat&a=index',$appid='wxbd6d33fdeb93a3da',$appsecret='d9ec1d60289d0ccf74be77f3804adeba ') {
 
    if(!isset($uri) && !isset($appid)){
        return false;
        exit;
    }
    if(isset($_GET['code'])) {
        //code参数已有，获取openid;  
        $url_get='https://api.weixin.qq.com/sns/oauth2/access_token?appid='.$appid.'&secret='.$appsecret.'&code='.$_GET['code'].'&grant_type=authorization_code';
        $res=json_decode(curlGet($url_get));
        session('wx_openid',$res->openid);//保存openid。
        header("location:".$uri); //获取openid后跳转到指定页面。
    }else{
        //无code参数，先获取code
        $uri=urlencode($uri);//这里需要urlencode一下
        echo $redurl='https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$appid.'&redirect_uri='.$uri.'&response_type=code&scope=snsapi_base&state=123#wechat_redirect'; 
        header("location:".$redurl);
    }
}

var_dump($_GET);
var_dump($_POST);
var_dump($_SERVER);