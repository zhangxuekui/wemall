<?php
$buy_button = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'].'?'.'g=App&m=Index&a=index&refresh=1';
$jiazu_button = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'].'?'.'g=App&m=Index&a=member&refresh=1';
$qrcode_url = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'].'?'.'g=App&m=Member&a=wechatqrcode&refresh=1';
//QRcode::png($goodsresult['couponslink'], APP_SITE.$coupons_qrcode, 'L',4, 10);
$newmenu = '{
		 "button":[
			{	
			  "type":"view",
			  "name":"商城首页",
			  "url":"'.$buy_button.'"
			},
			{
			   "name":"活动信息",
			    "sub_button":[
			    	{	
				   "name":"热卖专区",
				   "type":"view",
					"url":"http://www.baidu.com/"
				},
				{	
				   "name":"限时抢购",
				   "type":"click",
					"key":"GET_INFO"
				},
				{
                   "type": "view",
				   "name":"免单专区",
                   "url":"http://www.quyougou.cn/"
				}]
		   },
            {
			   "name":"我的服务",
			    "sub_button":[
			    	{	
				   "name":"个人中心",
				   "type":"view",
					"url":"http://www.baidu.com/"
				},
				{	
				   "name":"我的二维码",
				   "type":"view",
					"url":"'.$qrcode_url.'"
				}]
		   }]
		}';		
		
$message_name = '趣优购';
$link_config = 'http://mp.weixin.qq.com/s?__biz=MzA4NTQ4OTcxMQ==&mid=204240974&idx=1&sn=78976263ed088381a11d85479cacc5a3#rd';
$config_good_pic = 'http://'.$_SERVER['HTTP_HOST'].'/Public/Plugin/umeditor/php/upload/20160420/1461167253600.jpg';
$headimgurl = 'http://'.$_SERVER['HTTP_HOST'].'/Public/Plugin/umeditor/php/upload/20160420/1461167253600.jpg';
?>