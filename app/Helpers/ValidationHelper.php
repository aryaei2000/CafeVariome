<?php namespace App\Helpers;

/**
 * ValidationHelper.php
 *
 * Created: 19/08/2019
 *
 * @author Mehdi Mehtarizadeh
 *
 * This class contains helper functions for form validation.
 */


use App\Libraries\CafeVariome\Factory\DiscoveryGroupAdapterFactory;
use App\Libraries\CafeVariome\Factory\OntologyPrefixAdapterFactory;
use App\Libraries\CafeVariome\Factory\OntologyRelationshipAdapterFactory;
use App\Models\Attribute;
use App\Models\AttributeMapping;
use App\Models\Value;
use App\Models\ValueMapping;

class ValidationHelper
{
    function __construct()
    {

    }

    /**
     * unique_network_group_name_check
     * @param string $group_name the user input to be checked for uniqueness.
     * @param string $network_key the network key accompanying group name.
     *
     * @return bool true if the network group name does not exist in the database, false otherwise.
     *
     * @author Mehdi Mehtarizadeh
     */

    public function unique_discovery_group_name_check(string $str, string $fields, array $data, & $err): bool
    {
		$discoveryGroupAdapter = (new DiscoveryGroupAdapterFactory())->GetInstance();

		if (strpos($fields, ',') !== false)
		{
			$fieldsArray = explode(',', $fields);
			$network_id = $fieldsArray[0];
			$discovery_group_id = $fieldsArray[1];

			$discoveryGroup = $discoveryGroupAdapter->ReadByNameAndNetworkId($str, $network_id);

			return $discoveryGroup->isNull() || $discovery_group_id == $discoveryGroup->getID();
		}
		else
		{
			$network_id = $fields;
			return $discoveryGroupAdapter->ReadByNameAndNetworkId($str, $network_id)->isNull();
		}

    }

    public function valid_delimiter(string $delimiter): bool
    {
        $valid_delimiters = [',', '/', ';', ':', '|', '*', '&', '%', '$', '!', '~', '#', '-', '_', '+', '=', '^'];

        return in_array($delimiter, $valid_delimiters);
    }

    public function subject_id_required_with(string $str, string $fields, array $data, & $err): bool
    {
        $err = null;

        if (
			$data[$fields] == SUBJECT_ID_IN_FILE_NAME ||
			$data[$fields] == SUBJECT_ID_PER_BATCH_OF_RECORDS ||
			$data[$fields] == SUBJECT_ID_PER_FILE ||
			$data[$fields] == SUBJECT_ID_BY_EXPANSION_ON_COLUMNS
		)
		{
            return true;
        }

        if ($data[$fields] == SUBJECT_ID_WITHIN_FILE )
		{
            if ($str == '' && $str == null)
			{
                $err = "Subject ID Attribute Name cannot be empty.";
                return false;

            }
            else
			{
                $regexp = "/^[a-zA-Z0-9-_]+$/";

                if (preg_match($regexp, $str, $matches))
				{
                    return true;
                }

                $err = "The only valid input for Subject ID Attribute Name is alphanumeric characters, dashes, and underscores.";
            }
        }

        return false;
    }

	public function expansion_policy_required_with(?string $str, string $fields, array $data, & $err): bool
	{
		$err = null;

		if (
			$data[$fields] == SUBJECT_ID_WITHIN_FILE ||
			$data[$fields] == SUBJECT_ID_IN_FILE_NAME ||
			$data[$fields] == SUBJECT_ID_PER_BATCH_OF_RECORDS ||
			$data[$fields] == SUBJECT_ID_PER_FILE
		)
		{
			return true;
		}
		else
		{
			if(is_null($str))
			{
				$err = 'Expansion Policy is required.';
				return false;
			}

			if (intval($str) > 0)
			{
				if (intval($str) > 999)
				{
					$err = 'Expansion Policy can only have 3 digits.';
					return false;
				}
				return true;
			}

			$err = 'Expansion Policy is required.';
			return false;
		}

		return false;
	}

	public function expansion_columns_required_with(string $str, string $fields, array $data, & $err): bool
	{
		$err = null;

		if (
			$data[$fields] == SUBJECT_ID_WITHIN_FILE ||
			$data[$fields] == SUBJECT_ID_IN_FILE_NAME ||
			$data[$fields] == SUBJECT_ID_PER_BATCH_OF_RECORDS ||
			$data[$fields] == SUBJECT_ID_PER_FILE
		)
		{
			return true;
		}

		if ($data[$fields] == SUBJECT_ID_BY_EXPANSION_ON_COLUMNS)
		{
			if ($str == null || $str == '')
			{
				$err = '`Column(s) to Expand on` cannot be empty when `Subject ID Location` is set to `No Subject ID Given - Assign by Expansion of Column(s)`.';
				return false;
			}
			else
			{
				if(strpos($str, ','))
				{
					$items = explode(',', $str);

					foreach ($items as $item)
					{
						if (intval($item) == 0)
						{
							$err = '`Column(s) to Expand on` should be a comma separated list of numbers.';
							return false;
						}
					}

					if ($data['subject_id_expansion_policy'] == SUBJECT_ID_EXPANDSION_POLICY_INDIVIDUAL)
					{
						$err = '`Policy of Expansion` cannot be set to `Individual` when only one column is used for expansion.';
						return false;
					}
					return true;
				}
				elseif (is_numeric($str))
				{
					if ($data['subject_id_expansion_policy'] != SUBJECT_ID_EXPANDSION_POLICY_INDIVIDUAL)
					{
						$err = '`Policy of Expansion` must be set to `Individual` when only one column is used for expansion.';
						return false;
					}
					return true;
				}
			}
		}

        return false;
    }

