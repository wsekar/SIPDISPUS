<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Myprofile extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('M_Myprofile', 'users');
    }
    public function index()
    {
        if (!$this->session->userdata('level') == 'Ternilai') {
            redirect('auth');
        } else {
            $data['users'] = $this->users->getAllTernilai();
        }
    }
    public function editprofile($id)
    {
        if (!$this->session->userdata('level') == 'Ternilai') {
            redirect('auth');
        } else {
            $data['title'] = 'My Profile';
            $data['users'] = $this->users->getById($id);


            $this->form_validation->set_rules(
                'username',
                'Username',
                'required',
                array('required' => 'Username harus diisi')
            );

            if ($this->form_validation->run() == false) {
                $this->load->view('ternilai/layout/header', $data);
                $this->load->view('ternilai/layout/sidebar', $data);
                $this->load->view('ternilai/myprofile', $data);
                $this->load->view('ternilai/layout/footer');
            } else {
                $this->users->updateprofile($id);
                $this->session->set_flashdata('message', '
            <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            <i class="fas fa-check-circle"></i>
            Data <strong>User Ternilai</strong> berhasil diupdate!
            </div>
            ');
                redirect('ternilai/dashboard');
            }
        }
    }
    public function editpass($id)
    {
        if (!$this->session->userdata('level') == 'Ternilai') {
            redirect('auth');
        } else {
            $data['title'] = 'My Profile';
            $data['users'] = $this->users->getById($id);


            $this->form_validation->set_rules(
                'password',
                'Password',
                'required',
                array('required' => 'Password harus diisi')
            );

            if ($this->form_validation->run() == false) {
                $this->load->view('ternilai/layout/header', $data);
                $this->load->view('ternilai/layout/sidebar', $data);
                $this->load->view('ternilai/edit', $data);
                $this->load->view('ternilai/layout/footer');
            } else {
                $this->users->updatepass($id);
                $this->session->set_flashdata('message', '
            <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            <i class="fas fa-check-circle"></i>
            Data <strong>User ternilai</strong> berhasil diupdate!
            </div>
            ');
                redirect('ternilai/dashboard');
            }
        }
    }
}
