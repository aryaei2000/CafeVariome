<?php namespace App\Models;

/**
 * Settings.php
 * @author: Mehdi Mehtarizadeh
 * Created: 18/06/2019
 * Model class that contains CafeVariome settings from database.
 * Data is loaded from 'settings' table.
 * This class follows a singleton pattern.
 */

use CodeIgniter\Model;
use CodeIgniter\Database\ConnectionInterface;

class Settings extends Model{

	protected $db;

  private static $_settings = null;
    
  public $settingData = Array();

	protected $table      = 'settings';
	protected $primaryKey = 'setting_id';

	protected $tempReturnType = 'array';

    /**
     * Constructor
     * 
     * @param ConnectionInterface $db
     * @return object
     */

    public function __construct(ConnectionInterface &$db = null, bool $returnFull = false)
    {
          if ($db != null) {
            $this->db =& $db;
          }
          else {
              $this->db = \Config\Database::connect();
          }
          if (!$returnFull) {    
          $settings = $this->findAll();
          $c = 0;
          foreach ($settings as $row) {
            $c++;

            if ( $row['value'] == "off") {
                $this->settingData[$row['setting_key']] = false;
            }
            else {
                $this->settingData[$row['setting_key']] =  $row['value'];               
            }
          }
      }
    }

    public static function getInstance(ConnectionInterface &$db)
    {
      if (self::$_settings == null)
      {
        self::$_settings = new Settings($db);
      }
   
      return self::$_settings;
    }

    public function getSettings(string $cols = null, array $conds = null, int $limit = -1, int $offset = -1){
        $builder = $this->db->table($this->table);		

        if ($cols) {
            $builder->select($cols);
        }
        if ($conds) {
            $builder->where($conds);
        }
        if ($limit > 0) {
            if ($offset > 0) {
                $builder->limit($limit, $offset);
            }
            $builder->limit($limit);
        }

        $query = $builder->get()->getResultArray();
        return $query; 
    }

    public function updateSettings(array $data, array $conds) {
      $this->builder = $this->db->table($this->table);
      if ($conds) {
          $this->builder->where($conds);
      }
      $this->builder->update($data);
  }

}
