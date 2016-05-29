<?php

class WebsiteAction extends PublicAction{
    function _initialize() {
		parent::_initialize ();
        if(file_exists("./Public/Conf/group_".$_SESSION ["wadmin"].".php"))
		{
			require "./Public/Conf/group_".$_SESSION ["wadmin"].".php";
			
			$this->group_json = json_decode($group_json);
		}
		else
		{
			$this->group_json = array(1,2,3,4,5,6,7,8);
		}
	}

    function index() {
		if ($_SESSION ["wadmin"] && in_array(7,$this->group_json)) {
			$result = R ( "Api/Api/getsetting" );
			$this->assign ( "info", $result );
			
			$themedir = getDir("./Application/Tpl/App");
			
			for ($i = 0; $i < count($themedir); $i++) {
				$theme[$i] = simplexml_load_file("./Application/Tpl/App".$themedir[$i]."/config.xml");
				if (isset($theme[$i])) {
					$theme[$i]->dir = $themedir[$i];
				}
			}
			$this->assign("theme",$theme);
			$this->assign("settheme",$result["theme"]);
			$payresult = R ( "Api/Api/getalipay" );
			$this->assign ( "alipay", $payresult );
			
			$buyday = 0;
			if(file_exists('./Public/Conf/buyday.php'))
			{
				require './Public/Conf/buyday.php';
			}
			$this->assign ( "buyday", $buyday );
			$result = M ( "Admin" )->select ();
			
			
			$group_des=array();
			$group_des[1]='商城设置';
			$group_des[2]='菜单管理';
			$group_des[3]='商品管理';
			$group_des[4]='订单管理';
			$group_des[5]='用户管理';
			$group_des[6]='微信管理';
			$group_des[7]='提现管理';
			
			foreach($result as $key=>$info)
			{
				if(file_exists("./Public/Conf/group_".$info["username"].".php"))
				{
					require "./Public/Conf/group_".$info["username"].".php";
					
					$group_json = json_decode($group_json);
				}
				else
				{
					$group_json = array(1,2,3,4,5,6,7);
				}
				
				
				$group = '';
				foreach($group_json as $json_info)
				{
					$group .= $group_des[$json_info].'|';
				}
				
				$result[$key]['group'] = $group;
			}
			
			$this->assign ( "result", $result );
			$this->display ();
		}
	}
}