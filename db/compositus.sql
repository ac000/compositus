-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 29, 2012 at 02:34 PM
-- Server version: 5.0.95
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `compositus`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE IF NOT EXISTS `activations` (
  `user` varchar(255) NOT NULL,
  `akey` varchar(64) NOT NULL,
  `expires` int(11) NOT NULL,
  UNIQUE KEY `user` (`user`),
  KEY `akey` (`akey`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

CREATE TABLE IF NOT EXISTS `audit` (
  `timestamp` decimal(16,6) unsigned NOT NULL,
  `sid` bigint(11) unsigned NOT NULL,
  `aid` bigint(11) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `ip` varchar(39) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `referer` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `success` tinyint(1) unsigned NOT NULL,
  `msg` varchar(255) NOT NULL,
  KEY `sid` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
  `upload_id` int(10) unsigned NOT NULL auto_increment,
  `date` date NOT NULL,
  `inv_no` varchar(64) NOT NULL,
  `supp_name` varchar(255) NOT NULL,
  `line_no` int(10) unsigned NOT NULL,
  `prod_code` varchar(64) NOT NULL,
  `prod_desc` varchar(255) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `unit cost` decimal(12,4) unsigned NOT NULL,
  `line_total` decimal(14,4) unsigned NOT NULL,
  `line_vat_rate` decimal(7,4) unsigned NOT NULL,
  `line_vat_amount` decimal(12,4) unsigned NOT NULL,
  `freight_amount` decimal(12,4) unsigned NOT NULL,
  `freight_vat_rate` decimal(7,4) unsigned NOT NULL,
  `freight_vat_amount` decimal(12,4) unsigned NOT NULL,
  `total_net` decimal(14,4) unsigned NOT NULL,
  `total_vat` decimal(12,4) unsigned NOT NULL,
  `total_gross` decimal(14,4) unsigned NOT NULL,
  PRIMARY KEY  (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
  `uid` int(10) unsigned NOT NULL,
  `status` char(1) NOT NULL,
  `submitted` int(10) unsigned NOT NULL,
  `started` int(10) unsigned NOT NULL,
  `completed` int(10) unsigned NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `upload_id` int(10) unsigned NOT NULL auto_increment,
  `date` date NOT NULL,
  `po_no` varchar(64) NOT NULL,
  `ven_name` varchar(255) NOT NULL,
  `ven_code` varchar(64) NOT NULL,
  `buyer` varchar(255) NOT NULL,
  `line_no` int(10) unsigned NOT NULL,
  `prod_code` varchar(64) NOT NULL,
  `prod_desc` varchar(255) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `unit cost` decimal(12,4) unsigned NOT NULL,
  `line_total` decimal(14,4) unsigned NOT NULL,
  `line_vat_rate` decimal(7,4) unsigned NOT NULL,
  `line_vat_amount` decimal(12,4) unsigned NOT NULL,
  `line_cc` varchar(64) NOT NULL,
  `freight_amount` decimal(12,4) unsigned NOT NULL,
  `freight_vat_rate` decimal(7,4) unsigned NOT NULL,
  `freight_vat_amount` decimal(12,4) unsigned NOT NULL,
  `total_net` decimal(14,4) unsigned NOT NULL,
  `total_vat` decimal(12,4) unsigned NOT NULL,
  `total_gross` decimal(14,4) unsigned NOT NULL,
  `gl_code` varchar(64) NOT NULL,
  PRIMARY KEY  (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `passwd`
--

CREATE TABLE IF NOT EXISTS `passwd` (
  `uid` int(10) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(106) NOT NULL,
  `name` varchar(255) NOT NULL,
  `capabilities` smallint(5) unsigned NOT NULL default '0',
  `enabled` tinyint(1) NOT NULL default '0',
  `activated` tinyint(1) NOT NULL default '0',
  `d_reason` varchar(255) NOT NULL,
  UNIQUE KEY `uid` (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE IF NOT EXISTS `uploads` (
  `upload_id` int(11) NOT NULL auto_increment,
  `type` char(1) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `d_name` varchar(255) NOT NULL,
  `sha256` varchar(64) NOT NULL,
  `timestamp` decimal(16,6) unsigned NOT NULL,
  PRIMARY KEY  (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `utmp`
--

CREATE TABLE IF NOT EXISTS `utmp` (
  `login_at` decimal(16,6) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `ip` varchar(39) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `sid` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `sid` (`sid`),
  KEY `uid` (`uid`),
  KEY `login_at` (`login_at`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
