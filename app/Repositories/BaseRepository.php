<?php
namespace App\Repositories;

abstract class BaseRepository {
    protected $db;
    protected $table;

    public function __construct($db) {
        $this->db = $db;
    }
}