<?php
namespace App\Repositories;

class ArtistRepository extends BaseRepository {
    
    public function __construct($db) {
        parent::__construct($db);
        $this->table = 'artists';
    }

    public function getAll() {
        $result = $this->db->query("SELECT * FROM artists");
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function create($data) {
        $stmt = $this->db->prepare("INSERT INTO artists (full_name, birth_year, birth_country) VALUES (?, ?, ?)");
        $stmt->bind_param("sis", $data['full_name'], $data['birth_year'], $data['birth_country']);
        return $stmt->execute();
    }

    public function update($id, $data) {
        $stmt = $this->db->prepare("UPDATE artists SET full_name = ?, birth_year = ?, birth_country = ? WHERE id = ?");
        $stmt->bind_param("sisi", $data['full_name'], $data['birth_year'], $data['birth_country'], $id);
        return $stmt->execute();
    }

    public function delete($id) {
        $stmt = $this->db->prepare("DELETE FROM artists WHERE id = ?");
        $stmt->bind_param("i", $id);
        return $stmt->execute();
    }
}