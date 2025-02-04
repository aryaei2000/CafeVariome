-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 08, 2022 at 04:30 PM
-- Server version: 5.7.38-0ubuntu0.18.04.1
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
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
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `display_name` varchar(200) NOT NULL,
  `source_id` int(11) UNSIGNED NOT NULL,
  `type` tinyint(3) NOT NULL,
  `min` double NOT NULL,
  `max` double NOT NULL,
  `show_in_interface` bit(1) NOT NULL,
  `include_in_interface_index` bit(1) NOT NULL,
  `storage_location` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attributes_groups`
--

CREATE TABLE `attributes_groups` (
  `attribute_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attributes_ontology_prefixes_relationships`
--

CREATE TABLE `attributes_ontology_prefixes_relationships` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `prefix_id` int(11) NOT NULL,
  `relationship_id` int(11) NOT NULL,
  `ontology_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_mappings`
--

CREATE TABLE `attribute_mappings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `attribute_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `credentials`
--

CREATE TABLE `credentials` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `username` text,
  `password` text,
  `hash` varchar(64) NOT NULL,
  `hide_username` bit(1) NOT NULL,
  `removable` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `credentials`
--

INSERT INTO `credentials` (`id`, `name`, `username`, `password`, `hash`, `hide_username`, `removable`) VALUES
(1, 'Leicester KeyCloak Client', 'test_client', 'jZveJcMZsyfvX63Gyx+ArisbxCvh+1MA30PRvW1ih8GapHiMWMKQvi0FAS5pLZCx7BsDaLggopo1abiOaDj7zegu2Z7UpiJFIo3MIEc=', '7fab8bd26ba101c1dbdae766674197e2a424512d8eebcdf12e645dc1f73d6a5c', b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `data_files`
--

CREATE TABLE `data_files` (
  `id` int(11) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `disk_name` varchar(32) NOT NULL,
  `size` int(11) UNSIGNED NOT NULL,
  `upload_date` int(11) NOT NULL,
  `record_count` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `status` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `discovery_groups`
--

CREATE TABLE `discovery_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(512) NOT NULL,
  `network_id` int(11) NOT NULL,
  `policy` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `discovery_group_sources`
--