	public function expansion_attribute_name_required_with(string $str, string $fields, array $data, & $err): bool
	{
		$err = null;

		if (
			$data[$fields] == SUBJECT_ID_WITHIN_FILE ||
			$data[$fields] == SUBJECT_ID_IN_FILE_NAME ||
			$data[$fields] == SUBJECT_ID_PER_BATCH_OF_RECORDS ||
			$data[$fields] == SUBJECT_ID_PER_FILE
		)
		{
			return true;
		}
		else
		{
			if (strlen(trim($str)) > 0)
			{

				$regexp = "/^[a-zA-Z0-9-_]+$/";

				if (preg_match($regexp, $str, $matches))
				{
					return true;
				}

				$err = 'The only valid characters for New Attribute Name are alphabetical characters, numbers, dashes, and underscores.';
			}

			$err = 'New Attribute Name is required.';
		}

		return false;
	}

    public function group_columns_required_with(string $str, string $fields, array $data, & $err): bool
    {
        $err = null;

        if ($data[$fields] == GROUPING_COLUMNS_ALL) {
            return true;
        }

        if ($data[$fields] == GROUPING_COLUMNS_CUSTOM) {

            if ($str == null || $str == '') {
                $err = 'Group Columns cannot be empty when custom grouping is selected.';
                return false;
            }
            else {
                if(strpos($str, ',')){
                    $items = explode(',', $str);

                    foreach ($items as $item) {
                        if (intval($item) == 0) {
                            $err = 'Group Columns should be a comma separated list of numbers.';
                            return false;
                        }
                    }

                    return true;
                }
                elseif (is_numeric($str)){
                	return true;
				}
            }
        }


        return false;
    }

	public function unique_ontology_prefix(string $str, string $fields, array $data, & $err): bool
	{
		$ontologyPrefixAdapter = (new OntologyPrefixAdapterFactory())->GetInstance();
		if (strpos($fields, ',') !== false)
		{
			$ontology_id = $data['ontology_id'];
			$ontology_prefix_id = $data['ontology_prefix_id'];
			$ontologyPrefix = $ontologyPrefixAdapter->ReadByNameAndOntologyId($str, $ontology_id);

			return $ontologyPrefix->isNull() ||  $ontology_prefix_id == $ontologyPrefix->getID();
		}
		else
		{
			$ontology_id = $data[$fields];
			return $ontologyPrefixAdapter->ReadByNameAndOntologyId($str, $ontology_id)->isNull();
		}
	}

	public function unique_ontology_relationship(string $str, string $fields, array $data, & $err): bool
	{
		$ontologyRelationshipAdapter = (new OntologyRelationshipAdapterFactory())->GetInstance();
		if (strpos($fields, ',') !== false)
		{
			$ontology_id = $data['ontology_id'];
			$ontology_relationship_id = $data['ontology_relationship_id'];
			$ontology_relationship = $ontologyRelationshipAdapter->ReadByNameAndOntologyId($str, $ontology_id);

			return $ontology_relationship->isNull() || $ontology_relationship_id == $ontology_relationship->getID();
		}
		else
		{
			$ontology_id = $data[$fields];
			return $ontologyRelationshipAdapter->ReadByNameAndOntologyId($str, $ontology_id);
		}
	}

	public function duplicate_attribute_and_mapping(string $str, string $fields, array $data, & $err): bool
	{
		$attributeModel = new Attribute();
		$source_id = $data[$fields];
		$attributeId = $attributeModel->getAttributeIdByNameAndSourceId($str, $source_id);
		return !($attributeId > 0);
	}

	public function unique_attribute_mapping(string $str, string $fields, array $data, & $err): bool
	{
		$attributeMappingModel = new AttributeMapping();
		$source_id = $data[$fields];
		return !$attributeMappingModel->attributeMappingExists($str, $source_id);
	}

	public function unique_value_mapping(string $str, string $fields, array $data, & $err): bool
	{
		$valueMappingModel = new ValueMapping();
		$attribute_id = $data[$fields];
		return !$valueMappingModel->valueMappingExists($str, $attribute_id);
	}

	public function duplicate_value_and_mapping(string $str, string $fields, array $data, & $err): bool
	{
		$valueModel = new Value();
		$attribute_id = $data[$fields];
		$valueId = $valueModel->getValueIdByNameAndAttributeId($str, $attribute_id);
		return !($valueId > 0);
	}
}
