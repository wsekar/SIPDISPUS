<?php


class M_Jabatan extends CI_Model
{
    public function getAll()
    {
        $this->db->order_by('id_jabatan', 'asc');
        return $this->db->get('jabatan')->result_array();
    }

    public function add($data, $tabel)
    {
        $this->db->insert($tabel, $data);
    }

    public function getById($id)
    {
        return $this->db->get_where('jabatan', ['id_jabatan' => $id])->row_array();
    }

    public function update($id)
    {
        $data['jabatan'] = $this->db->get_where('jabatan', ['id_jabatan' => $id])->row_array();



        $data = [
            'jabatan' =>  $this->input->post('jabatan', true),
            'bidang' => $this->input->post('bidang', true),
            'nama_lengkap' => $this->input->post('nama_lengkap', true),
            'nip' => $nip = $this->input->post('nip', true)
        ];
        $this->db->where('id_jabatan', $this->input->post('id_jabatan'));
        $this->db->update('jabatan', $data);
    }

    public function delete($id)
    {
        $this->db->where($id);
        return $this->db->delete('jabatan');
    }

    public function lihat_id($id)
    {
        return $this->db->get_where('jabatan', ['id_jabatan' => $id])->row();
    }
    function jumlah_jabatan()
    {

        $query = $this->db->get('jabatan');
        return $query->num_rows();
    }
}

