<?php
namespace App\Repositories;

class BandRepository extends BaseRepository {
    
    public function getAll() {
        $result = $this->db->query("SELECT * FROM bands");
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function create($data) {
        $stmt = $this->db->prepare("INSERT INTO bands (name, genre_primary) VALUES (?, ?)");
        $stmt->bind_param("ss", 
            $data['name'], 
            $data['genre']);
        return $stmt->execute();
    }

    public function update($id, $data) {
        $stmt = $this->db->prepare("UPDATE bands SET name = ?, genre_primary = ? WHERE id = ?");
        $stmt->bind_param("ssi", 
            $data['name'], 
            $data['genre'], $id);
        return $stmt->execute();
    }

    public function delete($id) {
        $stmt = $this->db->prepare("DELETE FROM bands WHERE id = ?");
        $stmt->bind_param("i", $id);
        return $stmt->execute();
    }
}