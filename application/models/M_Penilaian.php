<?php
defined('BASEPATH') or exit('No direct script access allowed');

class M_Penilaian extends CI_Model
{
    public function getAll()
    {
        $this->db->select('*');
        $this->db->from('penilaian');
        $this->db->join('subkomponen', 'penilaian.id_subkomponen = subkomponen.id_subkomponen');
        $this->db->join('users', 'penilaian.id_u = users.id_u');
        $this->db->join('jabatan', 'penilaian.id_jabatan = jabatan.id_jabatan');
        $this->db->group_by('jabatan.id_jabatan');
        return $this->db->get()->result_array();
    }
    public function getNilai($id)
    {
        $this->db->select('subkomponen.id_subkomponen, subkomponen.id_komponen,subkomponen.subkomponen, subkomponen.kriteria, subkomponen.bobot, penilaian.nilai, penilaian.kualitas, penilaian.catatan, penilaian.id_jabatan, penilaian.daftar_evidence, penilaian.kesimpulan_evaluasi, penilaian.predikat');
        $this->db->from('penilaian');
        $this->db->join('subkomponen', 'penilaian.id_subkomponen = subkomponen.id_subkomponen');
        $this->db->where('penilaian.id_jabatan', $id);
        return $this->db->get()->result_array();
    }

    public function get_jabatan()
    {
        return $this->db->get('jabatan')->result();
    }

    public function detail_nilai($id)
    {
        $this->db->join('subkomponen', 'subkomponen.id_subkomponen = penilaian.id_subkomponen');
        $this->db->join('users', 'users.id_u = penilaian.id_u');
        $this->db->join('jabatan', 'jabatan.id_jabatan = penilaian.id_jabatan');
        $this->db->where('penilaian.id_jabatan', $id);
        return $this->db->get('penilaian')->row();
    }

    public function insert_nilai($nilai)
    {
        $this->db->insert_batch('penilaian', $nilai);
        $nilai['id_jabatan'] = $this->db->insert_id();
    }

    function jumlah_penilaian()
    {
        $this->db->select('*');
        $this->db->from('penilaian');
        $this->db->join('subkomponen', 'penilaian.id_subkomponen = subkomponen.id_subkomponen');
        $this->db->join('users', 'penilaian.id_u = users.id_u');
        $this->db->join('jabatan', 'penilaian.id_jabatan = jabatan.id_jabatan');
        $this->db->group_by('jabatan.id_jabatan');
        return $this->db->get()->num_rows();
    }

    public function delete($id)
    {
        $this->db->where($id);
        return $this->db->delete('penilaian');
    }

    public function belum_dinilai($id_jabatan)
    {
        $this->db->where('id_jabatan', $id_jabatan);
        return $this->db->get('penilaian')->row();
    }
}

/* End of file M_Penilaian.php */
/* Location: ./application/models/M_Penilaian.php */