<?php
class MemberAction extends Action {
	function _initialize() {

	}

    public function init($type = 'index')
    {
        $agent = $_SERVER['HTTP_USER_AGENT'];
        if (strpos($agent, "MicroMessenger") && ((!isset($_GET['uid']) && empty($_SESSION["uid"])) || isset($_GET['refresh']))) {
            import('Wechat', APP_PATH . 'Common/Wechat', '.class.php');
            $config = M("Wxconfig")->where(array(
                "id" => "1"
            ))->find();
            $options = array(
                'token' => $config ["token"], // 填写你设定的key
                'encodingaeskey' => $config ["encodingaeskey"], // 填写加密用的EncodingAESKey
                'appid' => $config ["appid"], // 填写高级调用功能的app id
                'appsecret' => $config ["appsecret"], // 填写高级调用功能的密钥
                'partnerid' => $config ["partnerid"], // 财付通商户身份标识
                'partnerkey' => $config ["partnerkey"], // 财付通商户权限密钥Key
                'paysignkey' => $config ["paysignkey"]  // 商户签名密钥Key
            );
            $weObj = new Wechat ($options);

            $info = $weObj->getOauthAccessToken();
            if (!$info) {
                $callback = 'http://' . $_SERVER ['SERVER_NAME'] . U("App/Index/$type", $_GET);
                $url = $weObj->getOauthRedirect($callback, '', 'snsapi_base');
                header("Location: $url");
                exit();
            } else {
                $_SESSION['uid'] = $_POST['uid'] = $_GET['uid'] = $info['openid'];
            }
        }

        if (!empty($_SESSION["uid"]) && empty($_GET['uid'])) {
            $_GET['uid'] = $_SESSION["uid"];
        }
        var_dump($_SESSION);
        if (empty($_GET['uid'])) {
            $url = 'http://' . $_SERVER ['SERVER_NAME'] . U('App/Member/login');
            header("Location: $url");
            exit();
        }
    }
    function index() {
        $this->init('member');
        $uid = $_SESSION ['uid'];
		if ($uid) {
			$info = R ( "Api/Api/gettheme" );
			C ( "DEFAULT_THEME", $info ["theme"] );
			$this->assign ( "info", $info );
			
            $usersresult = R ( "Api/Api/getuser", array (
                $uid 
			) );
            //import('Org.Util.QRcode');//thinkphp
            //\QRcode::png('url:http://www.leipi.org', './Public/img/test1.png', 'L',4, 2);

			$where = array();
			$where ["status"] = 0;
			$where ["level_id"] = $usersresult['id'];
			$start_price = M ( "Order_level" )->where($where)->sum('price');
			
			$where = array();
			$where ["status"] = 1;
			$where ["level_id"] = $usersresult['id'];
			$over_price = M ( "Order_level" )->where($where)->sum('price');
			
			$where = array();
			$where ["status"] = 2;
			$where ["level_id"] = $usersresult['id'];
			$confirm_price = M ( "Order_level" )->where($where)->sum('price');
			
			$where = array();
			$where ["status"] = 3;
			$where ["level_id"] = $usersresult['id'];
			$add_over_price = M ( "Order_level" )->where($where)->sum('price');
			
			$where = array();
			$where ["status"] = 0;
			$where ["uid"] = $usersresult['id'];
			$get_start_price = M ( "Tx_record" )->where($where)->sum('price');
			
			$where = array();
			$where ["status"] = 1;
			$where ["uid"] = $usersresult['id'];
			$get_end_price = M ( "Tx_record" )->where($where)->sum('price');
			
			$start_price = $start_price>0 ? $start_price : 0;
			$over_price = $over_price>0 ? $over_price : 0;
			$confirm_price = $confirm_price>0 ? $confirm_price : 0;
			$add_over_price = $add_over_price>0 ? $add_over_price : 0;
			$get_end_price = $get_end_price>0 ? $get_end_price : 0;
			$get_start_price = $get_start_price>0 ? $get_start_price : 0;
			
			$all_price = $start_price+$over_price+confirm_price+add_over_price;
			
			$all_price = bcadd($start_price, $over_price, 2);
			$all_price = bcadd($all_price, $confirm_price, 2);
			$all_price = bcadd($all_price, $add_over_price, 2);
			
			
			$this->assign ( "start_price", $start_price );
			$this->assign ( "over_price", $over_price );
			$this->assign ( "confirm_price", $confirm_price );
			$this->assign ( "add_over_price", $add_over_price );
			$this->assign ( "get_start_price", $get_start_price );
			$this->assign ( "get_end_price", $get_end_price );
			$this->assign ( "all_price", $all_price );
			$this->assign ( "users", $usersresult );
			
			$type_a_url = 'http://' . $_SERVER ['SERVER_NAME']. U('App/Index/member_info',array('type'=>1,'id'=>$usersresult['id']));
			$type_b_url = 'http://' . $_SERVER ['SERVER_NAME']. U('App/Index/member_info',array('type'=>2,'id'=>$usersresult['id']));
			$type_c_url = 'http://' . $_SERVER ['SERVER_NAME']. U('App/Index/member_info',array('type'=>3,'id'=>$usersresult['id']));
			$this->assign ( "type_a_url", $type_a_url );
			$this->assign ( "type_b_url", $type_b_url );
			$this->assign ( "type_c_url", $type_c_url );
			
			$all_cnt = $usersresult['a_cnt']+$usersresult['b_cnt']+$usersresult['c_cnt'];
			$this->assign ( "all_cnt", $all_cnt );
			
			$where = array();
			$where ["uid"] = $usersresult['id'];
			$tx_record = M ( "Tx_record" )->where($where)->select();

			$this->assign ( "tx_record", $tx_record );
			
			if($usersresult['member']==1 && (empty($usersresult['ticket']) || empty($usersresult['url'])))
			{
				$this->add_member($usersresult['id'],$usersresult['uid']);
			}
			
			$where = array();
			$where ["level_id"] = $usersresult['id'];
			$all_buy = M ( "Order_level" )->where($where)->count();
			
			$where = array();
			$where ["status"] = 0;
			$where ["level_id"] = $usersresult['id'];
			$all_over_buy = M ( "Order_level" )->where($where)->count();
			
			$all_start_buy = $all_buy - $all_over_buy;//已付款
			
			$this->assign ( "all_buy", $all_start_buy );//已付款
			$this->assign ( "all_over_buy", $all_over_buy );//未付款
			$this->assign ( "all_count_buy", $all_buy );//总付款
			
			//营业额
			/*$result = M ( "Good" )->find ();
              $all_buy_price = $result['price']*$all_buy;
              $this->assign ( "all_buy_price", $all_buy_price );*/
			$db = new Model();
            $ALL_COUNT = $db->query("SELECT sum(`totalprice`) as total FROM `wemall_order_level` inner join `wemall_order` on `wemall_order_level`.`order_id` =  `wemall_order`.`orderid` where `level_id`=$usersresult[id]");
			$all_buy_price = empty($ALL_COUNT[0]['total']) ? 0 : $ALL_COUNT[0]['total'];
			$this->assign ( "all_buy_price", $all_buy_price );
			
			//推荐人
			$l_name = $this->get_l_info($usersresult['l_id']);
			$l_name = $l_name['nickname'];
			$l_name = !empty($l_name) ? $l_name : ''.$message_name.'';
			$this->assign ( "l_name", $l_name );
			
			
			$ticket = R ( "Api/Api/ticket", array (
                $usersresult 
			) );
			
			$this->assign ( "ticket", $ticket['ticket'] );
			
			$this->assign ( "dongjia_time", $this->dongjia_time );


            //是否已经签到
            $signins = M('signin')->query('select * from '.DB_PREFIX.'signin where uid='.$uid.' and FROM_UNIXTIME(addtime,"%Y-%m-%d")='.'"'.date('Y-m-d',time()).'"',true);

            $signin_status = 0;
            if($signins) {
                $signin_status = 1;
            }
            $this->assign('signin_status',$signin_status);
			$url = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'].'?'.'g=App&m=Member&a=register&mid='.$usersresult['id'];
			$this->assign ( "member_url", $url );
            $data['action_name'] = 'memberindex';
            $this->assign('data',$data);			
			$this->display ();
		} else {
			echo '请使用微信访问!';
		}
    }
    /*
     *签到
     */
    function signin() {
        $this->init();
        $uid = $_SESSION ['uid'];
        if($uid) {
            $signins = M('signin')->query('select * from '.DB_PREFIX.'signin where uid='.$uid.' and FROM_UNIXTIME(addtime,"%Y-%m-%d")='.'"'.date('Y-m-d',time()).'"',true);
            if(empty($signins)) {
                M('signin')->add(array('uid'=>$uid,'addtime'=>time()));                
            }
            echo json_encode(array('status'=>1,'msg'=>'签到完成'));
        } else {
            echo json_encode(array('status'=>0,'msg'=>'请登录'));
        }
        exit;
    }
    //成员管理
    function members() {
        $this->init('member');
        $uid = $_SESSION ['uid'];
		if ($uid) {
			$info = R ( "Api/Api/gettheme" );
			C ( "DEFAULT_THEME", $info ["theme"] );
			$this->assign ( "info", $info );
			
            $usersresult = R ( "Api/Api/getuser", array (
                $uid 
			) );
            $this->display();
        }
    }
    
