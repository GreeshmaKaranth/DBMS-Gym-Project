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
   $email=$_POST['email'];
   $experience=$_POST['firstname1'];
   $startdate=$_POST['startdate'];
   $gender=$_POST['gender'];
   $phone=$_POST['phone'];

   $tid = 'T'.'0'.rand(10,99);
   // echo $tid;
   // $comments=$_POST['comments']

   $exid = 'EX0'.rand(1,5);

   $sql=<<<EOF

   INSERT INTO TRAINERS (T_ID, T_Name, Email_ID, Sex, Join_Date, Experience_in_Years, Salary) VALUES ('$tid','$name','$email','$gender','$startdate',$experience,'25000');
   INSERT INTO PHONE(Phone_No, Trainer_ID) VALUES ($phone,'$tid');
   INSERT INTO CONDUCT(Exercise_ID, Trainer_ID) VALUES ($exid, $tid);

EOF;

if(!pg_query($con,$sql)){
      echo "<center><br><b style=\"color:red\">";
      echo ' Oops! There seems to be some error in registering you. </b><br>If you are already registered, your details will be diplayed here else please, try again later!';
      echo "</center><br><br>";
     }
      else{
      echo "<center><h2 style=\"color:green\"> Congratulations!</h2>You have successfully joined Kiran's Gym as a <b>TRAINER!</b></center> \n" ;
      echo "<br><br>";

     }

 $sql1=<<<EOF
   select * from Trainers where Email_ID = '$email';
EOF;

  echo "<center><b>Here are your details: <br><br></b>";
   $ret = pg_query($con, $sql1);
   if(!$ret) {
      echo pg_last_error($con);
      exit;
   } 
   while($row = pg_fetch_row($ret)) {
      echo " ID = ". $row[0] . "<br>";
      echo " NAME = ". $row[1] ."<br>";
      echo " EMAIL = ". $row[2] ."<br>";
      echo " SEX =  ".$row[3] ."<br>";
      echo " START DATE =  ".$row[4] ."<br>";
      echo " EXPERIENCE =  ".$row[5] ." years<br>";
      echo " SALARY (In Rupees/Month)=  ".$row[6] ."<br><br>";
      echo "</center>";
   }
   // echo "Operation done successfully\n";




?>
<script>
  alert("You will automatically be logged off when you close this window.")
</script>
  <!-- DISPLAY TRAINER_ID, TRAINER_NAME, JOIN DATE, SPECIALIZATION, SALARY using PHP -->
</body>
</html>