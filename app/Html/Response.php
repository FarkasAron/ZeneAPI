<?php
namespace App\Html;

class Response {
    public function send($data, $status = 200) {
        http_response_code($status);
        header("Content-Type: application/json; charset=UTF-8");
        echo json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
        exit;
    }
}