<?php

//奖项数据
$prize_arr=array(
	'youpan'=>array('angle'=>array('16-40','196-220'),'prize'=>'U盘1个','v'=>10),

	'money_2000'=>array('angle'=>array('46-74','170-194'),'prize'=>'2000元代金卷','v'=>5),

	'chong_10'=>array('angle'=>array('80-104','226-250'),'prize'=>'10元充值卡','v'=>10),

	'money_1000'=>array('angle'=>array('110-134','256-284'),'prize'=>'1000元代金卷','v'=>15),

	'flower'=>array('angle'=>array('144-164','286-306'),'prize'=>'鲜花1朵，继续努力','v'=>45),

	'chong_50'=>array('angle'=>array('316-340'),'prize'=>'50元充值卡','v'=>5),

	'book'=>array('angle'=>array('0-10','346-359'),'prize'=>'书1本','v'=>10),
	
);

//根据奖项数据获得具体奖项
function getPrize($prize_arr) {
	$proSum=0;
	foreach($prize_arr as $v){
		$proSum+=$v['v'];
	}
	foreach($prize_arr as $k=>$v){
		$randNum=mt_rand(1,$proSum);//随机数
		if($randNum<=$v['v']) {
			return $v;
		}else{
			$proSum-=$v['v'];
		}
	}
	
}

//获得旋转信息
function getRotate($prize_arr) {
	$data=array();
	$option=$_GET;
	foreach($prize_arr as $k=>&$v) {
		$v['v']=$option[$k];
	}



	$prize=getPrize($prize_arr);

	
	
	$angle=$prize['angle'];
	shuffle($angle);//打乱

	$angle=$angle[0];
	
	$angle_arr=explode('-',$angle);

	$min=$angle_arr[0];
	$max=$angle_arr[1];
	$angle=mt_rand($min,$max);
	$data['angle']=$angle;
	$data['message']=$prize['prize'];
	$data['duration']=mt_rand(2,5)*1000;
	$data['n']=mt_rand(3,6);
	echo json_encode($data);
	//echo json_encode($option);
	
}

getRotate($prize_arr);