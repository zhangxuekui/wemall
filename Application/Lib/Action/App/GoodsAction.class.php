<?php

class GoodsAction extends Action
{

    public function init($type = 'index')
    {
        $agent = $_SERVER['HTTP_USER_AGENT'];
        if (strpos($agent, "icroMessenger") && ((!isset($_GET['uid']) && empty($_SESSION["uid"])) || isset($_GET['refresh']))) {
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
            M('statistics')->add(array('goods_id' =>$goods_id,'uid'=>$uid,'view_time'=>time()));

            $data['action_name'] = ACTION_NAME;
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
}