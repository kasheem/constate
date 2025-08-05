- remove duplicate values.

- ALTER TABLE `jos_cities`
ADD UNIQUE KEY `unique_city_state` (`name`, `state_id`);


$country=JRequest::getVar('countryId',0);
if($countryId=='Others'){
    $country=JRequest::getVar('countryId_other',0);
}

$state=JRequest::getVar('stateId',0);
if($state=='Others'){
    $state=JRequest::getVar('stateId_other',0);
}

$district=JRequest::getVar('districtId',0);
if($district=='Others'){
    $district=JRequest::getVar('districtId_other',0);
}

$cityName=JRequest::getVar('cityName',0);
if($cityName=='Others'){
    $cityName=JRequest::getVar('cityName_other',0);
}

$taluka=JRequest::getVar('taluka',0);
if($taluka=='Others'){
    $taluka=JRequest::getVar('taluka_other',0);
}


Example: district
    INSERT IGNORE INTO `jos_cities`(`name`, `state_id`, `state_name`, `isDistrict`) 
    VALUES ('$district',
    (SELECT id FROM jos_states WHERE `name`='$state' LIMIT 1),
    '$state','1');

Example: city
    INSERT IGNORE INTO `jos_cities`(`name`, `state_id`, `state_name`, `isDistrict`) 
    VALUES ('$cityName',
    (SELECT id FROM jos_states WHERE `name`='$state' LIMIT 1),
    '$state','0');

Example: taluka
    INSERT IGNORE INTO `jos_cities`(`name`, `state_id`, `state_name`, `isDistrict`) 
    VALUES ('$taluka',
    (SELECT id FROM jos_states WHERE `name`='$state' LIMIT 1),
    '$state',
    '0');

get states
where countryId=

get districts 
where stateId= 
if(countr=='India'){
    and isDistrict=1
}

get cities 
where stateId=

get taluka 
where stateId=