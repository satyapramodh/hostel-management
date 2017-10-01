<div id="right_content">
<div id="content">
	<form action="success.php" method="post">
    <table id="hostel" border="0">
    <tr><td style="width:120px">Block:</td>
    <td style="float:left"><!--width:150px; -->
    <select name="block" id="block" onchange="bedSel(this.value)">
    <option value="" selected="selected">--Select Block--</option>
    <option value="BAN">BAN</option>
    <option value="D">D</option>
    <option value="DAN">DAN</option>
    <option value="E">E</option>
    <option value="G">G</option>
    <option value="H">H</option>
    <option value="J">J</option>
    <option value="K">K</option>
    <option value="L">L</option>
    <option value="M">M</option>
    <option value="N">N</option>
    </select></td></tr>
    <tr id="bed" style="display:none"><td>Bed Type:</td><td><span id="bedtype"></span></td></tr>
	<tr id="floor" style="display:none"><td>Floor:</td><td><span id="floorSel"></span></td></tr>
    <tr id="room" style="display:none"><td>Room:</td><td id="rowspa"><span id="roomSel"></span></td></tr>
	<tr id="roommates" style="display:none"><td id="roomateSep">Roomates:</td><td><div id="roommateSel"></div></td></tr>
    <tr id="mess" style="display:none"><td>Mess:</td><td id="messSel">
	<select name="mess">
	<option value="sv">South Veg</option>
	<option value="snv">South Non-Veg</option>
	<option value="nv">North-Veg</option>
	<option value="nnv">North Non-Veg</option>
	<option value="spl">Special</option>
	</select>
	<input type="submit" value="submit" onClick="alert('Yet to validate')" />
	</td></tr>
    </table>
    </form>
</div>
</div>