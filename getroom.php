<?php 
include("include/connection.php");
if(isset($_GET['block']) && isset($_GET['floor']) && $_GET['block']!=NULL && $_GET['floor']!=NULL && isset($_GET['bed']) && $_GET['bed']!=NULL){
		$query = "select * from {$_GET['bed']} where flag > 0 and block ='{$_GET['block']}' and room like '{$_GET['floor']}%'";
		
		//select room onchange="getRoommate($_GET['bed'])"
		$roomSet = mysql_query($query);
		if(@mysql_num_rows($roomSet)>0){
			while($room = mysql_fetch_array($roomSet)){
				echo "<input type='radio' name='room' value='{$room['room']}' onchange='roommateSel()'  />{$room['room']}&nbsp;&nbsp;&nbsp;";
			}
		}
		else{
			echo"No rooms available.";
		}
}
?>