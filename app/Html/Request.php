<?php
namespace App\Html;

class Request {
    public static function getMethod() {
        return $_SERVER['REQUEST_METHOD'];
    }

    public static function getQueryParams() {
        return $_GET;
    }
}