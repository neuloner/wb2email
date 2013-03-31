<?php
session_start();

include_once( 'config.php' );
include_once( 'saetv2.ex.class.php' );
require_once( 'init.php' );
$o = new SaeTOAuthV2( WB_AKEY , WB_SKEY );
global $db;
$db = new Db();
if (isset($_REQUEST['code'])) {
	$keys = array();
	$keys['code'] = $_REQUEST['code'];
	$keys['redirect_uri'] = WB_CALLBACK_URL;
	try {
		$token = $o->getAccessToken( 'code', $keys ) ;
	} catch (OAuthException $e) {
	}
}
$token = $_SESSION['token'];

if (isset($token)) {
    $tplData['tokenSuccess'] = 1;
	$_SESSION['token'] = $token;
	setcookie( 'weibojs_'.$o->client_id, http_build_query($token) );
    $c = new SaeTClientV2( WB_AKEY , WB_SKEY , $token['access_token'] );
    $uid_get = $c->get_uid();
    $uid = $uid_get['uid'];
    $userInfo = $c->show_user_by_id($uid);
    $tplData['screenName'] = $userInfo['screen_name'];
    $userId = getUserId($uid);
    if(empty($userId))
        $tplData['hasRegister'] = 0;
    else {
        $tplData['hasRegister'] = 1;
        $userId = $userId['userId'];
        $userEmails = getUserEmail($userId);
        $tplData['userEmails'] = $userEmails; 
    }
} else {
    $tplData['tokenSuccess'] = 0;   
}
$smarty->assign($tplData);
$smarty->display('index.tpl');

function getUserId($uid) {
    global $db;
    $sql = "select userid from users where wbid=$uid"; 
    $res = $db->query($sql);
    $row = mysqli_fetch_row($res);
    if(empty($row))
        return array();
    else return array('userId' => $row[0]);
}

function getUserEmail($userId) {
    $arrEmail = array();
    global $db;
    $sql = "select email,lasttime from useremail where userid=$userId order by id desc";
    $res = $db->query($sql);
    while($row = mysqli_fetch_row($res)) {
        if($row[1] > 0) {
            $lastTime = date("Y-m-d h:i:s A",$row[1]); 
        } else {
            $lastTime = '';
        }
        $arrEmail[] = array(
            'email' => $row[0],
            'lastTime' => $lastTime,
        );
    }
    return $arrEmail;
}
