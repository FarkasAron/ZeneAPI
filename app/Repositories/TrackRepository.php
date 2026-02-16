<?php
namespace App\Repositories;

class TrackRepository extends BaseRepository {
    
    public function __construct($db) {
        parent::__construct($db);
        $this->table = 'tracks'; // Beállítjuk a tábla nevét a BaseRepository számára
    }

    public function getAll() {
        $result = $this->db->query("SELECT * FROM {$this->table}");
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function create($data) {
        $stmt = $this->db->prepare("INSERT INTO {$this->table} (album_id, track_number, title, duration_seconds, total_streams) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("iissi", 
            $data['album_id'], 
            $data['track_number'], 
            $data['title'], 
            $data['duration_seconds'], 
            $data['total_streams']
        );
        return $stmt->execute();
    }

    public function update($id, $data) {
        $stmt = $this->db->prepare("UPDATE {$this->table} SET album_id = ?, track_number = ?, title = ?, duration_seconds = ?, total_streams = ? WHERE id = ?");
        $stmt->bind_param("iissii", 
            $data['album_id'], 
            $data['track_number'], 
            $data['title'], 
            $data['duration_seconds'], 
            $data['total_streams'], 
            $id
        );
        return $stmt->execute();
    }

    public function delete($id) {
        $stmt = $this->db->prepare("DELETE FROM {$this->table} WHERE id = ?");
        $stmt->bind_param("i", $id);
        return $stmt->execute();
    }
}