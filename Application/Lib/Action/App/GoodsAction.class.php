<?php

class LotteryAction extends Action
{
    function index()
    {
        $info = R("Api/Api/gettheme");
        C("DEFAULT_THEME", $info ["theme"]);
        $this->display();
    }
}