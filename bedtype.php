<?php
//if id=1 then bedtype
if(isset($_GET['id']) && ($_GET['id']==1)){

 //blocks and its bed types
 $block=array(
	"BAN"=>array("1bed"),
	"D"=>array("2bed"),
	"DAN"=>array("1bed"),
	"E"=>array("2bed"),
	"G"=>array("1bed","4bed"),
	"H"=>array("1bed","2bed"),
	"J"=>array("1bed","2bed"),
	"K"=>array("6bed"),
	"L"=>array("2bed","6bed"),
	"M"=>array("1bed","2bed"),
	"N"=>array("1bed","2bed")
 );
 
 if(isset($_GET['value']) && $_GET['value']!=NULL){
	//for bedtype retrival
	for($i=0;$i<count($block[$_GET['value']]);$i++){
		echo "<input type='radio' name='bedVal' value='".$block[$_GET['value']][$i]."' onclick='floorSel(\"{$_GET['value']}\")' />&nbsp;".$block[$_GET['value']][$i] ."&nbsp;&nbsp;";
	} 
 }
}

//if id=2 then get floors
if(isset($_GET['id']) && $_GET['id']==2){
	if(isset($_GET['value']) && $_GET['value']!=NULL){
		$floor=array(
			"BAN"=>3,
			"D"=>3,
			"DAN"=>5,
			"E"=>4,
			"G"=>6,
			"H"=>10,
			"J"=>10,
			"K"=>9,
			"L"=>10,
			"M"=>10,
			"N"=>10
		);
		echo"<select name='floorVal' onchange='roomSel(\"{$_GET['value']}\",this.value,document.getElementsByName(\"bedVal\"))' >";
			for($i=0;$i<=$floor[$_GET['value']];$i++){
				if($i==0) echo"<option value=''>--Select Floor--</option>";
				else echo"<option value='{$i}'>{$i} "."Floor</option>";
			}
		echo"</select>";
	}
}

?>