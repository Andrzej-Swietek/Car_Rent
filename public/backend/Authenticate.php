<?php
    session_start();
    require_once "Headers.php";
    require_once "DB.php";
    
    if (  ( !isset($_POST['login']) ) || ( !isset($_POST['password']) )  ) {
        echo '{"success":"false","message":"No user credientials", "login":"'.$_GET['login'].'", "password":"'.$_GET['password'].'"}';
        exit();
    }


    try {
        $db = @new mysqli($host, $db_user, $db_password, $db_name);
        if ($db->connect_errno!=0) {
            echo "Error: ".$db->connect_errno;
            echo '{"success":"false","message":"DB ERROR"}';
        } else {
            $login = $_POST['login'];
            $password = $_POST['password'];
            $login = htmlentities($login, ENT_QUOTES, "UTF-8");
            
            if ($result = @$db->query( sprintf("SELECT * FROM users WHERE `Login`='%s'", mysqli_real_escape_string($db,$login)) )) {
                $number_of_results = $result->num_rows;
                if($number_of_results > 0) {
                    $row = $result->fetch_assoc();
                    if (password_verify($password, $row['Password'])) {

                        // SET COOKIES
                        $json = json_encode($row);
                        // setcookie("user_id",$row['ID']);
                        // setcookie("user_nickname",$row['Nickname']);
                        // setcookie("user_login",$row['Login']);
                        // setcookie("user_role",$row['Role']);

                        $result->free_result();
                        echo '{"success":"true","message":"LOGGED IN","user_id":"'.$row['ID'].'","user_nickname":"'.$row['Nickname'].'","role":"'.$row['Role'].'"}';
                        
                    } else {
                        echo '{"success":"false","message":"WRONG PASSWORD"}';
                    }
                } else {
                    echo '{"success":"false","message":"ERROR"}';
                }
            }

            
        }

        $db->close();
    } catch(Exception $e) {
        echo '{"success":"false","message":"SERVER ERROR"}';
    }
    