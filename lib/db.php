<?php

class Db {
    private $_link=null;

    public function __construct() {
        $link=mysqli_connect(SAE_MYSQL_HOST_M.':'.SAE_MYSQL_PORT,SAE_MYSQL_USER,SAE_MYSQL_PASS,SAE_MYSQL_DB);
        if(!$link) {
            sae_debug("mysql_connect_error".mysqli_error($link));
            return false;
        }
        $this->_link = $link;
        return true;
    }

    public function query($sql) {
        if(!isset($this->_link)) {
            sae_debug("mysql_query_error_no_link");
            return false;
        }
        $res = mysqli_query($this->_link,$sql); 
        if($res === false) {
            sae_debug("mysql_query_error".mysqli_error($this->_link)." $sql"); 
            return false;
        }
        return $res;
    }
}
/* vim: set expandtab ts=4 sw=4 sts=4 tw=100: */
