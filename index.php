<?php 
	require_once("include/header.php");
?>
<div id="body">
	<?php include_once("include/left_content.php"); ?>
    <div class="rcontent">
      <h1><span> Hello<?php echo" ".ucfirst($_SESSION['username']) ?></span></h1>
        <div id="contentbox">
            <?php include_once("include/right_content.php"); ?>
        </div>
    </div>
</div>
<!-- body ends -->
<?php 
	require_once("include/footer.php");
?>