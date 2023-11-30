<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Ternilai extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('M_Users', 'users');
        $this->load->model('M_Jabatan', 'jabatan');
    }

    public function index()
    {
        $data['users'] = $this->users->getAllTernilai();
        $data['title'] = 'Data Users Ternilai';
        $this->load->view('admin/layout/header', $data);
        $this->load->view('admin/layout/sidebar');
        $this->load->view('admin/ternilai/index', $data);
        $this->load->view('admin/layout/footer');
    }
    public function tambah()
    {
        $data['title'] = 'Tambah Data User Ternilai';
        $data['jabatan'] = $this->jabatan->getAll();

        $this->form_validation->set_rules(
            'id_jabatan',
            'Nama Jabatan',
            'required',
            array('required'=>'Nama Jabatan harus diisi')
        );
        $this->form_validation->set_rules(
            'nama_user',
            'Nama User',
            'required',
            array('required' => 'Nama User harus diisi')
        );
        $this->form_validation->set_rules(
            'username',
            'Username',
            'required|is_unique[users.username]',
            array('required' => 'Informasi Username harus diisi', 'is_unique' => 'Username yang dimasukkan sudah terdaftar')
        );
        $this->form_validation->set_rules(
            'password',
            'Password',
            'required|min_length[8]',
            array('required' => 'Password harus diisi', 'min_length' => 'Panjang password yang dimasukkan adalah minimal 8 karakter')
        );


        if ($this->form_validation->run() == false) {
            $this->load->view('admin/layout/header', $data);
            $this->load->view('admin/layout/sidebar');
            $this->load->view('admin/ternilai/tambah', $data);
            $this->load->view('admin/layout/footer');
        } else {
            $id_jabatan = $this->input->post('id_jabatan');
            $nama_user = $this->input->post('nama_user');
            $username = $this->input->post('username');
            $password = $this->input->post('password');
            $foto_profil = $_FILES['foto_profil'];
            if ($foto_profil = '') {
            } else {
                $config['upload_path'] = './assets/img/profil';
                $config['allowed_types'] = 'jpeg|jpg|png';
                $config['max_size'] = 10048;
                $config['encrypt_name'] = TRUE;
                $this->load->library('upload', $config);
                if (!$this->upload->do_upload('foto_profil')) {
                    echo "Upload Gagal, Harap Mengisi Semua Data";
                    die();
                } else {
                    $foto_profil = $this->upload->data('file_name');
                }
            }
            $level = 'Ternilai';
            $data = array(
                'id_jabatan' => $id_jabatan,
                'nama_user' => $nama_user,
                'username' => $username,
                'password' => md5($password),
                'foto_profil' => $foto_profil,
                'level' => $level,
            );

            $this->users->add($data, 'users');
            $this->session->set_flashdata('message', '
        <div class="alert alert-success alert-dismissible" role="alert">
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        <i class="fas fa-check-circle"></i>
        Data <strong>User Ternilai</strong> berhasil ditambahkan!
        </div>
        ');
            redirect('admin/ternilai');
        }
    }
    public function editpass($id)
    {
        if (!$this->session->userdata('level') == 'Admin') {
            redirect('auth');
        } else {
            $data['title'] = 'Edit Data User Ternilai';
            $data['users'] = $this->users->getById($id);

            $this->form_validation->set_rules(
                'password',
                'Password',
                'required|min_length[8]',
                array('required' => 'Password harus diisi', 'min_length' => 'Panjang password yang dimasukkan adalah minimal 8 karakter')
            );

            if ($this->form_validation->run() == false) {
                $this->load->view('admin/layout/header', $data);
                $this->load->view('admin/layout/sidebar');
                $this->load->view('admin/admin/edit', $data);
                $this->load->view('admin/layout/footer');
            } else {
                $this->users->updatepass($id);
                $this->session->set_flashdata('message', '
            <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            <i class="fas fa-check-circle"></i>
            Data <strong>User Ternilai </strong> berhasil diupdate!
            </div>
            ');
                redirect('admin/ternilai');
            }
        }
    }
    public function hapus($id)
    {

        $this->users->delete(['id_u' => $id]);
        $this->session->set_flashdata('message', '
        <div class="alert alert-success alert-dismissible" role="alert">
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        <i class="fas fa-check-circle"></i>
        Data <strong>User Ternilai</strong> berhasil dihapus!
        </div>
        ');
        redirect('admin/ternilai');
    }
    public function edit($id)
    {
        if (!$this->session->userdata('level') == 'Admin') {
            redirect('auth');
        } else {
            $data['title'] = 'Edit Data User Ternilai';

            $data['users'] = $this->users->getById($id);
            $this->form_validation->set_rules(
                'nama_user',
                'Nama User',
                'required',
                array('required' => 'Nama User harus diisi')
            );

            $this->form_validation->set_rules(
                'username',
                'Username',
                'required',
                array('required' => 'Username harus diisi')
            );

            if ($this->form_validation->run() == false) {
                $this->load->view('admin/layout/header', $data);
                $this->load->view('admin/layout/sidebar');
                $this->load->view('admin/ternilai/edit', $data);
                $this->load->view('admin/layout/footer');
            } else {
                $this->users->update($id);
                $this->session->set_flashdata('message', '
            <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            <i class="fas fa-check-circle"></i>
            Data <strong>User Ternilai</strong> berhasil diupdate!
            </div>
            ');
                redirect('admin/ternilai');
            }
        }
    }
}
