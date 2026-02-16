<?php
namespace App\Repositories;

class AlbumRepository extends BaseRepository {
    
    public function getAll() {
        $result = $this->db->query("SELECT * FROM albums");
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function create($data) {
        $stmt = $this->db->prepare("INSERT INTO albums (band_id, title, release_year) VALUES (?, ?, ?)");
        $stmt->bind_param("isi", $data['band_id'], $data['title'], $data['release_year']);
        return $stmt->execute();
    }
    
    public function update($id, $data) {
        $stmt = $this->db->prepare("UPDATE albums SET band_id = ?, title = ?, release_year = ? WHERE id = ?");
        $stmt->bind_param("isii", $data['band_id'], $data['title'], $data['release_year'], $id);
        return $stmt->execute();
    }

    public function delete($id) {
        $stmt = $this->db->prepare("DELETE FROM albums WHERE id = ?");
        $stmt->bind_param("i", $id);
        return $stmt->execute();
    }
}