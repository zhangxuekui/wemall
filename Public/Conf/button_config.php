<?php
$buy_button = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'].'?'.'g=App&m=Index&a=index_info&refresh=1';
$jiazu_button = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'].'?'.'g=App&m=Index&a=member&refresh=1';
$newmenu = '{
		 "button":[
			{	
			  "type":"view",
			  "name":"立即购买",
			  "url":"'.$buy_button.'"
			},
			{
				"name":"我的家族",
				
				"sub_button":[
				{	
				   "name":"我的免费电话",
				   "type":"view",
					"url":"http://3g.51wdh.cn/interface/signin/signin.jsp?agentid=8598289"
				},
				{
				   "type":"click",
				   "name":"活动中心",
				   "key":"GET_PIC"
				},
				{
				   "name":"我的家族中心",
				"type":"view",
				"url":"'.$jiazu_button.'"
				}]
				
				
				
		   },
		   {
			   "name":"我的助手",
			   
			    "sub_button":[
			    	{	
				   "name":"新手指南",
				   "type":"view",
					"url":"http://www.baidu.com/"
				},
				{	
				   "name":"常见问题",
				   "type":"click",
					"key":"GET_INFO"
				},
				{
				   "type":"click",
				   "name":"售后客服",
				   "key":"售后客服"
				}]
		   }]
		}';		
		
$message_name = '滕州绿之源';
$link_config = 'http://mp.weixin.qq.com/s?__biz=MzA4NTQ4OTcxMQ==&mid=204240974&idx=1&sn=78976263ed088381a11d85479cacc5a3#rd';
$config_good_pic = 'http://www.we.com/Public/Plugin/umeditor/php/upload/20160420/1461167253600.jpg';
$headimgurl = 'http://www.we.com/Public/Plugin/umeditor/php/upload/20160420/1461167253600.jpg';
?>