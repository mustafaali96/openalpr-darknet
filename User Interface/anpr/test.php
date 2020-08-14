<?php
    
        if($_SERVER['REQUEST_METHOD'] == 'POST')
        {
        $uname = $_POST['username'];
        $pwd = $_POST['password'];
        $uname = htmlspecialchars($uname);
        $pwd = htmlspecialchars($pwd);
        $user = "root";
        $pass = "";
        $database = "openanpr";
        $link = mysql_connect( "localhost", $user, $pass );
        if(!$link)
        {
            die ( "Could not connect to MySQL : " .mysql_error() );
        }
        mysql_select_db ($database, $link) or die ( "Could not select MySQL $database : " .mysql_error() );
        $result = mysql_query( "SELECT * FROM users WHERE username = '$uname' AND password = '$pwd'" );
        while($row = mysql_fetch_array($result))
        {
        if($row["username"] == $uname && $row["password"] == $pwd)
        {
        echo "Welcome $uname";
        }
        else
        {
        echo "Username and Password does not match";
        }
        }
        }
    ?>