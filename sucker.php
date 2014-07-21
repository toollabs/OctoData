<?php
$tool_user_name = 'octodata';

include_once ( 'shared/common.php' ) ;
error_reporting( E_ALL & ~E_NOTICE ); # Don't clutter the directory with unhelpful stuff

$prot = getProtocol();
if ( array_key_exists( 'HTTP_ORIGIN', $_SERVER ) ) {
	$origin = $_SERVER['HTTP_ORIGIN'];
}


// Response Headers
header('Content-type: application/json; charset=utf-8');
header('Cache-Control: private, s-maxage=0, max-age=0, must-revalidate');
header('x-content-type-options: nosniff');
header('X-Frame-Options: SAMEORIGIN');
header('X-JSONAPI-VERSION: 0.0.0.0');
  
if ( isset( $origin ) ) {
	// Check protocol
	$protOrigin = parse_url( $origin, PHP_URL_SCHEME );
	if ($protOrigin != $prot) {
		header('HTTP/1.0 403 Forbidden');
		if ('https' == $protOrigin) {
			echo '{"error":"Please use this service over https."}';
		} else {
			echo '{"error":"Please use this service over http."}';
		}
		exit;
	}
	
	// Do we serve content to this origin?
	if ( matchOrigin( $origin ) ) {
		header('Access-Control-Allow-Origin: ' . $origin);
		header('Access-Control-Allow-Methods: GET');
	} else {
		header('HTTP/1.0 403 Forbidden');
		echo '{"error":"Accessing this tool from the origin you are attempting to connect from is not allowed."}';
		exit;
	}
}

// There are more clever ways to achieve this but for now, it should be sufficient
$action = '';
if ( array_key_exists('action', $_REQUEST) ) {
	$action = $_REQUEST['action'];
}
switch ($action) {
	case 'listballots':
		include_once ( 'php/votelookup.php' );
		$res['listballots'] = listballots();
		break;

	case 'votelookup':
		include_once ( 'php/votelookup.php' );
		$username = '';
		$groupBy = '';
		
		if ( array_key_exists('username', $_REQUEST) ) {
			$username = ucfirst ( $_REQUEST['username'] );
		}
		if ( array_key_exists('groupby', $_REQUEST) ) {
			$groupBy = $_REQUEST['groupby'];
		}
		$res['votelookup'] = votelookup( $username, $groupBy );
		break;
	default:
		header('HTTP/1.0 501 Not implemented');
		$res['error'] = 'Unknown action "' . $action . '". Allowed are votelookup, .';
		break;
}
if (!isset( $res )) {
	$res[] = array();
}
echo json_encode($res);
?>
