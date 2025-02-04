<?php

/*
 | --------------------------------------------------------------------
 | App Namespace
 | --------------------------------------------------------------------
 |
 | This defines the default Namespace that is used throughout
 | CodeIgniter to refer to the Application directory. Change
 | this constant to change the namespace that all application
 | classes should use.
 |
 | NOTE: changing this will require manually modifying the
 | existing namespaces of App\* namespaced-classes.
 */
defined('APP_NAMESPACE') || define('APP_NAMESPACE', 'App');

/*
 | --------------------------------------------------------------------------
 | Composer Path
 | --------------------------------------------------------------------------
 |
 | The path that Composer's autoload file is expected to live. By default,
 | the vendor folder is in the Root directory, but you can customize that here.
 */
defined('COMPOSER_PATH') || define('COMPOSER_PATH', ROOTPATH . 'vendor/autoload.php');

/*
 |--------------------------------------------------------------------------
 | Timing Constants
 |--------------------------------------------------------------------------
 |
 | Provide simple ways to work with the myriad of PHP functions that
 | require information to be in seconds.
 */
defined('SECOND') || define('SECOND', 1);
defined('MINUTE') || define('MINUTE', 60);
defined('HOUR')   || define('HOUR', 3600);
defined('DAY')    || define('DAY', 86400);
defined('WEEK')   || define('WEEK', 604800);
defined('MONTH')  || define('MONTH', 2_592_000);
defined('YEAR')   || define('YEAR', 31_536_000);
defined('DECADE') || define('DECADE', 315_360_000);

/*
 | --------------------------------------------------------------------------
 | Exit Status Codes
 | --------------------------------------------------------------------------
 |
 | Used to indicate the conditions under which the script is exit()ing.
 | While there is no universal standard for error codes, there are some
 | broad conventions.  Three such conventions are mentioned below, for
 | those who wish to make use of them.  The CodeIgniter defaults were
 | chosen for the least overlap with these conventions, while still
 | leaving room for others to be defined in future versions and user
 | applications.
 |
 | The three main conventions used for determining exit status codes
 | are as follows:
 |
 |    Standard C/C++ Library (stdlibc):
 |       http://www.gnu.org/software/libc/manual/html_node/Exit-Status.html
 |       (This link also contains other GNU-specific conventions)
 |    BSD sysexits.h:
 |       http://www.gsp.com/cgi-bin/man.cgi?section=3&topic=sysexits
 |    Bash scripting:
 |       http://tldp.org/LDP/abs/html/exitcodes.html
 |
 */
defined('EXIT_SUCCESS')        || define('EXIT_SUCCESS', 0); // no errors
defined('EXIT_ERROR')          || define('EXIT_ERROR', 1); // generic error
defined('EXIT_CONFIG')         || define('EXIT_CONFIG', 3); // configuration error
defined('EXIT_UNKNOWN_FILE')   || define('EXIT_UNKNOWN_FILE', 4); // file not found
defined('EXIT_UNKNOWN_CLASS')  || define('EXIT_UNKNOWN_CLASS', 5); // unknown class
defined('EXIT_UNKNOWN_METHOD') || define('EXIT_UNKNOWN_METHOD', 6); // unknown class member
defined('EXIT_USER_INPUT')     || define('EXIT_USER_INPUT', 7); // invalid user input
defined('EXIT_DATABASE')       || define('EXIT_DATABASE', 8); // database error
defined('EXIT__AUTO_MIN')      || define('EXIT__AUTO_MIN', 9); // lowest automatically-assigned error code
defined('EXIT__AUTO_MAX')      || define('EXIT__AUTO_MAX', 125); // highest automatically-assigned error code

/**
 * @deprecated Use \CodeIgniter\Events\Events::PRIORITY_LOW instead.
 */
define('EVENT_PRIORITY_LOW', 200);

/**
 * @deprecated Use \CodeIgniter\Events\Events::PRIORITY_NORMAL instead.
 */
define('EVENT_PRIORITY_NORMAL', 100);

/**
 * @deprecated Use \CodeIgniter\Events\Events::PRIORITY_HIGH instead.
 */
define('EVENT_PRIORITY_HIGH', 10);

