***REMOVED***
$autoload = __FILE__;
$autoload = str_replace(basename(__FILE__) , "", $autoload);
require_once $autoload . '../../../autoload.php';

$plugin = new SBTKProfiles();
$plugin->createHeader();
$plugin->createMyProfilePanel(array());


