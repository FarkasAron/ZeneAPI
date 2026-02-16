<?php
require_once __DIR__ . '/vendor/autoload.php';

use App\Database\DatabaseConnection;
use App\Html\Response;

$db = (new DatabaseConnection())->getConnection();
$response = new Response();

// URL kiolvasása és tisztítása
$requestUri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$path = explode('/', trim($requestUri, '/'));

$resource = $path[0] ?? null;
$id = (isset($path[1]) && is_numeric($path[1])) ? (int)$path[1] : null;
$method = $_SERVER['REQUEST_METHOD'];

// Router
$repo = null;
switch ($resource) {
    case 'albums':
        $repo = new App\Repositories\AlbumRepository($db);
        break;
    case 'bands':
        $repo = new App\Repositories\BandRepository($db);
        break;
    case 'artists':
        $repo = new App\Repositories\ArtistRepository($db);
        break;
    case 'tracks':
        $repo = new App\Repositories\TrackRepository($db);
        break;
    default:
        $response->send(["error" => "Resource not found"], 404);
}

// Kontroller logika
try {
    switch ($method) {
        case 'GET':
            // Ha van ID az URL-ben, csak azt az egyet kérjük le (opcionális fejlesztés)
            // Most egyelőre maradunk az összesnél:
            $response->send($repo->getAll());
            break;

        case 'POST':
            $data = json_decode(file_get_contents('php://input'), true);
            $repo->create($data) ? $response->send(["msg" => "Created"], 201) : $response->send(["err" => "Fail"], 400);
            break;

        case 'PUT':
            if (!$id) $response->send(["error" => "ID is required in URL"], 400);
            $data = json_decode(file_get_contents('php://input'), true);
            $repo->update($id, $data) ? $response->send(["msg" => "Updated"]) : $response->send(["err" => "Fail"], 400);
            break;

        case 'DELETE':
            if (!$id) $response->send(["error" => "ID is required in URL"], 400);
            $repo->delete($id) ? $response->send(["msg" => "Deleted"]) : $response->send(["err" => "Fail"], 400);
            break;
    }
} catch (Exception $e) {
    $response->send(["error" => $e->getMessage()], 500);
}