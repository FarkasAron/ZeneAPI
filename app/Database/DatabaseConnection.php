<?php
namespace App\Database;

class DatabaseConnection {
    private $conn;

    public function __construct() {
        // Győződj meg róla, hogy a név 'zenek', ahogy az SQL dumpban volt!
        $this->conn = new \mysqli("127.0.0.1", "root", "", "zenek");
        
        if ($this->conn->connect_error) {
            die("Hiba az adatbázis csatlakozásakor: " . $this->conn->connect_error);
        }
    }

    public function getConnection() {
        return $this->conn;
    }
}