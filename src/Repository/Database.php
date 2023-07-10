<?php

namespace App\Repository;

class Database
{

    public static function getConnection()
    {
        return new \PDO("mysql:host=localhost;dbname=projet_parfum", "root", "");

    }
}