/**
 *--------------------------------------------------------------------------
 * Cafe Variome Constants
 *--------------------------------------------------------------------------
 * @author Mehdi Mehtarizadeh
 * date 11/06/2019
 * This section contains base folder paths for running Cafe Variome user interface.
 * The code is extracted from the Cafe Variome 2.
 *
 */

define('CAFEVARIOME_NAMESPACE', 'App\Libraries\CafeVariome');

define('WRITABLE', 'writable' . DIRECTORY_SEPARATOR);
define('RESOURCES_DIR', "resources". DIRECTORY_SEPARATOR);

define('IMAGES', RESOURCES_DIR . 'images' . DIRECTORY_SEPARATOR);
define('JS', RESOURCES_DIR . 'js' . DIRECTORY_SEPARATOR);
define('CSS', RESOURCES_DIR . 'css' . DIRECTORY_SEPARATOR);
define('UPLOAD', WRITABLE . 'uploads' . DIRECTORY_SEPARATOR);
define('UPLOAD_DATA', 'data' . DIRECTORY_SEPARATOR);
define('UPLOAD_PAIRINGS', 'pairings'. DIRECTORY_SEPARATOR);
define('UPLOAD_ICONS', 'icons'. DIRECTORY_SEPARATOR);
define('VENDOR', 'vendor' . DIRECTORY_SEPARATOR);

define('HEADER_IMAGE_DIR', RESOURCES_DIR . 'images' . DIRECTORY_SEPARATOR . 'logos' . DIRECTORY_SEPARATOR);
define('JSON_DATA_DIR', RESOURCES_DIR . "phenotype_lookup_data" . DIRECTORY_SEPARATOR);
define('USER_INTERFACE_INDEX_DIR', RESOURCES_DIR . "user_interface_index" . DIRECTORY_SEPARATOR);
define('CV_BIN', RESOURCES_DIR . 'bin' . DIRECTORY_SEPARATOR);
define('STATIC_DIR', 'static' . DIRECTORY_SEPARATOR);
define('ORPHATERMS_SOURCE', 'orphaterms.txt');

define('CV_CONVERT_BIN', CV_BIN . 'cv-convert');
define('CV_CONVERT_SETTINGS_DIR', UPLOAD . 'settings' . DIRECTORY_SEPARATOR);

// UI status message types
define('STATUS_SUCCESS', 1);
define('STATUS_ERROR', 0);
define('STATUS_INFO', 2);
define('STATUS_WARNING', 3);

//Uploader Actions
define('UPLOADER_DELETE_NONE', 0);
define('UPLOADER_DELETE_FILE', 1);
define('UPLOADER_DELETE_ALL', 2);

// PHP INI Values
ini_set('memory_limit', "1G");

//Data Pipeline
define('SUBJECT_ID_WITHIN_FILE', 0);
define('SUBJECT_ID_IN_FILE_NAME', 1);
define('SUBJECT_ID_PER_BATCH_OF_RECORDS', 2);
define('SUBJECT_ID_PER_FILE', 3);
define('SUBJECT_ID_BY_EXPANSION_ON_COLUMNS', 4);
define('GROUPING_COLUMNS_ALL', 0);
define('GROUPING_COLUMNS_CUSTOM', 1);
define('SUBJECT_ID_EXPANDSION_POLICY_INDIVIDUAL', 0);
define('SUBJECT_ID_EXPANDSION_POLICY_MAXIMUM', 1);
define('SUBJECT_ID_EXPANDSION_POLICY_MINIMUM', 2);

//Elasticsearch Index Status
define('ELASTICSEARCH_INDEX_STATUS_UNKNOWN', 0);
define('ELASTICSEARCH_INDEX_STATUS_CREATED', 1);
define('ELASTICSEARCH_INDEX_STATUS_NOT_CREATED', 2);

//Elasticsearch Data Status
define('ELASTICSEARCH_DATA_STATUS_UNKNOWN', 0);
define('ELASTICSEARCH_DATA_STATUS_FULLY_INDEXED', 1);
define('ELASTICSEARCH_DATA_STATUS_NOT_INDEXED', 2);
define('ELASTICSEARCH_DATA_STATUS_PARTIALLY_INDEXED', 3);
define('ELASTICSEARCH_DATA_STATUS_EMPTY', 4);

