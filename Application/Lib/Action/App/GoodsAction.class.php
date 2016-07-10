<?php

class GoodsAction extends Action
{

    public function init($type = 'index')
    {
        $agent = $_SERVER['HTTP_USER_AGENT'];
        if (is_weixin() && ((!isset($_GET['uid']) && empty($_SESSION["uid"])) || isset($_GET['refresh']))) {
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
        //设置推广人的id
        if(!empty($_GET['source_id'])) {
            setcookie('source_name',$_GET['source_id'],time()+3600*24*7);
        }
        if (!empty($_SESSION["uid"]) && empty($_GET['uid'])) {
            $_GET['uid'] = $_SESSION["uid"];
        }

        if (empty($_GET['uid'])) {
            $url = 'http://' . $_SERVER ['SERVER_NAME'] . U('App/Member/login');
            header("Location: $url");
            exit();
        }
    }

    function goodsdetails()
    {
        $this->init();
        $info = R("Api/Api/gettheme");
        C("DEFAULT_THEME", $info ["theme"]);
        $goods_id = $this->_param('goods_id');
        $goodsresult = M('good')->where(array('id' => $goods_id))->find();
        if ($goods_id && $goodsresult) {

            $uid = $_GET ["uid"];
            $usersresult = R("Api/Api/getuser", array(
                $uid
            ));
            if (empty($usersresult)) {
                $usersresult = M("user")->where(array("uid" => $_GET['uid']))->find();
            }
            //查询是否第一次购买
            $zhekou = 0;
            if (file_exists('./Public/Conf/zhekou.php')) {
                require './Public/Conf/zhekou.php';
            }

            if ($zhekou > 0) {
                $order = $result = M("Order")->where(array(
                    "user_id" => $usersresult["id"],
                    "pay_status" => 1
                ))->find();
                if (!empty($order)) {
                    foreach ($goodsresult as $key => $info) {
                        $goodsresult[$key]['price'] = $info['price'] * ($zhekou / 100);
                    }
                }
            }
            M('good')->where('id=' .$goods_id)->setInc('viewcount',1);
            if(!empty($_COOKIE['source_name'])) {
                $source = array('source_id'=>$_COOKIE['source_name']);
            }
            $staticstics = array('goods_id' =>$goods_id,'uid'=>$uid,'view_time'=>time());
            M('statistics')->add(array_merge($source,$staticstics));

            $goods_qrcode = '/Public/QRcode/Good/'.md5($goodsresult['id'].$_SESSION['uid']).'.png';
            //生成分享商品的二维码
            include APP_PATH."phpqrcode/qrlib.php";
            if(!file_exists(APP_SITE.$goods_qrcode)) {
                QRcode::png('http://'.$_SERVER['SERVER_NAME'].U('App/Goods/goodsdetails',array('goods_id'=>$goodsresult['id'],'source_id'=>$_SESSION['uid'])), APP_SITE.$goods_qrcode, 'L',4, 10);
            }

            //如果有优惠券则产生二维码地址
            $coupons_qrcode = '/Public/QRcode/coupons/'.md5($goodsresult['couponslink']).'.png';
            if(!empty($goodsresult['couponslink'])) {
                if(!file_exists($coupons_qrcode)) {
                    QRcode::png($goodsresult['couponslink'], APP_SITE.$coupons_qrcode, 'L',4, 10);                    
                }
                $this->assign('coupons_qrcode',$coupons_qrcode);
            }

            
            $data['action_name'] = ACTION_NAME;
            $this->assign('qrcode',$goods_qrcode);
            $this->assign('data',$data);
            $this->assign("goods", $goodsresult);
            $this->display();
        } else {
            echo '商品参数有误';
        }
    }

    function cate() {
        $this->init();
        $info = R("Api/Api/gettheme");
        C("DEFAULT_THEME", $info ["theme"]);

        $limit = 8;
        $cate_id = $this->_get('cate_id','htmlspecialchars,strip_tags');
        $p = (int)$this->_get('p') ? $this->_get('p') : 1;

        $data['menus'] = M('menu')->order('recommend desc, sort')->select();
        if(!$cate_id && !empty($data['menus'])) {
            $cate_id = $data['menus'][0]['id'];
        }

        $keywords = trim($this->_get('keywords'));
        if(!empty($keywords)) {
            $where['name'] = array('like','%'.$keywords.'%');
        }
        $where['menu_id'] = $cate_id;

        //获取商品列表

        $data['goods_list'] = M('good')->where($where)->order('sort desc')->limit(($p-1)*$limit,$limit)->select();
        import('ORG.Util.Page');// 导入分页类
        $data['goods_count'] = M('good')->where($where)->count();

        $page_class = new Page($data['goods_count'],1);// 实例化分页类 传入总记录数和每页显示的记录数
        $show = $page_class->show();// 分页显示输出

        
        $data['action_name'] = ACTION_NAME;

        $this->assign('page',$show);// 赋值分页输出
        $this->assign('data',$data);
        $this->assign('keywords',$keywords);
        $this->assign('cate_id',$cate_id);
        $this->display();
    }


    function active() {
        $this->init();
        $info = R("Api/Api/gettheme");
        C("DEFAULT_THEME", $info ["theme"]);
        $limit = 8;
        $recommend_id = $this->_get('recommend_id','htmlspecialchars,strip_tags');
        $p = (int)$this->_get('p') ? $this->_get('p') : 1;

        if($recommend_id) {
            $where['recommend'] = $recommend_id;            
        }

        //获取商品列表

        $data['goods_list'] = M('good')->where($where)->order('sort desc')->limit(($p-1)*$limit,$limit)->select();

        import('ORG.Util.Page');// 导入分页类
        $data['goods_count'] = M('good')->where($where)->count();

        $page_class = new Page($data['goods_count'],1);// 实例化分页类 传入总记录数和每页显示的记录数
        $show = $page_class->show();// 分页显示输出

        

        $this->assign('page',$show);// 赋值分页输出
        $this->assign('keywords',$keywords);
        $this->assign('cate_id',$cate_id);
        
        $data['action_name'] = ACTION_NAME;
        $this->assign('data',$data);
        $this->display();
    }

    
    //hot热卖专区

    function hot() {
        $this->init();
		if ($_GET ['uid']) {
			
			$info = R ( "Api/Api/gettheme" );
			C ( "DEFAULT_THEME", $info ["theme"] );
			$this->assign ( "info", $info );

			$menuresult = R ( "Api/Api/getmenu" );
			$this->assign ( "menu", $menuresult );


            $limit = 8;
            $p = (int)$this->_get('p') ? $this->_get('p') : 1;

            $where['recommend'] = 3;

            //获取商品列表

            $data['goods'] = M('good')->where($where)->order('sort desc')->limit(($p-1)*$limit,$limit)->select();

            import('ORG.Util.Page');// 导入分页类
            $data['goods_count'] = M('good')->where($where)->count();

            $page_class = new Page($data['goods_count'],1);// 实例化分页类 传入总记录数和每页显示的记录数
            $show = $page_class->show();// 分页显示输出

        

            $this->assign('page',$show);// 赋值分页输出
        
            $data['action_name'] = ACTION_NAME;
            
            include dirname(dirname(dirname(dirname(dirname(__FILE__))))).'/Public/Conf/button_config.php'; 
			$this->assign ( "config_good_pic", $config_good_pic );
            $this->assign ( "data", $data );
			$this->display ();
        }
    }
}