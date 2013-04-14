-- phpMyAdmin SQL Dump
-- version 3.3.8.1
-- http://www.phpmyadmin.net
--
-- 主机: w.rdc.sae.sina.com.cn:3307
-- 生成日期: 2013 年 04 月 14 日 20:02
-- 服务器版本: 5.5.23
-- PHP 版本: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `app_wb2email`
--

-- --------------------------------------------------------

--
-- 表的结构 `useremail`
--

CREATE TABLE IF NOT EXISTS `useremail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `lasttime` int(11) NOT NULL DEFAULT '0' COMMENT '最近一次收藏的时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_email` (`userid`,`email`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `wbid` bigint(11) NOT NULL,
  `nickname` varchar(200) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `wbid` (`wbid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- 表的结构 `wbtoken`
--

CREATE TABLE IF NOT EXISTS `wbtoken` (
  `userid` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
