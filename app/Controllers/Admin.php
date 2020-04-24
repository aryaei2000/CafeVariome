<?php namespace App\Controllers;

/**
 * Admin.php
 * Created 18/07/2019
 * 
 * @author Owen Lancaster
 * @author Gregory Warren
 * @author Mehdi Mehtarizadeh
 */

use App\Models\UIData;
use App\Models\Settings;
use App\Models\Network;
use App\Models\Source;
use App\Models\User;
use App\Libraries\ElasticSearch;
use App\Libraries\Neo4J;
use App\Libraries\KeyCloak;
use App\Models\NetworkRequest;
use App\Helpers\AuthHelper;
use App\Libraries\CafeVariome\Net\NetworkInterface;
use CodeIgniter\Config\Services;

class Admin extends CVUI_Controller{

    /**
	 * Validation list template.
	 *
	 * @var string
	 */
    protected $validationListTemplate = 'list';


    /**
	 * Constructor
	 *
	 */
    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger){
        parent::setProtected(true);
        parent::setIsAdmin(true);
        parent::initController($request, $response, $logger);

		$this->session = Services::session();
		$this->db = \Config\Database::connect();
        $this->setting =  Settings::getInstance($this->db);

        $this->validation = Services::validation();

    }

    function Index(){
        $uidata = new UIData();
        $uidata->title = "Administrator Dashboard";
        $uidata->stickyFooter = false;
        $uidata->css = [CSS.'dashboard/chartjs/Chart.min.css'];
        $uidata->javascript = [JS.'dashboard/chartjs/Chart.min.js'];

        $sourceModel = new Source();
        $networkInterface = new NetworkInterface();
        $userModel = new User();
        $networkRequestModel = new NetworkRequest();
        
        $elasticSearch = new ElasticSearch(array($this->setting->getElasticSearchUri()));
        $neo4j = new Neo4J($this->setting->getNeo4JUserName(), $this->setting->getNeo4JPassword(), $this->setting->getNeo4JUri(), $this->setting->getNeo4JPort());
        $keyCloak = new KeyCloak();

        $sourceList = $sourceModel->getSources('source_id, name', ['status'=>'online']);

        $sc = 0;
        $maxSourcesToDisplay = 12;
        $sourceCountList = [];
        $sourceNameLabels = '';
        foreach ($sourceList as $source) {
            if ($sc > $maxSourcesToDisplay) {
                break;
            }
            if ($sc == count($sourceList) - 1 || $sc == $maxSourcesToDisplay) {
                $sourceNameLabels .= "'" . $source['name']. "'";
            }
            else{
                $sourceNameLabels .= "'" . $source['name']. "',";
            }

            $sourceCountList[$source['name']] = 0;
            
            $sc++;
        }

        $uidata->data['sourceCount'] = count($sourceList);
        $uidata->data['sourceNames'] = $sourceNameLabels;

        $networks = $networkInterface->GetNetworksByInstallationKey($this->setting->getInstallationKey());
        if ($networks->status) {
            $uidata->data['networksCount'] = count($networks->data);
            $uidata->data['networkMsg'] = Null;
        }
        else{
            //Problem contacting network server
            $uidata->data['networksCount'] = "-";
            $uidata->data['networkMsg'] = "There was a problem in communicating with network software. Please fix it as the system is unable to function correctly.";
        }

        $uidata->data['usersCount'] = count($userModel->getUsers('id'));
        $uidata->data['networkRequestCount'] = count($networkRequestModel->getNetworkRequests('id', ['status' => 0]));

        $elasticStatus = $elasticSearch->ping();
        $uidata->data['elasticStatus'] = $elasticStatus;
        $uidata->data['elasticMsg'] = Null;
        if (!$elasticStatus) {
            $uidata->data['elasticMsg'] = "Elasticsearch is not running. The query interface is not accessible. Please ask the server administrator to start it.";
        }

        $neo4jStatus = $neo4j->ping(); 
        $uidata->data['neo4jStatus'] = $neo4jStatus;
        $uidata->data['neo4jMsg'] = Null;
        if (!$neo4jStatus) {
            $uidata->data['neo4jMsg'] = "Neo4J is not running. Some capabilities of the system are disabled because of this. Please ask the server administrator to start it.";
        }

        $uidata->data['keycloakStatus'] = $keyCloak->checkKeyCloakServer();
        
        $data = $this->wrapData($uidata);
        return view($this->viewDirectory. '/Index', $data);
    }


    function Settings() {
        $uidata = new UIData();
        $uidata->title = "Settings";
        $uidata->stickyFooter = false;

        $settingModel = new Settings($this->db, true);

        $settings =  $settingModel->getSettings();
        $uidata->data['settings'] = $settings;
        /*
        $validationRules = [];

        foreach ($settings as $s) {
            $validationRules[$s['setting_key']] = [
                'label' => $s['setting_name'],
                'rules' => $s['validation_rules'],
                'errors' => [

                ]
            ];
        }

        $this->validation->setRules($validationRules);
        */
        
        if ($this->request->getPost() /*&& $this->validation->withRequest($this->request)->run()*/) {
            foreach ($settings as $s) {
                $settingModel->updateSettings(['value' => $this->request->getVar($s["setting_key"])], ['setting_key' =>  $s["setting_key"]]);
            }
            return redirect()->to(base_url($this->controllerName.'/Settings'));
        }
        else{
            $uidata->data['message'] = $this->validation->getErrors() ? $this->validation->listErrors($this->validationListTemplate) : $this->session->getFlashdata('message');
        }

        $data = $this->wrapData($uidata);
        return view($this->viewDirectory. '/Settings', $data);
    }
}