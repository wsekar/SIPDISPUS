<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Jabatan extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('M_Jabatan', 'jabatan');
    }

    public function index()
    {
        if (!$this->session->userdata('level') == 'Admin') {
            redirect('auth');
        } else {
            $data['jabatan'] = $this->jabatan->getAll();
            $data['title'] = 'DINAS PERPUSTAKAAN DAN KEARSIPAN';
            $this->load->view('admin/layout/header', $data);
            $this->load->view('admin/layout/sidebar');
            $this->load->view('admin/jabatan/index', $data);
            $this->load->view('admin/layout/footer');
        }
    }

    public function tambah()
    {
        if (!$this->session->userdata('level') == 'Admin') {
            redirect('auth');
        } else {
            $data['title'] = 'Tambah Data Jabatan';
            $this->form_validation->set_rules(
                'jabatan',
                'Jabatan',
                'required',
                array('required' => 'Nama Jabatan harus diisi')
            );
            $this->form_validation->set_rules(
                'bidang',
                'Bidang',
                'required',
                array('required' => 'Informasi Bidang harus diisi')
            );
            $this->form_validation->set_rules(
                'nama_lengkap',
                'Nama Lengkap',
                'required',
                array('required' => 'Informasi Nama Lengkap harus diisi')
            );
            $this->form_validation->set_rules(
                'nip',
                'Nip',
                'required|min_length[9]|max_length[18]',
                array('required' => 'Nip harus diisi', 'min_length' => '{field} setidaknya {param} karakter.', 'max_length' => '{field} maksimal {param} karakter')
            );

            if ($this->form_validation->run() == false) {
                $this->load->view('admin/layout/header', $data);
                $this->load->view('admin/layout/sidebar');
                $this->load->view('admin/jabatan/tambah', $data);
                $this->load->view('admin/layout/footer');
            } else {
                $jabatan = $this->input->post('jabatan');
                
                $bidang = $this->input->post('bidang');
                $nama_lengkap = $this->input->post('nama_lengkap');
                $nip = $this->input->post('nip');

                $data = array(
                    'jabatan' => $jabatan,
                    'bidang' => $bidang,
                    'nama_lengkap' => $nama_lengkap,
                    'nip' => $nip
                );

                $this->jabatan->add($data, 'jabatan');
                $this->session->set_flashdata('message', '
        <div class="alert alert-success alert-dismissible" role="alert">
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        <i class="fas fa-check-circle"></i>
        Data <strong>Jabatan</strong> berhasil ditambahkan!
        </div>
        ');
                redirect('admin/jabatan');
            }
        }
    }

    public function edit($id)
    {
        if (!$this->session->userdata('level') == 'Admin') {
            redirect('auth');
        } else {
            $data['title'] = 'Edit Data Jabatan';
            $data['jabatan'] = $this->jabatan->getById($id);
            $this->form_validation->set_rules(
                'jabatan',
                'Jabatan',
                'required',
                array('required' => 'Nama Jabatan harus diisi')
            );
            $this->form_validation->set_rules(
                'bidang',
                'Bidang',
                'required',
                array('required' => 'Informasi Bidang harus diisi')
            );
            $this->form_validation->set_rules(
                'nama_lengkap',
                'Nama Lengkap',
                'required',
                array('required' => 'Informasi Nama Lengkap harus diisi')
            );
            $this->form_validation->set_rules(
                'nip',
                'Nip',
                'required|min_length[9]|max_length[18]',
                array('required' => 'Nip harus diisi', 'min_length' => '{field} setidaknya berisi {param} karakter.', 'max_length' => '{field} maksimal berisi {param} karakter')
            );


            if ($this->form_validation->run() == false) {
                $this->load->view('admin/layout/header', $data);
                $this->load->view('admin/layout/sidebar');
                $this->load->view('admin/jabatan/edit', $data);
                $this->load->view('admin/layout/footer');
            } else {
                $this->jabatan->update($id);
                $this->session->set_flashdata('message', '
            <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            <i class="fas fa-check-circle"></i>
            Data <strong>Jabatan</strong> berhasil diupdate!
            </div>
            ');
                redirect('admin/jabatan');
            }
        }
    }

    public function hapus($id)
    {
        $this->jabatan->delete(['id_jabatan' => $id]);
        $this->session->set_flashdata('message', '
        <div class="alert alert-success alert-dismissible" role="alert">
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        <i class="fas fa-check-circle"></i>
        Data <strong>Jabatan</strong> berhasil dihapus!
        </div>
        ');
        redirect('admin/jabatan');
    }

    public function get_jabatan()
    {
        $id = $this->input->post('id_jabatan');

        $jabatan = $this->jabatan->lihat_id($id);
        echo json_encode($jabatan);
    }
}
