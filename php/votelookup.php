<?php
include_once ( 'shared/common.php' ) ;


// UNION SELECT TOO SLOW; WE CANNOT SAVE ALL VOTES IN ONE TABLE
// BECAUSE USER IDS AND NAMES MAY CLASH ...
function fetchData( $db, $sql ) {
	$tables = array(
		'octoeye',
		'octoeye_meta'
	);

	$ret = array();

	foreach ( $tables as $table ) {
		$sqlTable = str_replace( '%table%', $table, $sql );

		if (!$result = $db->query($sqlTable)) {
			return; // [' . $db->error . ']
		}

		while ($row = $result->fetch_assoc()) {
			$ret[] = $row;
		}
	}

	return $ret;
}

function votelookup( $constraint, $groupBy ) {
	$res = array();

	// INPUT VALIDATION
	$db = openToolDB('krakenbase_p', '');

	if ( strlen( $constraint ) > 255 || preg_match( '/(SELECT.+)|(DROP.+)|(ALTER.+)|(UNION.+)|(INSERT.+)|(\{|\}|;|%)/', $constraint ) ) {
		return 'Invalid username/ballot/subject supplied. Attempted SQL injection not tolerated.';
	}
	$constraint = $db->real_escape_string( $constraint );


	if ( strlen( $groupBy ) > 50 || !preg_match( '/^(|ballot)$/', $groupBy ) ) {
		return 'Invalid grouping specified. Allowed are ballot, ';
	}

	switch ($groupBy) {
		case 'ballot':
			$sql = "SELECT `vt_id`, `vt_diff`, `b_starttime`, `vt_timestamp`, `s_url`, `s_name` FROM %table% WHERE u_name='$constraint';";
			break;
		default:
			$sql = "SELECT * FROM %table% WHERE u_name='$constraint';";
			break;
	}

	$result = fetchData( $db, $sql );
	if ( !isset($result) ) {
		return 'There was an error running the query.'; // [' . $db->error . ']
	}

	switch ($groupBy) {
		case 'ballot':
			$ballots = array();
			$sqlBallot = 'SELECT * FROM ballots ORDER BY b_starttime DESC;';
			if (!$resultBallot = $db->query($sqlBallot)) {
				return 'There was an error running the ballot-query.'; // [' . $db->error . ']
			}

			while ($ballotRow = $resultBallot->fetch_assoc()) {
				$b_id = $ballotRow['b_starttime'];
				$ballots[$b_id] = $ballotRow;
				$ballots[$b_id]['votes'] = array();
			}

			foreach ( $result as $row ) {
				$b_id = $row['b_starttime'];
				$ballots[$b_id]['votes'][] = $row;
			}

			$res['ballots'] = (object) $ballots;
			break;
	  break;
		default:
			$res['votes'] = array();
			foreach ( $result as $row ) {
				$res['votes'][] = $row;
			}
			break;
	}
	
	return $res;
}


function listballots() {
	$res = array();

	$sql = 'SELECT * FROM ballots ORDER BY b_starttime;';

	$db = openToolDB( 'krakenbase_p', '' );

	if (!$result = $db->query($sql)) {
		return 'There was an error running the query.'; // [' . $db->error . ']
	}

	while ($row = $result->fetch_assoc()) {
		$res[] = $row;
	}

	return $res;
}
?>
