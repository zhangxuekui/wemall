<?php if (!defined('THINK_PATH')) exit();?><html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><?php echo ($info["name"]); ?></title>
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="../Public/Static/css/foods.css?t=333" rel="stylesheet"
              type="text/css">
        <script type="text/javascript" src="../Public/Static/js/jquery.min.js"></script>
        <script type="text/javascript">
            var appurl = '__APP__';
            var rooturl = '__ROOT__';
        </script>
    </head>
    <body class="sanckbg mode_webapp">
        <div id="menu-container" style="display: block;">
            <section class="menu" style="padding-bottom: 0px;">
                <section class="list listimg">
                    <dl>
                        <!--dt>菜单</dt-->
                        <div class="ccbg">
                            <?php if(is_array($goods)): $i = 0; $__LIST__ = $goods;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$goodsvo): $mod = ($i % 2 );++$i;?><dd menu="<?php echo ($goodsvo["menu_id"]); ?>" style="display:block;">
                                    <div class="tupian">
                                        <img src="__PUBLIC__/Uploads/<?php echo ($goodsvo["image"]); ?>"
                                             onclick="showDetail('<?php echo ($goodsvo["id"]); ?>');"> <a
                                             href="javascript:doProduct('<?php echo ($goodsvo["id"]); ?>','<?php echo ($goodsvo["name"]); ?>','<?php echo ($goodsvo["price"]); ?>');" class="add"><p
                                                class="dish2"><?php echo ($goodsvo["name"]); ?></p>
                                            <p class="price2"><?php echo ($goodsvo["price"]); ?>元/份</p>
                                            <p>
                                                <del><?php echo ($goodsvo["old_price"]); ?>元/份</del>
                                            </p></a>
                                    </div>
                                    <a href="javascript:doProduct('<?php echo ($goodsvo["id"]); ?>','<?php echo ($goodsvo["name"]); ?>','<?php echo ($goodsvo["price"]); ?>');" id="<?php echo ($goodsvo["id"]); ?>" class="reduce" style="display: block;"><b class="ico_reduce">减一份</b></a>
                                </dd>

                                <script>
                                    window.onload = function () {
                                        showDetail('<?php echo ($goodsvo["id"]); ?>');
                                        doProduct('<?php echo ($goodsvo["id"]); ?>', '<?php echo ($goodsvo["name"]); ?>', '<?php echo ($goodsvo["price"]); ?>');
                                    }
                                </script><?php endforeach; endif; else: echo "" ;endif; ?>

                        </div>
                    </dl>
                </section>


                <div id="mcover" onClick="document.getElementById('mcover').style.display = '';">
                    <div id="Popup" style="display: block;">
                        <div class="imgPopup">
                            <!--img id="detailpic" src=""-->
                            <!--h3 id="detailtitle"></h3-->
                            <p class="jianjie" id="detailinfo"></p>
                        </div>
                    </div>
                    <a class="close" onClick="document.getElementById('mcover').style.display = '';" style="display: none;">X</a>
                </div>

            </section>
        </div>

        <style>
            .button_img{margin-left:10px;height:40px;float:left;margin-top:3px;}
            .button_buy{margin-right:10px;float:right;}
            .button_buy a p{height: 3em;overflow: hidden;}

        </style>

        <div class="footermenu">
            <ul>
                <li ><a href="./index.php?g=App&m=Index&a=index_info" class="active"> <img src="../Public/Static/images/21.png">
                        <p>首页</p>
                    </a></li>
                <li id="user"><a href="./index.php?g=App&m=Index&a=member&page_type=order&tid=1"> <img src="../Public/Static/images/22.png">
                        <p>我的订单</p>
                    </a></li>
                <li id="member"><a href="./index.php?g=App&m=Index&a=member&tid=2"> <img src="../Public/Static/images/23.png">
                        <p>个人中心</p>
                    </a></li>
                <li id="ticket" style="display:none"><a href="./index.php?g=App&m=Index&a=member&tid=3"> <img src="../Public/Static/images/24.png">
                        <p>活动中心</p>
                    </a></li>
                <li id="tx"><a href="./index.php?g=App&m=Lottery&a=index"> <img src="../Public/Static/images/24.png">
                        <p>活动中心</p>
                    </a></li>
            </ul>
        </div>


        <div class="footermenu" style="display:none">
            <ul>
                <?php if(!empty($users)) { $wx_info = json_decode($users['wx_info'],true); if($users['member']==1) { $info = '<span style="font-size:12px;">您已经是族长</span>'; } else { $info = '<span style="font-size:12px;">您还不是族长，请购买成为族长</span>'; } $img = !empty($wx_info['headimgurl'])?$wx_info['headimgurl']:'../Public/Static/images/defult.jpg'; echo "<li><div><div><img  class='button_img'  src='".$img."'></div><div style='margin-top:5px;margin-left:10px;line-height: 1em;color:#fff;float:left'><span style='color:#B3EE3A;font-size:12px;'>".$wx_info['nickname']."</span><br/>".$info."</div></div><a class='button_buy' href='javascript:go_buy();'><p style='line-height: 3em;'><span style='padding:5px;border:1px solid #B3EE3A;'><strong>立即购买</strong></span></p></a></li>"; } else { echo "<li><p  class='button_img' style='line-height: 3em; color:#fff;width:100%;text-align:center; margin:0 auto;'>立即关注，组建<?php echo ($message_name); ?>家族</p></li><li class='button_buy'><a href='javascript:go_guanzhu();'><p style='line-height: 3em;'><span style='padding:5px;border:1px solid #B3EE3A;'><strong>立即关注</strong></span></p></a></li>"; } ?>
            </ul>
        </div>
        <script>
            document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
                WeixinJSBridge.call('showOptionMenu');
            });

            function go_buy() {
                location.href = './index.php?g=App&m=Index&a=index';
            }
            ;
            function go_guanzhu() {
                location.href = '<?php echo ($link_config); ?>';
            }
            ;

            function showDetail(id) {
                $.ajax({
                    type: 'post',
                    url: appurl + '/App/Index/fetchgooddetail',
                    data: {
                        id: id,
                    },
                    success: function (response, status, xhr) {
                        $('#mcover').show();
                        var json = eval(response);
                        $('#detailpic').attr('src', rooturl + '/Public/Uploads/' + json.image);
                        $('#detailtitle').html(json.title);
                        $('#detailinfo').html(json.detail);

                        $('#detailinfo img').click(function () {
                            go_buy();
                        });
                    }
                });
            }

            function doProduct(id, name, price) {
                var bgcolor = $('#' + id).children().css('background-color').colorHex().toUpperCase();
                if (bgcolor == '#FFFFFF') {
                    $('#' + id).children().css('background-color', '#D00A0A');

                    var cartMenuN = parseFloat($('#cartN2').html()) + 1;
                    $('#totalNum').html(cartMenuN);
                    $('#cartN2').html(cartMenuN);

                    var totalPrice = parseFloat($('#totalPrice').html()) + parseFloat(price);
                    $('#totalPrice').html(totalPrice.toFixed(2));

                    var wemallId = 'wemall_' + id;
                    var html = '<li class="ccbg2" id="' + wemallId + '"><div class="orderdish"><span name="title">' + name + '</span><span class="price" id="v_0">' + price + '</span><span class="price">元</span></div><div class="orderchange"><a href=javascript:addProductN("' + wemallId + '_' + price + '") class="increase"><b class="ico_increase">加一份</b></a><span class="count" id="num_1_499">1</span><a href=javascript:reduceProductN("' + wemallId + '_' + price + '") class="reduce"><b class="ico_reduce">减一份</b></a></div></li>';
                    $('#ullist').append(html);
                } else {
                    $('#' + id).children().css('background-color', '');

                    var cartMenuN = parseFloat($('#cartN2').html()) - 1;
                    $('#totalNum').html(cartMenuN);
                    $('#cartN2').html(cartMenuN);

                    var totalPrice = parseFloat($('#totalPrice').html()) - parseFloat(price);
                    $('#totalPrice').html(totalPrice.toFixed(2));

                    var wemallId = 'wemall_' + id;
                    $('#' + wemallId).remove();
                }
            }
            String.prototype.colorHex = function () {
                var that = this;
                if (/^(rgb|RGB)/.test(that)) {
                    var aColor = that.replace(/(?:\(|\)|rgb|RGB)*/g, "").split(",");
                    var strHex = "#";
                    for (var i = 0; i < aColor.length; i++) {
                        var hex = Number(aColor[i]).toString(16);
                        if (hex === "0") {
                            hex += hex;
                        }
                        strHex += hex;
                    }
                    if (strHex.length !== 7) {
                        strHex = that;
                    }
                    return strHex;
                } else if (reg.test(that)) {
                    var aNum = that.replace(/#/, "").split("");
                    if (aNum.length === 6) {
                        return that;
                    } else if (aNum.length === 3) {
                        var numHex = "#";
                        for (var i = 0; i < aNum.length; i += 1) {
                            numHex += (aNum[i] + aNum[i]);
                        }
                        return numHex;
                    }
                } else {
                    return that;
                }
            };
        </script>
    </body>
</html>