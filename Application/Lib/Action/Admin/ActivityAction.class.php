<?php
class ActivityAction extends PublicAction {
	function _initialize() {
		parent::_initialize ();
	}
    function index() {
        import ( 'ORG.Util.Page' );
        $m = M ( "act" );
		
		$count = $m->count (); // 查询满足要求的总记录数
		$Page = new Page ( $count, 12 ); // 实例化分页类 传入总记录数和每页显示的记录数
		$Page -> setConfig('header', '条记录');
        $Page -> setConfig('theme', '<li><a>%totalRow% %header%</a></li> <li>%upPage%</li> <li>%downPage%</li> <li>%first%</li>  <li>%prePage%</li>  <li>%linkPage%</li>  <li>%nextPage%</li> <li>%end%</li> ');//(对thinkphp自带分页的格式进行自定义)
		$show = $Page->show (); // 分页显示输出
		
		$result = $m->limit ( $Page->firstRow . ',' . $Page->listRows )->select ();
        $this->assign('result',$result);
        $this->display();
    }

    //添加活动
    function addact() {
        $this->display();
    }
}