//Neo4J Index Status
define('NEO4J_INDEX_STATUS_UNKNOWN', 0);
define('NEO4J_INDEX_STATUS_CREATED', 1);
define('NEO4J_INDEX_STATUS_NOT_CREATED', 2);

//Neo4J Data Status
define('NEO4J_DATA_STATUS_UNKNOWN', 0);
define('NEO4J_DATA_STATUS_FULLY_INDEXED', 1);
define('NEO4J_DATA_STATUS_NOT_INDEXED', 2);
define('NEO4J_DATA_STATUS_PARTIALLY_INDEXED', 3);
define('NEO4J_DATA_STATUS_EMPTY', 4);

// User Interface Index Status

define('USER_INTERFACE_INDEX_STATUS_UNKNOWN', 0);
define('USER_INTERFACE_INDEX_STATUS_CREATED', 1);
define('USER_INTERFACE_INDEX_STATUS_NOT_CREATED', 2);

//Attribute Constants
define('ATTRIBUTE_TYPE_UNDEFINED', 0);
define('ATTRIBUTE_TYPE_STRING', 1);
define('ATTRIBUTE_TYPE_NUMERIC_REAL', 2);
define('ATTRIBUTE_TYPE_NUMERIC_INTEGER', 3);
define('ATTRIBUTE_TYPE_NUMERIC_NATURAL', 4);
define('ATTRIBUTE_TYPE_ONTOLOGY_TERM', 5);

define('ATTRIBUTE_STORAGE_UNDEFINED', 0);
define('ATTRIBUTE_STORAGE_ELASTICSEARCH', 1);
define('ATTRIBUTE_STORAGE_NEO4J', 2);
define('ATTRIBUTE_STORAGE_EXTERNAL', 3);

//Single SignOn Provider
define('SINGLE_SIGNON_SAML2', 0);
define('SINGLE_SIGNON_OIDC2', 1);

define('SINGLE_SIGNON_POST_AUTH_CREATE_ACCOUNT', 0);
define('SINGLE_SIGNON_POST_AUTH_LINK_ACCOUNT', 1);

//Source Status
define('SOURCE_STATUS_OFFLINE', 0);
define('SOURCE_STATUS_ONLINE', 1);

//Data File Status
define('DATA_FILE_STATUS_UPLOADED', 1);
define('DATA_FILE_STATUS_IMPORTED', 2);
define('DATA_FILE_STATUS_PROCESSING', 3);
define('DATA_FILE_STATUS_PROCESSED', 4);
define('DATA_FILE_STATUS_MISSING', 5);

//Task Status
define('TASK_STATUS_CREATED', 0);
define('TASK_STATUS_STARTED', 1);
define('TASK_STATUS_PROCESSING', 2);
define('TASK_STATUS_FINISHED', 3);
define('TASK_STATUS_FAILED', 4);
define('TASK_STATUS_CENCELLED', 5);
//Task Type
define('TASK_TYPE_FILE_PROCESS', 0);
define('TASK_TYPE_FILE_PROCESS_BATCH', 1);
define('TASK_TYPE_SOURCE_INDEX_ELASTICSEARCH', 2);
define('TASK_TYPE_SOURCE_INDEX_NEO4J', 3);
define('TASK_TYPE_SOURCE_INDEX_USER_INTERFACE', 4);

//Task Error Code
define('TASK_ERROR_NO_ERROR', 0);
define('TASK_ERROR_RUNTIME_ERROR', 1);
define('TASK_ERROR_DATA_FILE_ID_NULL', 2);
define('TASK_ERROR_PIPELINE_ID_NULL', 3);
define('TASK_ERROR_SOURCE_ID_NULL', 4);
define('TASK_ERROR_DATA_FILE_NULL', 5);
define('TASK_ERROR_PIPELINE_NULL', 6);
define('TASK_ERROR_DUPLICATE', 7);
//define('TASK_ERROR_', );

//Discovery Group Policies
define('DISCOVERY_GROUP_POLICY_EXISTENCE', 1);
define('DISCOVERY_GROUP_POLICY_BOOLEAN', 2);
define('DISCOVERY_GROUP_POLICY_COUNT', 3);
define('DISCOVERY_GROUP_POLICY_LIST_WITH_ATTRIBUTES', 4);

