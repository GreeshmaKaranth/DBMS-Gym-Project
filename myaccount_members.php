<html>
<head>
	<title>My Account</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="navbar.css">
	<style>

.navbar {
  width: 100%;
  background-color: black;
  overflow: auto;
}

.navbar a {
  float: left;
  padding: 12px;
  color: white;
  text-decoration: none;
  font-size: 17px;
}

.navbar a:hover {
  background-color: lightgrey;
  color: black;
}

.active {
  background-color: grey;
  color: black;
}

@media screen and (max-width: 500px) {
  .navbar a {
    float: none;
    display: block;
  }
}

body{
  font-size:30px;
}
</style>

</head>
<body>
  <div class="navbar">
  <a href="home.html"><i class="fa fa-home"></i> &nbsp;Home</a>
  <a href="about.html"><i class="fa fa-question-circle"></i> &nbsp;About Us</a> 
  <a href="merch.html"><i class="fa fa-shopping-bag"></i> &nbsp;Merchandise</a> 
  <a href="contact.html"><i class="fa fa-fw fa-envelope"></i> &nbsp;Contact</a> 
</div>
<br><br>
<?php
 $con=pg_connect("host=localhost dbname=newgym user=postgres");
  // if(!$con){
  //   echo 'Not connected'.'<br>';
  // }
  // else{
  //   echo 'Connected'.'<br>';
  // }

   //if(isset($_POST['submit'])){
   $name=$_POST['firstname'];
   $phone=$_POST['phone'];
   $email=$_POST['email'];
   $dob=$_POST['dob'];
   $gender=$_POST['gender'];
   $weight=$_POST['weight'];
   $height=$_POST['height'];
   $startdate=$_POST['startdate'];
   $pack=$_POST['pack'];

   $mid = 'M'.'0'.rand(100,999);
   // $tid = 'T'.'0'.rand(10,99);
   // echo $name.$phone.$email.$dob.$gender.$weight.$height.$startdate;

   $sql=<<<EOF

   INSERT INTO MEMBERS(Mem_ID, Phone, M_Name, Start_Date, Sex, Weight_in_kg, Height_in_cm, Date_Of_Birth, Email_ID, Pack_ID, End_Date, Trainer_ID) VALUES ('$mid', '$phone', '$name', '$startdate', '$gender', '$weight', '$height', '$dob', '$email', '$pack', '$startdate', 'T032');

EOF;

if(!pg_query($con,$sql)){
      echo "<center><br><b style=\"color:red\">";
      echo ' Oops! There seems to be some error in registering you. </b><br>If you are already registered, your details will be displayed here else please, try again later!';
      echo "</center><br><br>";
     }
      else{
      echo "<center><h2 style=\"color:green\"> Congratulations!</h2>You have successfully joined Kiran's Gym as a <b>MEMBER!</b></center> \n" ;
      echo "<br><br>";

     }

 $sql1=<<<EOF
   select * from Members where Email_ID = '$email';
EOF;

  echo "<center><b>Here are your details: <br><br></b>";
   $ret = pg_query($con, $sql1);
   if(!$ret) {
      echo pg_last_error($con);
      exit;
   } 
   while($row = pg_fetch_row($ret)) {
      echo " ID = ". $row[0] . "<br>";
      echo " PHONE = ". $row[1] ."<br>";
      echo " NAME = ". $row[2] ."<br>";
      echo " START DATE =  ".$row[3] ."<br>";
      echo " GENDER =  ".$row[4] ."<br>";
      echo " WEIGHT =  ".$row[5] ." kg<br>";
      echo " HEIGHT =  ".$row[6] ." cm<br>";
      echo " DATE OF BIRTH =  ".$row[7] ."<br>";
      echo " EMAIL ID =  ".$row[8] ." <br>";
      echo " PACK ID =  ".$row[9] ." <br>";
      echo " END DATE =  ".$row[10] ." <br>";
      echo " TRAINER ID =  ".$row[11] ." <br><br>";
      echo "</center>";
   }

//    $sql2=<<<EOF
//    select exercise_ID from consist where pack_ID='$pack';
// EOF;

//   $val = pg_query($con, $sql2);
//      if(!$val) {
//       echo pg_last_error($con);
//       exit;
//    } 

//    $i = 0;
//    $vals = array("1", "2", "3", "4");

//    while($rows = pg_fetch_row($val)) {
//       $vals[$i] = $rows[0];
//       $i = $i+1;
//    }

//    echo "<center>Exercises chosen: <br>";
//    for($x = 0; $x < $i; $x++) {

//    $sql3 = <<<EOF
//    select ex_name, type from exercises where ex_id='$vals[$x]';
// EOF;

//   $new = pg_query($con, $sql2);
//      if(!$new) {
//       echo pg_last_error($con);
//       exit;
//    } 

//    while($rowd = pg_fetch_row($new)) {
//     echo "Name: ".$new[0]."<br>";
//     echo "Type: ".$new[1]."<br><br>";
//    }
// }

// echo "</center>"
?>

<script>
  alert("You will automatically be logged off when you close this window.")
</script>
  <!-- DISPLAY MEMBER_ID, MEMBER_NAME, START DATE, BMI using PHP -->
  <!-- DISPLAY PACK CHOSEN AND DETAILS LIKE NUMBER_OF_MONTHS, EXERCISES CHOSEN -->
  <!-- Subscription pack has the number of exercises that a member can take. A member can choose the exercise he wants to take? -->

</body>
</html>