	function info() {
		$uid = $_GET['uid'];
		$where = array('uid'=>$uid);
		$users = M("User")->where($where)->find();

		$this->assign("users",$users);
		if ( empty($users) ) {
			exit('未查到该用户信息');
		}
		if ( IS_POST ) {
				
			if (!$_POST['login']) {
				$this->error("请输入用户名");
				exit;
			}else {
				$map['login'] = $_POST['login'];
				$map['uid'] = array('neq',$_GET['uid']);
				$check = M("User")->where($map)->find();
				if (!empty($check)) {
					$this->error("该用户名已存在！请重新输入");
					exit;
				}
			}

			if (!$_POST['password']) {
				unset($_POST['password']);
			}else {
				$_POST['password'] = md5($_POST['password']);
			}

			import ( 'ORG.Net.UploadFile' );
			$upload = new UploadFile (); // 实例化上传类
			$upload->maxSize = 3145728; // 设置附件上传大小
			$upload->allowExts = array (
                'jpg',
                'gif',
                'png',
                'jpeg',
                'xlsx',
                'xls'
			); // 设置附件上传类型
			$upload->savePath = './Public/Uploads/';
			$wx_info = array();
			$wx_info = json_decode($users['wx_info'],true);
			if (! $upload->upload ()) { // 上传错误提示错误信息
				$wx_info['nickname'] = $_POST['login'];
				$_POST['wx_info'] = json_encode($wx_info);
			} else { 
				$info = $upload->getUploadFileInfo ();
				$path = $upload->savePath.$info[0]['savename'];
				$wx_info['nickname'] = $_POST['login'];
				$wx_info['headimgurl'] = $path;
				$_POST['wx_info'] = json_encode($wx_info);
			}
			M("User")->where($where)->save($_POST);
			$this->success("保存成功！",U('App/Index/member',array("uid"=>$users['uid'])) );
			exit;
		}

		$this->display("./default/Index/member_index");
	}


