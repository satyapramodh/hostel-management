<?php 
session_start(); 
	require_once("include/connection.php");

	//if redirected from login.php
	if(isset($_POST['username'])){
		$user = $_POST['username'];
		$pass = $_POST['password'];
		//check
		$login = mysql_query("SELECT * FROM login
							  WHERE username = '{$user}' AND publickey = '{$pass}'");
		if(mysql_num_rows($login)>=1){
			$emp_array = mysql_fetch_array($login);
			$_SESSION['username'] = $user;
		}
		else{
			$temp=1;
		}
		if(isset($_SESSION['username']))
		header("Location: index.php");
	}	
?>
<html>
    <head>
        <title><?php echo TITLE2 ?></title>        
        <link rel="stylesheet" type="text/css" href="css/outline.css" />
        <link rel="stylesheet" type="text/css" href="css/menu.css" />	
    </head>

<body>
<div class="container">

<div id="body">
	<div align="center">
	  <?php include_once("include/left_content.php"); ?>
    </div>
	<div class="mcontent">
    <div align="center">
        <strong>Login<br></strong>
        <div id="data">
          <div align="center">
            <?php if(isset($_SESSION['username'])){
								echo "You are logged in."; }
			  				 else{
								 if(isset($temp)) echo"Incorrect Username or Password";
								echo"<form method='post' action='login.php'><table>
					  				 <tr><td style='padding:5px' >Username:</td><td style='padding:5px' ><input type='text' name='username' placeholder='Username' /></td></tr>
					  				 <tr><td style='padding:5px' >Password:</td><td style='padding:5px' ><input type='password' name='password' placeholder='password' /></td></tr>
					   				 <tr><td colspan='2' style='padding:5px;' ><input type='submit' value='submit' /></td></tr></table>
									 </form>";
			  					 }
			  		   ?>
          </div>
        </div>
    </div>
</div>
<div align="center"><!-- body ends -->
</div>
<?php 
//	require_once("include/footer.php");
?>