CREATE TABLE `discovery_group_sources` (
  `discovery_group_id` int(11) UNSIGNED NOT NULL,
  `source_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `discovery_group_users`
--

CREATE TABLE `discovery_group_users` (
  `discovery_group_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `eavs`
--

CREATE TABLE `eavs` (
  `id` int(15) NOT NULL,
  `source_id` int(11) NOT NULL,
  `data_file_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `value_id` int(11) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `indexed` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `source_id` int(11) NOT NULL,
  `display_name` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `networks`
--

CREATE TABLE `networks` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `network_requests`
--

CREATE TABLE `network_requests` (
  `id` int(10) NOT NULL,
  `network_key` int(11) NOT NULL,
  `installation_key` varchar(100) NOT NULL,
  `url` mediumtext NOT NULL,
  `justification` mediumtext NOT NULL,
  `email` varchar(50) NOT NULL,
  `ip` mediumtext NOT NULL,
  `token` varchar(32) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ontologies`
--

CREATE TABLE `ontologies` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text,
  `node_key` varchar(128) NOT NULL,
  `node_type` varchar(128) NOT NULL,
  `key_prefix` varchar(128) DEFAULT NULL,
  `term_name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ontologies`
--

INSERT INTO `ontologies` (`id`, `name`, `description`, `node_key`, `node_type`, `key_prefix`, `term_name`) VALUES
(1, 'Human Phenotype Ontology', 'The Human Phenotype Ontology (HPO) is a formal ontology of human phenotypes. Developed in collaboration with members of the Open Biomedical Ontologies Foundry, HPO currently contains over 13,000 terms and over 156,000 annotations to hereditary diseases. Data from Online Mendelian Inheritance in Man and medical literature were used to generate the terms currently in the HPO. The ontology contains over 50,000 annotations between phenotypes and hereditary disease. ', 'hpoid', 'HPOterm', 'HP:', 'term'),
(2, 'ORPHA Net', 'Orphanet is a unique resource, gathering and improving knowledge on rare diseases so as to improve the diagnosis, care and treatment of patients with rare diseases. Orphanet aims to provide high-quality information on rare diseases, and ensure equal access to knowledge for all stakeholders. Orphanet also maintains the Orphanet rare disease nomenclature (ORPHAcode), essential in improving the visibility of rare diseases in health and research information systems.', 'orphaid', 'ORPHAterm', 'ORPHA:', 'term');

-- --------------------------------------------------------

--
-- Table structure for table `ontology_prefixes`
--

CREATE TABLE `ontology_prefixes` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `ontology_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ontology_prefixes`
--

INSERT INTO `ontology_prefixes` (`id`, `name`, `ontology_id`) VALUES
(1, 'hp:', 1),
(2, 'orpha:', 2),
(3, 'ordo:', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ontology_relationships`
--

CREATE TABLE `ontology_relationships` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ontology_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ontology_relationships`
--

INSERT INTO `ontology_relationships` (`id`, `name`, `ontology_id`) VALUES
(1, 'NOT_PHENOTYPE_OF', 1),
(2, 'PHENOTYPE_OF', 1),
(3, 'PHENOTYPE_OF', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `content` mediumtext NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `active` bit(1) NOT NULL,
  `removable` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `content`, `user_id`, `active`, `removable`) VALUES
(1, 'Home', '<p><span style=\"font-size: 18pt;\">This is a Cafe Variome installation. Cafe Variome is a health data discovery platform. <br /></span></p>\r\n<p><span style=\"font-size: 18pt;\">To find out more about it, visit <a href=\"https://cafevariome.org\">https://cafevariome.org</a></span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: 18pt;\">You can edit the content of this page through the admin dashboard.</span></p>', 1, b'1', b'0'),
(2, 'Contact', '<p>...</p>', 1, b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `pipelines`
--

CREATE TABLE `pipelines` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `subject_id_location` tinyint(3) NOT NULL DEFAULT '0',
  `subject_id_attribute_name` varchar(100) NOT NULL,
  `subject_id_assignment_batch_size` int(11) NOT NULL DEFAULT '1',
  `subject_id_prefix` varchar(16) NOT NULL,
  `expansion_columns` varchar(50) NOT NULL,
  `expansion_policy` tinyint(4) DEFAULT NULL,
  `expansion_attribute_name` varchar(200) DEFAULT NULL,
  `grouping` tinyint(4) NOT NULL DEFAULT '0',
  `group_columns` varchar(200) DEFAULT NULL,
  `dateformat` tinyint(4) DEFAULT NULL,
  `internal_delimiter` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pipelines`
--

INSERT INTO `pipelines` (`id`, `name`, `subject_id_location`, `subject_id_attribute_name`, `subject_id_assignment_batch_size`, `subject_id_prefix`, `expansion_columns`, `expansion_policy`, `expansion_attribute_name`, `grouping`, `group_columns`, `dateformat`, `internal_delimiter`) VALUES
(1, 'csvpipeline', 0, 'subject_id', 1, '', '', NULL, NULL, 0, '', NULL, ',');

-- --------------------------------------------------------

--
-- Table structure for table `proxy_servers`
--

CREATE TABLE `proxy_servers` (
  `id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `credential_id` int(11) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `port` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `address` varchar(512) NOT NULL,
  `removable` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`id`, `name`, `address`, `removable`) VALUES
(1, 'ULEICS-Keycloak', 'https://auth.discoverynexus.org/auth/realms/ERN/', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `info` varchar(1024) NOT NULL,
  `group` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `name`, `info`, `group`) VALUES
(1, 'allow_registrations', 'off', 'Allow User Registration', 'If set to on then users can register on the site, otherwise the signup is hidden', 'authentication'),
(2, 'auth_server', '', 'Authorization Server URL', 'Central Cafe Variome Auth server url (WARNING: do not change)', 'main'),
(3, 'discovery_requires_login', 'off', 'Authorization Required for Discovery?', 'If set to on then discovery searches cannot be done unless a user is logged in.', 'discovery'),
(4, 'elastic_url', 'http://localhost:9200', 'Elasticsearch Address', 'Elastic search address', 'elasticsearch'),
(5, 'email', 'admin@cafevariome.org', 'Administrator Email', 'Email of the person or group of people responsible for the website.', 'main'),
(6, 'gene_autocomplete_url', 'https://autocomplete.cafevariome.org/Gene/query/', 'Gene Auto-complete Endpoint', 'Endpoint that provides auto-complete service for gene lookup ', 'endpoint'),
(7, 'hpo_autocomplete_url', 'https://autocomplete.cafevariome.org/Hpo/query/', 'HPO Auto-complete Endpoint', 'Endpoint that provides auto-complete service for HPO terms lookup ', 'endpoint'),
(8, 'installation_key', '', 'Installation Key', 'Unique key for this installation (WARNING: do not change this value unless you know what you are doing)', 'main'),
(9, 'logo', '', 'Main Logo', 'Main logo that appears on top left side of the public pages. The file must be located in resources/images/logos/', 'main'),
(10, 'neo4j_password', 'neo4j123', 'Neo4J Password', 'Password that is used to communicate with Neo4J REST API.', 'neo4j'),
(11, 'neo4j_port', '7474', 'Neo4J Port', 'The port that the Neo4J REST API is running on. BY default it is 7474.', 'neo4j'),
(12, 'neo4j_server', 'http://localhost', 'Neo4J Server', 'The URL of the Neo4J REST API.', 'neo4j'),
(13, 'neo4j_username', 'neo4j', 'Neo4J Username', 'Username that is used to communicate with Neo4J REST API.', 'neo4j'),
(14, 'orpha_autocomplete_url', 'https://autocomplete.cafevariome.org/Orpha/query/', 'ORPHA Auto-complete Endpoint', 'Endpoint that provides auto-complete service for ORPHA terms lookup ', 'endpoint'),
(15, 'show_sources_in_discover', 'off', 'Show Sources in Discovery', 'If set to off then only the search box will be shown in the discovery interface (i.e. not the sources to search)', 'discovery'),
(16, 'site_author', 'Bioinformatics Research Group - University of Leicester', 'Site Author', 'Name of the owner of the website, whether a person or an organisation, that appears as metadata on public pages.', 'main'),
(17, 'site_description', 'Cafe Variome - Description', 'Site Description', 'Description of the website that appears as metadata in the structure of public pages.', 'main'),
(18, 'site_keywords', 'healthcare data discovery, bioinformatics', 'Keywords', 'Keywords explaining activity of the website that appear as metadata on public pages. They help search engines find this website.', 'main'),
(19, 'site_title', 'Cafe Variome Central', 'Site Title', 'Title as it appears in the web browser and on top left side of all pages.', 'main'),
(20, 'snomed_autocomplete_url', 'https://autocomplete.cafevariome.org/Snomed/query/', 'SNOMED Auto-complete Endpoint', 'Endpoint that provides auto-complete service for SNOMED terms lookup ', 'endpoint');

-- --------------------------------------------------------

--
-- Table structure for table `single_sign_on_providers`
--

CREATE TABLE `single_sign_on_providers` (
  `id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `display_name` varchar(256) NOT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `type` tinyint(3) NOT NULL,
  `port` smallint(5) NOT NULL,
  `user_login` bit(1) NOT NULL,
  `query` bit(1) NOT NULL,
  `authentication_policy` tinyint(3) NOT NULL,
  `credential_id` int(11) DEFAULT NULL,
  `proxy_server_id` int(11) DEFAULT NULL,
  `removable` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `single_sign_on_providers`
--

INSERT INTO `single_sign_on_providers` (`id`, `server_id`, `name`, `display_name`, `icon`, `type`, `port`, `user_login`, `query`, `authentication_policy`, `credential_id`, `proxy_server_id`, `removable`) VALUES
(1, 1, 'ULEICS-Keycloak', 'ULEICS Key Cloak', 'a6c7c364b3a2d47cca77a6983c.png', 1, 443, b'1', b'1', 0, 1, NULL, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

CREATE TABLE `sources` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` varchar(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `display_name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `owner_name` varchar(256) NOT NULL,
  `owner_email` varchar(128) NOT NULL,
  `uri` varchar(128) DEFAULT NULL,
  `date_created` int(11) UNSIGNED NOT NULL,
  `record_count` int(255) UNSIGNED NOT NULL DEFAULT '0',
  `locked` bit(1) NOT NULL,
  `status` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `source_id` int(11) NOT NULL,
  `display_name` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `data_file_id` int(11) DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `overwrite` bit(1) NOT NULL,
  `started` int(11) UNSIGNED DEFAULT NULL,
  `ended` int(11) UNSIGNED DEFAULT NULL,
  `progress` tinyint(3) UNSIGNED NOT NULL,
  `error_code` tinyint(3) UNSIGNED NOT NULL,
  `error_message` varchar(4096) DEFAULT NULL,
  `pipeline_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
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

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `is_admin`, `token`, `remote`) VALUES
(1, '127.0.0.1', 'admin@cafevariome.org', '$2y$12$g2P1T2RBeLrG94gJjdF/H.Lu1b40U5YLe6DHQFQ.pW/O24sjrJ68e', 'admin@cafevariome.org', 1268889823, 1659359084, 1, 'Admin', 'Admin', 'Brookes Lab', '', 1, NULL, 0);


-- --------------------------------------------------------

--
-- Table structure for table `values`
--

CREATE TABLE `values` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `display_name` varchar(200) NOT NULL,
  `frequency` int(11) NOT NULL,
  `show_in_interface` bit(1) NOT NULL,
  `include_in_interface_index` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `value_mappings`
--

CREATE TABLE `value_mappings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SourceIDAttribute_FK` (`source_id`);

--
-- Indexes for table `attributes_groups`
--
ALTER TABLE `attributes_groups`
  ADD PRIMARY KEY (`attribute_id`,`group_id`),
  ADD KEY `Group_ID_FK` (`group_id`);

--
-- Indexes for table `attributes_ontology_prefixes_relationships`
--
ALTER TABLE `attributes_ontology_prefixes_relationships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Relationship_FK` (`relationship_id`),
  ADD KEY `Prefix_FK` (`prefix_id`),
  ADD KEY `Ontology_Attribute_FK` (`ontology_id`),
  ADD KEY `Attribute_Ontology_FK` (`attribute_id`);

--
-- Indexes for table `attribute_mappings`
--
ALTER TABLE `attribute_mappings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Attribute_Mapping_FK` (`attribute_id`);

--
-- Indexes for table `credentials`
--
ALTER TABLE `credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_files`
--
ALTER TABLE `data_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discovery_groups`
--
ALTER TABLE `discovery_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `network_key` (`network_id`),
  ADD KEY `type` (`policy`);

--
-- Indexes for table `discovery_group_sources`
--
ALTER TABLE `discovery_group_sources`
  ADD PRIMARY KEY (`discovery_group_id`,`source_id`),
  ADD UNIQUE KEY `discovery_group_id` (`discovery_group_id`,`source_id`),
  ADD KEY `Source_FK` (`source_id`);

--
-- Indexes for table `discovery_group_users`
--
ALTER TABLE `discovery_group_users`
  ADD PRIMARY KEY (`user_id`,`discovery_group_id`),
  ADD UNIQUE KEY `discovery_group_id` (`discovery_group_id`,`user_id`);

--
-- Indexes for table `eavs`
--
ALTER TABLE `eavs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `source_id` (`source_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `attribute_id` (`attribute_id`),
  ADD KEY `value_id` (`value_id`),
  ADD KEY `indexed` (`indexed`),
  ADD KEY `uid_2` (`attribute_id`,`value_id`),
  ADD KEY `subj_src` (`subject_id`,`source_id`),
  ADD KEY `comi` (`id`,`source_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `networks`
--
ALTER TABLE `networks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `network_requests`
--
ALTER TABLE `network_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `NetworkRequest_NetworkKey_FK` (`network_key`);

--
-- Indexes for table `ontologies`
--
ALTER TABLE `ontologies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ontology_prefixes`
--
ALTER TABLE `ontology_prefixes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `OntologyPrefix_FK` (`ontology_id`);

--
-- Indexes for table `ontology_relationships`
--
ALTER TABLE `ontology_relationships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `OntologyRelationhip_FK` (`ontology_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Author_FK` (`user_id`);

--
-- Indexes for table `pipelines`
--
ALTER TABLE `pipelines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proxy_servers`
--
ALTER TABLE `proxy_servers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ProxyCredentialsIdFK` (`credential_id`),
  ADD KEY `ProxyServerIdFK` (`server_id`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `single_sign_on_providers`
--
ALTER TABLE `single_sign_on_providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ProxyServerFK` (`proxy_server_id`),
  ADD KEY `CredentialsIdFK` (`credential_id`),
  ADD KEY `ServerIdFK` (`server_id`);

--
-- Indexes for table `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`);

--
-- Indexes for table `values`
--
ALTER TABLE `values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Attribute_FK` (`attribute_id`);

--
-- Indexes for table `value_mappings`
--
ALTER TABLE `value_mappings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Value_Mapping_FK` (`value_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes_ontology_prefixes_relationships`
--
ALTER TABLE `attributes_ontology_prefixes_relationships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_mappings`
--
ALTER TABLE `attribute_mappings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credentials`
--
ALTER TABLE `credentials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `data_files`
--
ALTER TABLE `data_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discovery_groups`
--
ALTER TABLE `discovery_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eavs`
--
ALTER TABLE `eavs`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `network_requests`
--
ALTER TABLE `network_requests`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ontologies`
--
ALTER TABLE `ontologies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ontology_prefixes`
--
ALTER TABLE `ontology_prefixes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ontology_relationships`
--
ALTER TABLE `ontology_relationships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pipelines`
--
ALTER TABLE `pipelines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `proxy_servers`
--
ALTER TABLE `proxy_servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `single_sign_on_providers`
--
ALTER TABLE `single_sign_on_providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sources`
--
ALTER TABLE `sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `values`
--
ALTER TABLE `values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `value_mappings`
--
ALTER TABLE `value_mappings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attributes`
--
ALTER TABLE `attributes`
  ADD CONSTRAINT `SourceIDAttribute_FK` FOREIGN KEY (`source_id`) REFERENCES `sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attributes_groups`
--
ALTER TABLE `attributes_groups`
  ADD CONSTRAINT `Attribute_ID_FK` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Group_ID_FK` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attributes_ontology_prefixes_relationships`
--
ALTER TABLE `attributes_ontology_prefixes_relationships`
  ADD CONSTRAINT `Attribute_Ontology_FK` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Ontology_Attribute_FK` FOREIGN KEY (`ontology_id`) REFERENCES `ontologies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Prefix_FK` FOREIGN KEY (`prefix_id`) REFERENCES `ontology_prefixes` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Relationship_FK` FOREIGN KEY (`relationship_id`) REFERENCES `ontology_relationships` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `attribute_mappings`
--
ALTER TABLE `attribute_mappings`
  ADD CONSTRAINT `Attribute_Mapping_FK` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discovery_group_sources`
--
ALTER TABLE `discovery_group_sources`
  ADD CONSTRAINT `DiscoveryGroup_FK1` FOREIGN KEY (`discovery_group_id`) REFERENCES `discovery_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Source_FK` FOREIGN KEY (`source_id`) REFERENCES `sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discovery_group_users`
--
ALTER TABLE `discovery_group_users`
  ADD CONSTRAINT `DiscoveryGroup_FK` FOREIGN KEY (`discovery_group_id`) REFERENCES `discovery_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `User_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `network_requests`
--
ALTER TABLE `network_requests`
  ADD CONSTRAINT `NetworkRequest_NetworkKey_FK` FOREIGN KEY (`network_key`) REFERENCES `networks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ontology_prefixes`
--
ALTER TABLE `ontology_prefixes`
  ADD CONSTRAINT `OntologyPrefix_FK` FOREIGN KEY (`ontology_id`) REFERENCES `ontologies` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ontology_relationships`
--
ALTER TABLE `ontology_relationships`
  ADD CONSTRAINT `OntologyRelationhip_FK` FOREIGN KEY (`ontology_id`) REFERENCES `ontologies` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `Author_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proxy_servers`
--
ALTER TABLE `proxy_servers`
  ADD CONSTRAINT `ProxyCredentialsIdFK` FOREIGN KEY (`credential_id`) REFERENCES `credentials` (`id`),
  ADD CONSTRAINT `ProxyServerIdFK` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `single_sign_on_providers`
--
ALTER TABLE `single_sign_on_providers`
  ADD CONSTRAINT `CredentialsIdFK` FOREIGN KEY (`credential_id`) REFERENCES `credentials` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ProxyServerFK` FOREIGN KEY (`proxy_server_id`) REFERENCES `proxy_servers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ServerIdFK` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `values`
--
ALTER TABLE `values`
  ADD CONSTRAINT `Attribute_FK` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `value_mappings`
--
ALTER TABLE `value_mappings`
  ADD CONSTRAINT `Value_Mapping_FK` FOREIGN KEY (`value_id`) REFERENCES `values` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