	function login() {
		if ( IS_POST ) {
			if (!$_POST['login']) {
				$this->error("请输入用户名");
				exit;
			}
			if (!$_POST['password']) {
				$this->error("请输入登陆密码");
				exit;
			}

			$thisUser = M("User")->where(array('login'=>$_POST['login']))->find();

			if (empty($thisUser)) {
				$this->error("用户名不存在！");
				exit;
			}else {
				if ($thisUser['password'] == md5($_POST['password'])) {
					$_SESSION["uid"] = $thisUser['uid'];
					$_SESSION['wx_info'] = json_decode($thisUser['wx_info']);
					$this->success("登陆成功！",U('App/Member/index',array("uid"=>$thisUser['uid'])) );exit;
				}else {
					$this->error("密码错误！");
					exit;
				}
			}
		}
		
		$this->display("./default/Index/member_login");
	}
	
	
	function logout() {
		unset($_SESSION["uid"]);
		$this->success("退出登录！",U('App/Member/login'));
		exit;
	}

	function register() {
		if ( IS_POST ) {
			if (!$_POST['login']) {
				$this->error("请输入用户名");
				exit;
			}else {
				$map['login'] = $_POST['login'];
				$check = M("User")->where($map)->find();
				if (!empty($check)) {
					$this->error("该用户名已存在！请重新输入");
					exit;
				}
			}
			if (!$_POST['password']) {
				$this->error("请输入登陆密码");
				exit;
			}
			$_POST['uid'] = rand();
			$_POST['password'] = md5($_POST['password']);
			$id = M("User")->add($_POST);
			$new_user_id = $id;
			$user = array();
			$user['uid'] = $id;
			$wx_info = json_encode(array('nickname'=>$map['login'],'subscribe_time'=>time()));
			$user['wx_info'] = $wx_info;
			
			if($_GET['mid']){
				$m = M ( "User" );
				include dirname(dirname(dirname(dirname(dirname(__FILE__))))).'/Public/Conf/button_config.php'; 
				$where = array();
				$where["id"] = (int)$_GET['mid'];
				$results = $m->where($where)->find ();
				
				if(!empty($results['id']))
				{
					import ( 'Wechat', APP_PATH . 'Common/Wechat', '.class.php' );
                    $config = M ( "Wxconfig" )->where ( array (
                        "id" => "1" 
                    ) )->find ();
			
                    $options = array (
                        'token' => $config ["token"], // 填写你设定的key
                        'encodingaeskey' => $config ["encodingaeskey"], // 填写加密用的EncodingAESKey
                        'appid' => $config ["appid"], // 填写高级调用功能的app id
                        'appsecret' => $config ["appsecret"], // 填写高级调用功能的密钥
                        'partnerid' => $config ["partnerid"], // 财付通商户身份标识
                        'partnerkey' => $config ["partnerkey"], // 财付通商户权限密钥Key
                        'paysignkey' => $config ["paysignkey"]  // 商户签名密钥Key
					);
					$weObj = new Wechat ( $options );
				
					$user ["l_id"] = $results['id'];
					
					//增加分销人
					$a_info = array();
					$a_info['id'] = $results['id'];
					$a_info['a_cnt'] = $results['a_cnt']+1;
					$user_id = M ( "User" )->save ( $a_info );
					
					if(strlen($results['uid'])>10)
					{
						$data = array();
						$data['touser'] = $results['uid'];
						$data['msgtype'] = 'text';
						$data['text']['content'] = '【'.$map[login].'】通过分享链接，成为您的'.$message_name.'家族成员！';
						$weObj->sendCustomMessage($data);
					}
					
					if($results['l_id'])//b jibie
					{
						$where = array();
						$where["id"] = $results['l_id'];
						$b_results = $m->where($where)->find ();
						
						if(!empty($b_results))
						{
							$b_info = array();
							$b_info['id'] = $b_results['id'];
							$b_info['b_cnt'] = $b_results['b_cnt']+1;
							$user_id = M ( "User" )->save ( $b_info );
							
							$user["l_b"] = $b_results['id'];
							
							if(strlen($b_results['uid'])>10)
							{
								$data = array();
								$data['touser'] = $b_results["uid"];
								$data['msgtype'] = 'text';
								$data['text']['content'] = '【'.$map[login].'】通过分享链接，成为您的'.$message_name.'家族成员！';
								$weObj->sendCustomMessage($data);
							}
							
							if($b_results['l_id'])//c jibie
							{
								$where = array();
								$where["id"] = $b_results['l_id'];
								$c_results = $m->where($where)->find ();
								
								if(!empty($c_results))
								{
									$c_info = array();
									$c_info['id'] = $c_results['id'];
									$c_info['c_cnt'] = $c_results['c_cnt']+1;
									$user_id = M ( "User" )->save ( $c_info );
									
									$user["l_c"] = $c_results['id'];
									
									if(strlen($c_results['uid'])>10)
									{
										$data = array();
										$data['touser'] = $c_results["uid"];
										$data['msgtype'] = 'text';
										$data['text']['content'] = '【'.$map[login].'】通过分享链接，成为您的'.$message_name.'家族成员！';
										$weObj->sendCustomMessage($data);
									}
								}
							}
						}
					}
				}
			}
			
			M("User")->where($map)->save($user);
			$_SESSION["uid"] = $new_user_id;
			$this->success("登陆成功！",U('App/Member/index',array("uid"=>$id)));exit;
			
		}
		$this->display("./default/Index/member_register");
	}

    public function get_l_info($l_id)
	{
		$result_l = M("User")->where(array('id'=>$l_id))->find();
		if(!empty($result_l))
		{
			$wx_info = json_decode($result_l['wx_info'],true);
			$l_name = $wx_info['nickname'];
			$img = !empty($wx_info['headimgurl'])?$wx_info['headimgurl']:'../Public/Static/images/defult.jpg';
			$headimgurls = $img;
		}
		
		include dirname(dirname(dirname(dirname(dirname(__FILE__))))).'/Public/Conf/button_config.php'; 
		
		$l_name = !empty($l_name) ? $l_name : ''.$message_name.'';
		$headimgurl = !empty($headimgurls) ? $headimgurls : $headimgurl;
		
		$headimgurl = !empty($headimgurl)?$headimgurl:'../Public/Static/images/defult.jpg';
		
		$info['headimgurl'] = $headimgurl;
		$info['nickname'] = $l_name;
		
		return $info;
	}
	
}