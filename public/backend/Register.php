
<?php
  

    // session_start();
    if ( isset($_POST["login"]) && isset($_POST["password"]) ) {
        if ((strlen($_POST["login"])<3) || (strlen($_POST["login"])>20)) $valid = true;
        if ((strlen($_POST["password"])<3) || (strlen($_POST["password"])>20)) $valid = true;

        $hashed_password = password_hash($_POST["password"], PASSWORD_DEFAULT);

        require_once "DB.php";
        require_once "Headers.php";

    
        $login = $_POST["login"];
        $nickname = $_POST["nickname"];
        $role = $_POST["role"];
        if( $nickname == "" ) $nickname = "xxx";
        if( $role == "" ) $role = "client";
       
        // $db = @new mysqli($host, $db_user, $db_password, $db_name);
        // if ($db->connect_errno!=0) throw new Exception(mysqli_connect_errno());
        // $select_query = "SELECT * FROM users WHERE Login=$login OR Nickname=$nickname";
        // $result = $db->query($select_query);
        // $db->close();

        // if($result->num_rows > 0) $valid = false;

        try {
            if (true) {
                $db = @new mysqli($host, $db_user, $db_password, $db_name);
                if ($db->connect_errno!=0) throw new Exception(mysqli_connect_errno());
                $query = "INSERT INTO users VALUES (NULL,'$nickname','$login','$hashed_password','$role');";
                $db->query($query);
                $db->close();
                echo '{"success":"true","message":"USER ADDED","query":"'.$query.'"}';
            }
            else {
                echo '{"success":"false","message":"USER EXIST OR INVALID DATA"}';
                exit();
            }
        } catch (Exception $e){ echo '{"success": "false","message":"ERROR"'.$e.'}';   exit();}
    } else {
        echo '{"success": "false,"message":"BRAK LOGINU I HASLA"}';
        exit();
    }
