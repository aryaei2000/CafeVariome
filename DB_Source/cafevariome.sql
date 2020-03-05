-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 03, 2020 at 11:06 AM
-- Server version: 5.7.29-0ubuntu0.18.04.1
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafevariome`
--

-- --------------------------------------------------------

--
-- Table structure for table `eavs`
--

CREATE TABLE `eavs` (
  `id` int(15) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `source` varchar(50) NOT NULL,
  `fileName` mediumint(8) UNSIGNED NOT NULL,
  `subject_id` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `attribute` varchar(50) NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  `elastic` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `local_phenotypes_lookup`
--

CREATE TABLE `local_phenotypes_lookup` (
  `lookup_id` int(11) NOT NULL,
  `network_key` varchar(32) NOT NULL,
  `phenotype_attribute` varchar(128) NOT NULL,
  `phenotype_values` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `MenuItems`
--

CREATE TABLE `MenuItems` (
  `id` int(11) NOT NULL,
  `Position` int(11) NOT NULL,
  `Title` varchar(64) NOT NULL,
  `Url` varchar(256) DEFAULT NULL,
  `Page_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `networks`
--

CREATE TABLE `networks` (
  `network_key` int(11) NOT NULL,
  `network_name` text NOT NULL,
  `network_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `network_groups`
--

CREATE TABLE `network_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `network_key` int(11) NOT NULL,
  `group_type` varchar(50) NOT NULL,
  `url` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `network_groups_sources`
--

CREATE TABLE `network_groups_sources` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `source_id` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  `installation_key` varchar(100) NOT NULL,
  `network_key` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `network_requests`
--

CREATE TABLE `network_requests` (
  `id` int(10) NOT NULL,
  `network_key` int(11) NOT NULL,
  `installation_key` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `justification` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `ip` text NOT NULL,
  `token` varchar(32) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Pages`
--

CREATE TABLE `Pages` (
  `id` int(11) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Content` text NOT NULL,
  `Author` int(11) UNSIGNED NOT NULL,
  `Active` bit(1) NOT NULL,
  `Removable` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Pages`
--

INSERT INTO `Pages` (`id`, `Title`, `Content`, `Author`, `Active`, `Removable`) VALUES
(1, 'Home', '<div class=\"col-container\">\r\n<div class=\"col\">\r\n<table style=\"border-collapse: collapse; width: 100%;\" border=\"0\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 50%;\">\r\n<h3>What is Cafe Variome?</h3>\r\n<p>Cafe Variome is a flexible web-based, data discovery tool that can be quickly installed by any biomedical data owner to enable the &ldquo;existence&rdquo; rather than the &ldquo;substance&rdquo; of the data to be discovered.</p>\r\n<h3>What data is Cafe Variome designed for?</h3>\r\n<p>Cafe Variome has been designed for use with all sensitive biomedical data, whether this be genomic variants or cohort data.</p>\r\n<p>For full details please look at the <a href=\"https://www.cafevariome.org/about#Data\"> data section</a>.</p>\r\n<h3>Who is cafe Variome designed for?</h3>\r\n<p>Cafe Variome is designed for owners of sensitive biomedical data who would like to make their data discoverable but don\'t want to risk exposing the content to the outside world. This is not limited to individual institutions, federated Cafe Variome networks can be setup by consortia.</p>\r\n</td>\r\n<td style=\"width: 50%;\">\r\n<h3>Want to explore a Cafe Variome installation to learn more?</h3>\r\n<a href=\"https://central.cafevariome.org\" target=\"_blank\" rel=\"noopener\"><img class=\"img-responsive center-block\" style=\"max-width: 300px;\" title=\"Cafe Variome Central\" src=\"https://www.cafevariome.org/assets/images/CVLogos/cvc_transparent.png\" alt=\"Cafe Variome Central\" data-toggle=\"tooltip\" /></a>\r\n<h3>Take a look through <a href=\"https://central.cafevariome.org\" target=\"_blank\" rel=\"noopener\"> Cafe Variome Central</a>, our installation created from publicly available datasets.</h3>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\">&nbsp;</td>\r\n<td style=\"width: 50%;\">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n</div>\r\n<div class=\"col text-center\" style=\"align-content: center; vertical-align: middle;\">\r\n<h3>&nbsp;</h3>\r\n</div>\r\n</div>', 1, b'1', b'0'),
(2, 'Contact', '<p>Contact Us</p>', 1, b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_id` int(10) NOT NULL,
  `setting_key` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  `setting_name` varchar(50) DEFAULT NULL,
  `info` text NOT NULL,
  `validation_rules` varchar(100) NOT NULL DEFAULT 'required|xss_clean'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_id`, `setting_key`, `value`, `setting_name`, `info`, `validation_rules`) VALUES
(1, 'site_title', 'Cafe Variome 2', 'Site Title', '', 'required'),
(2, 'site_description', 'Cafe Variome - Description', 'Site Description', '', 'required'),
(3, 'site_author', 'Bioinformatics Research Group - University of Leicester', 'Site Author', '', 'required'),
(4, 'site_keywords', 'healthcare data discovery, bioinformatics', 'Keywords', '', 'required'),
(5, 'email', 'admin@cafevariome.org', 'Administrator Email', '', 'required'),
(6, 'twitter', '', 'Twitter ID', 'If Twitter username is here set then Twitter icon link appears in contact page. Leave blank to disable.', ''),
(7, 'rss', 'local', 'RSS Feed Address', 'Specify a VALID rss feed or to use the internal Cafe Variome news feed then just enter local (on its own)', ''),
(8, 'google_analytics', '', 'Google Analytics ID', 'Google Analytics tracking ID', ''),
(9, 'cvid_prefix', 'vx', NULL, 'Prefix that is prepended to Cafe Variome IDs', 'alpha'),
(10, 'stats', 'on', NULL, '', 'required'),
(11, 'max_variants', '30000', NULL, '', 'required'),
(12, 'feature_table_name', 'variants', NULL, '', 'required'),
(13, 'messaging', 'off', 'Messaging Enabled?', 'Enables/disables the internal messaging system for all users', 'required'),
(14, 'database_structure', 'off', NULL, 'Enables the tab to change database structure in the settings admin interface', 'required'),
(15, 'federated', 'off', 'Federated Install', 'If set to on then the federated API is enables and allows remote discovery queries from other Cafe Variome installs', 'required'),
(16, 'federated_head', 'off', NULL, 'Sets this installation as the main federated head through which installs can be', 'required'),
(17, 'show_orcid_reminder', 'off', NULL, 'Shows a one off message to users on the home page reminding them to link their ORCID to their Cafe Variome account', 'required'),
(18, 'atomserver_enabled', 'off', NULL, '', 'required'),
(19, 'atomserver_user', '', NULL, '', 'required'),
(20, 'atomserver_password', '', NULL, '', 'required'),
(21, 'atomserver_uri', 'http://www.cafevariome.org/atomserver/v1/cafevariome/variants', NULL, '', 'required'),
(22, 'cafevariome_central', 'off', NULL, 'If set to on then this is a Cafe Variome Central installation - additional menus for describing the system will be enabled', 'required'),
(23, 'allow_registrations', 'on', 'Allow User Registration', 'If set to on then users can register on the site, otherwise the signup is hidden', 'required'),
(24, 'variant_count_cutoff', '0', NULL, 'If the number of variants discovered in a source is less than this then the results are hidden and the message in the variant_count_cutoff_message setting is displayed', 'required'),
(25, 'variant_count_cutoff_message', 'Unable to display results for this source, please contact admin@cafevariome.org', NULL, 'Message that is shown when the number of variants in less than that specified in the variant_count_cutoff setting', 'required'),
(26, 'dasigniter', 'on', NULL, 'If set to on then DASIgniter is enabled and variants in sources that are openAccess and linkedAccess will be available via DAS', 'required'),
(27, 'bioportalkey', '', NULL, 'In order to use phenotype ontologies you must sign up for a BioPortal account and supply your API key here. If this is left blank you only be able to use free text for phenotypes. Sign up at http://bioportal.bioontology.org/accounts/new', 'required'),
(28, 'template', 'default', 'Template', 'Specify the name of the css template file (located in views/css/)', 'required'),
(29, 'discovery_requires_login', 'off', 'Authorization Required for Discovery?', 'If set to on then discovery searches cannot be done unless a user is logged in.', 'required'),
(30, 'show_sources_in_discover', 'on', 'Show Sources in Discovery', 'If set to off then only the search box will be shown in the discovery interface (i.e. not the sources to search)', 'required'),
(31, 'use_elasticsearch', 'on', NULL, 'If set to on then elasticsearch will be used instead of the basic search (elasticsearch needs to be running of course)', 'required'),
(32, 'auth_server', ' ', 'Authorization Server URL', 'Central Cafe Variome Auth server url (WARNING: do not change)', 'required'),
(33, 'installation_key', ' ', 'Installation Key', 'Unique key for this installation (WARNING: do not change this value unless you know what you are doing)', 'required'),
(34, 'all_records_require_an_id', 'on', NULL, 'Checks whether all records have a record ID during import (which must be unique)', 'required'),
(35, 'site_requires_login', 'off', NULL, 'If enabled then users will be required to log in to access any part of the site. If not logged in they will be presented with a login form.', 'required'),
(36, 'allow_discovery', 'on', 'Discovery Enabled?', 'If set to on then users can discover on the site, otherwise the discovery is hidden', 'required'),
(37, 'current_font_link', 'Roboto', 'Font Link', 'Imported from preferences.php by Mehdi Mehtarizadeh', 'required'),
(38, 'header_colour_from', '#a5cac2', 'Header Color From', 'Imported from preferences.php by Mehdi Mehtarizadeh', 'required'),
(39, 'header_colour_to', '#afb3ba', 'Header Color To', 'Imported from preferences.php by Mehdi Mehtarizadeh', 'required'),
(40, 'background', 'noisy_grid.png', 'Background Image File', 'Imported from preferences.php by Mehdi Mehtarizadeh', 'required'),
(41, 'logo', 'cafevariome-logo-full.png', 'Logo File', 'Imported from preferences.php by Mehdi Mehtarizadeh', 'required'),
(42, 'font_size', '14px', 'Font Size', 'Imported from preferences.php by Mehdi Mehtarizadeh', 'required'),
(43, 'current_font_name', 'Roboto', 'Font Name', 'Imported from preferences.php by Mehdi Mehtarizadeh', 'required'),
(44, 'id_prefix', 'vx', NULL, 'Imported from preferences.php by Mehdi Mehtarizadeh', 'required'),
(45, 'id_current', '234333355', NULL, 'Imported from preferences.php by Mehdi Mehtarizadeh', 'required'),
(46, 'report_usage', '1', NULL, 'Imported from preferences.php by Mehdi Mehtarizadeh', 'required'),
(47, 'navbar_font_colour', '#eeeeee', 'Navbar Color', 'Imported from preferences.php by Mehdi Mehtarizadeh', 'required'),
(48, 'navbar_font_colour_hover', '#ffffff', 'Navbar Hover Color', 'Imported from preferences.php by Mehdi Mehtarizadeh', 'required'),
(49, 'navbar_selected_tab_colour', '#6c737e', 'Navbar Selected Tab Color', 'Imported from preferences.php by Mehdi Mehtarizadeh', 'required'),
(50, 'key_cloak_uri', ' ', 'Keycloak Server Address', 'URI for keycloak authentication server', 'required'),
(51, 'key_cloak_realm', 'cafe_key', 'Keycloak Realm Name', '', 'required'),
(52, 'key_cloak_client_id', 'my-client', 'Keycloak Client ID', '', 'required'),
(53, 'key_cloak_client_secret', '102759a7-1a70-499b-abf6-c2c11838408b', 'Keycloak Client Secret', '', 'required'),
(54, 'key_cloak_login_uri', ' ', 'Keycloak Login Address', '', 'required'),
(55, 'key_cloak_logout_uri', ' ', 'Keycloak Logout Address', '', 'required'),
(56, 'key_cloak_port', ' ', 'Keycloak Port', '', 'required'),
(57, 'elastic_url', 'http://localhost:9200', 'Elasticsearch Address', 'Elastic search address', 'required'),
(58, 'key_cloak_admin_id', 'f02288f5-1c48-4be0-9868-179028a77f8a', 'Keycloak Admin Id', 'Admin user id within key cloak server', 'required'),
(59, 'key_cloak_admin_username', 'admin', 'Keycloak Admin Username', 'Admin user username within key cloak server', 'required'),
(60, 'key_cloak_admin_password', ' ', 'Keycloak Admin Password', 'Admin user password within key cloak server.', 'required'),
(63, 'neo4j_username', 'neo4j', 'Neo4J Username', '', 'required'),
(62, 'neo4j_port', '7474', 'Neo4J Port', '', 'required'),
(61, 'neo4j_server', 'http://localhost', 'Neo4J Server', '', 'required'),
(64, 'neo4j_password', 'neo4j123', 'Neo4J Password', '', 'required');

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

CREATE TABLE `sources` (
  `source_id` int(11) NOT NULL,
  `owner_name` text NOT NULL,
  `email` text NOT NULL,
  `name` varchar(30) NOT NULL,
  `uri` text NOT NULL,
  `description` text NOT NULL,
  `long_description` text NOT NULL,
  `status` varchar(15) NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT 'mysql',
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `elastic_status` tinyint(1) DEFAULT '0',
  `elastic_lock` tinyint(1) DEFAULT '0',
  `elastic_data` tinyint(1) DEFAULT '0',
  `neo4j_data` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sources_groups`
--

CREATE TABLE `sources_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `source_id` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uploaddatastatus`
--

CREATE TABLE `uploaddatastatus` (
  `FileName` varchar(40) NOT NULL,
  `uploadStart` datetime NOT NULL,
  `uploadEnd` datetime DEFAULT NULL,
  `Status` varchar(20) NOT NULL,
  `elasticStatus` varchar(20) NOT NULL,
  `source_id` int(11) NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `ID` mediumint(8) UNSIGNED NOT NULL,
  `patient` varchar(50) DEFAULT NULL,
  `tissue` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `upload_error`
--

CREATE TABLE `upload_error` (
  `ID` mediumint(8) UNSIGNED NOT NULL,
  `error_id` mediumint(8) UNSIGNED NOT NULL,
  `message` varchar(500) NOT NULL,
  `error_code` int(5) NOT NULL,
  `source_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `upload_jobs`
--

CREATE TABLE `upload_jobs` (
  `ID` int(8) NOT NULL,
  `source_id` int(11) NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `linking_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(50) DEFAULT NULL,
  `remote` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `is_admin`, `token`, `remote`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$12$g2P1T2RBeLrG94gJjdF/H.Lu1b40U5YLe6DHQFQ.pW/O24sjrJ68e', 'admin@cafevariome.org', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1583231932, 1, 'Admin', 'istrator', 'UoL', '+440000000', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(31, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups_networks`
--

CREATE TABLE `users_groups_networks` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  `installation_key` varchar(100) NOT NULL,
  `network_key` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `eavs`
--
ALTER TABLE `eavs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `local_phenotypes_lookup`
--
ALTER TABLE `local_phenotypes_lookup`
  ADD PRIMARY KEY (`lookup_id`),
  ADD KEY `network_key` (`network_key`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MenuItems`
--
ALTER TABLE `MenuItems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Page_FK` (`Page_Id`);

--
-- Indexes for table `networks`
--
ALTER TABLE `networks`
  ADD PRIMARY KEY (`network_key`);

--
-- Indexes for table `network_groups`
--
ALTER TABLE `network_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `network_key` (`network_key`),
  ADD KEY `type` (`group_type`);

--
-- Indexes for table `network_groups_sources`
--
ALTER TABLE `network_groups_sources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `source_id` (`source_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `network_requests`
--
ALTER TABLE `network_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `NetworkRequest_NetworkKey_FK` (`network_key`);

--
-- Indexes for table `Pages`
--
ALTER TABLE `Pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Author_FK` (`Author`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`source_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `status` (`status`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `sources_groups`
--
ALTER TABLE `sources_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `source_id` (`source_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `uploaddatastatus`
--
ALTER TABLE `uploaddatastatus`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `upload_error`
--
ALTER TABLE `upload_error`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `upload_jobs`
--
ALTER TABLE `upload_jobs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `users_groups_networks`
--
ALTER TABLE `users_groups_networks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `source_id` (`user_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `NetworkKey_FK` (`network_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `eavs`
--
ALTER TABLE `eavs`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3707;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `local_phenotypes_lookup`
--
ALTER TABLE `local_phenotypes_lookup`
  MODIFY `lookup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3540;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MenuItems`
--
ALTER TABLE `MenuItems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `network_groups`
--
ALTER TABLE `network_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `network_groups_sources`
--
ALTER TABLE `network_groups_sources`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `network_requests`
--
ALTER TABLE `network_requests`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Pages`
--
ALTER TABLE `Pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `setting_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `sources`
--
ALTER TABLE `sources`
  MODIFY `source_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sources_groups`
--
ALTER TABLE `sources_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `uploaddatastatus`
--
ALTER TABLE `uploaddatastatus`
  MODIFY `ID` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `upload_error`
--
ALTER TABLE `upload_error`
  MODIFY `ID` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `upload_jobs`
--
ALTER TABLE `upload_jobs`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `users_groups_networks`
--
ALTER TABLE `users_groups_networks`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `MenuItems`
--
ALTER TABLE `MenuItems`
  ADD CONSTRAINT `Page_FK` FOREIGN KEY (`Page_Id`) REFERENCES `Pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `network_groups`
--
ALTER TABLE `network_groups`
  ADD CONSTRAINT `NetworkKey_NetworkGroup_FK` FOREIGN KEY (`network_key`) REFERENCES `networks` (`network_key`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `network_requests`
--
ALTER TABLE `network_requests`
  ADD CONSTRAINT `NetworkRequest_NetworkKey_FK` FOREIGN KEY (`network_key`) REFERENCES `networks` (`network_key`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Pages`
--
ALTER TABLE `Pages`
  ADD CONSTRAINT `Author_FK` FOREIGN KEY (`Author`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `users_groups_networks`
--
ALTER TABLE `users_groups_networks`
  ADD CONSTRAINT `NetworkKey_FK` FOREIGN KEY (`network_key`) REFERENCES `networks` (`network_key`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
