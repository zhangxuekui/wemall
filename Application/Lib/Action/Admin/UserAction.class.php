<?php

class UserAction extends PublicAction
{
    function _initialize()
    {
        parent::_initialize();
    }

    public function index()
    {
        import('ORG.Util.Page');
        $m = M("User");

        $count = $m->count(); // 查询满足要求的总记录数
        $Page = new Page ($count, 12); // 实例化分页类 传入总记录数和每页显示的记录数
        $Page->setConfig('header', '条记录');
        $Page->setConfig('theme', '<li><a>%totalRow% %header%</a></li> <li>%upPage%</li> <li>%downPage%</li> <li>%first%</li>  <li>%prePage%</li>  <li>%linkPage%</li>  <li>%nextPage%</li> <li>%end%</li> ');//(对thinkphp自带分页的格式进行自定义)
        $show = $Page->show(); // 分页显示输出

        $result = $m->limit($Page->firstRow . ',' . $Page->listRows)->select();

        $this->assign("result", $result);
        $this->assign("page", $show); // 赋值分页输出
        $this->display();
    }

    public function statistics()
    {
        import('ORG.Util.Page');
        $uid = $this->_param('uid');
        $m = new Model();

        $sqlcount = 'select count(1) as c from ' . C('DB_PREFIX')
            . 'statistics statistics left join ' . C('DB_PREFIX')
            . 'good good on statistics.goods_id=good.id where statistics.uid=' . $uid . ' and statistics.goods_id <> 0';

        $count = $m->query($sqlcount); // 查询满足要求的总记录数
        $count = $count[0]['c'];
        $Page = new Page ($count, 12); // 实例化分页类 传入总记录数和每页显示的记录数
        $Page->setConfig('header', '条记录');
        $Page->setConfig('theme', '<li><a>%totalRow% %header%</a></li> <li>%upPage%</li> <li>%downPage%</li> <li>%first%</li>  <li>%prePage%</li>  <li>%linkPage%</li>  <li>%nextPage%</li> <li>%end%</li> ');//(对thinkphp自带分页的格式进行自定义)
        $show = $Page->show(); // 分页显示输出

        $result = array();
        $sql = 'select statistics.*,good.name,good.viewcount,good.price from ' . C('DB_PREFIX')
            . 'statistics statistics left join ' . C('DB_PREFIX')
            . 'good good on statistics.goods_id=good.id where statistics.uid=' . $uid . ' and statistics.goods_id <> 0 order by statistics.view_time  limit ' . $Page->firstRow . ',' . $Page->listRows;
        $result = $m->query($sql);


        $this->assign("result", $result);
        $this->assign("page", $show); // 赋值分页输出
        $this->display();
    }
}