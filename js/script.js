// JavaScript Document
//select block and get bed type
function bedSel(value){
	 var xmlhttp;
	if(window.XMLHttpRequest){
		xmlhttp = new XMLHttpRequest();
	}
	else
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
		if(xmlhttp.responseText==""){
			document.getElementById('bed').style.display = "none";
			document.getElementById("bedtype").innerHTML = "Error Fetching Data please retry.";
		}
		else{
			document.getElementById('bed').style.display = "";
			document.getElementById('floor').style.display = "none"; //hide others when parent is changing
			document.getElementById('room').style.display = "none";
				document.getElementById('roommateSel').style.display = "none";
			document.getElementById("bedtype").innerHTML = xmlhttp.responseText;
		}
	}
  }
  	xmlhttp.open("GET","bedtype.php?id=1&value="+value,true);
	xmlhttp.send(); 
}

//select bedtype and get floors
function floorSel(value){
	 var xmlhttp;
	if(window.XMLHttpRequest){
		xmlhttp = new XMLHttpRequest();
	}
	else
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
		if(xmlhttp.responseText==""){
			document.getElementById('floor').style.display = "none";
			document.getElementById("floorSel").innerHTML = "Error Fetching Data please retry.";
		}
		else{
			document.getElementById('floor').style.display = "";
			document.getElementById('room').style.display = "none";
			document.getElementById('roommateSel').style.display = "none";
				document.getElementById('roommateSel').style.display = "none";
			document.getElementById("floorSel").innerHTML = xmlhttp.responseText;
		}
	}
  }
  	xmlhttp.open("GET","bedtype.php?id=2&value="+value,true);
	xmlhttp.send(); 
}



//select floor and get room numbers
function roomSel(block,floor,bed){
	var xmlhttp;
	//get bed value from radio button
	for (var i = 0; i < bed.length; i++) {       
      if (bed[i].checked) {
		var bedVal=bed[i].value;
        break;
      }
	}
	
	//add room mate div data here from bedVal js variable
	num_of_roomies = bedVal.substring(0,1);
	var query = document.getElementById("roommateSel");
  
    //document.getElementById("rowspa").setAttribute("colspan",2);
	//document.getElementById("roomateSep").setAttribute("rowspan",num_of_roomies);
	//	query.innerHTML = "<table border='1'>";
	query.innerHTML= " ";
	for(var i=1;i<num_of_roomies;i++){
		query.innerHTML+="Roommate "+i+": <input style='width:100px;'type='text' placeholder='RegNum' id='roomie"+i+"' size='5' />&nbsp;&nbsp;Public Key:&nbsp;<input style='width:100px;' type='password' id='pass"+i+"' placeholder='PubKey' size='5' /><br>";
	}
//	query.innerHTML+="</table>"; 
	//end of roommate field addition
	
	if(window.XMLHttpRequest){
		xmlhttp = new XMLHttpRequest();
	}
	else
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
		if(xmlhttp.responseText==""){
			document.getElementById('room').style.display = "none";
			document.getElementById("roomSel").innerHTML = "Error Fetching Data please retry.";
		}
		else{
				document.getElementById('roommateSel').style.display = "none";
			document.getElementById('room').style.display = "";
			document.getElementById("roomSel").innerHTML = xmlhttp.responseText;
		}
	}
  }
  	xmlhttp.open("GET","getroom.php?block="+block+"&floor="+floor+"&bed="+bedVal,true);
	xmlhttp.send(); 
}

function roommateSel(){
		document.getElementById('roommateSel').style.display="";
		document.getElementById('roommates').style.display = "";
		document.getElementById('mess').style.display = "";
	}
