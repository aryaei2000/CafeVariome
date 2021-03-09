<?php namespace App\Models;

/**
 * Phenotype.php
 * 
 * Created: 09/08/2019
 * 
 * @author Owen Lancaster
 * @author Gregory Warren
 * @author Mehdi Mehtarizadeh
 * 
 * This class handles data operations on Phenotypes in EAVs table.
 * 
 */

use CodeIgniter\Model;
use CodeIgniter\Database\ConnectionInterface;

 class Phenotype extends Model{
    protected $db;
    protected $builder;

    public function __construct(ConnectionInterface &$db = null)
    {
        if ($db != null) {
            $this->db =& $db;
        }
        else {
            $this->db = \Config\Database::connect();
        }
    }

    /**
     * localPhenotypesLookupValues
     * Create Local Phenotype Lookup Values and insert them into database.
     * 
     * @param int $source_id
     * @param string $network_key
     * 
     * @return array localPhenoTypes
     */
    function localPhenotypesLookupValues(int $source_id, string $network_key) {

        $eavModel = new EAV();
        $eavCount = $eavModel->getEAVs('count(*) as totalEAVs', ['source_id' => $source_id]);
        $data = [];
        $tempLocalPhenotypes = [];

        for ($i=0; $i < $eavCount[0]['totalEAVs']; $i+=10000) { 
            $data = $eavModel->getEAVsForSource($source_id, 10000, $i);
            $this->swapLocalPhenotypes($data, $tempLocalPhenotypes, $network_key);
        }

        $data = $eavModel->getEAVsForSource($source_id, $i - $eavCount[0]['totalEAVs'], $i - 10000);
        $this->swapLocalPhenotypes($data, $tempLocalPhenotypes, $network_key);

        return $tempLocalPhenotypes;
    }

    private function swapLocalPhenotypes(array $data, & $tempLocalPhenotypes, int $network_key)
    {
        foreach ($data as $d) {

            $attr = $d['attribute'];
            $value = $d['value'];
            
            if(strlen($value) > 229) continue;

            if(is_numeric($value)) {            
                $sigs = 4;
                if(is_float($value) && floatval($value)) {
                    if($value < 0) {
                        $value = round($value * -1, $sigs) * -1;
                    } else {
                        $value = round($value, $sigs);
                    }
                }
            }

            $value = (string)$value;      

            $local_phenotypes = [];

            foreach ($tempLocalPhenotypes as $tlp) {
                if ($tlp['phenotype_attribute'] == $attr) {
                    array_push($local_phenotypes, $tlp);
                }
            }
            
            if(count($local_phenotypes) > 0) {
                $lastLP = array_pop($local_phenotypes);
                if(in_array($value, explode("|" , $lastLP['phenotype_values'])) || (strpos($lastLP['phenotype_values'], 'Not all values displayed|') !== false)) continue;
                else {
                    // Allow displaying of all values
                    $val = $lastLP['phenotype_values'] . $value . "|";
                    $tempLocalPhenotypes[$attr]['phenotype_values'] = $val;
                    $tempLocalPhenotypes[$attr]['phenotype_attribute'] = $attr;
                }
            } else {
                $value = $value . "|";

                $tempLocalPhenotypes[$attr] = ["network_key" => $network_key, "phenotype_attribute" => $attr, "phenotype_values" => $value];
            }
        }
    }
    
 }