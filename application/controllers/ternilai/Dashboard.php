<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends CI_Controller
{

	function __construct()
	{
		parent::__construct();
		$this->load->model('M_Penilaian', 'penilaian');
		$this->load->model('M_Subkomponen', 'subkomponen');
		$this->load->model('M_Komponen', 'komponen');
	}

	public function index()
	{
		if (!$this->session->userdata('level') == 'Ternilai') {
			redirect('auth');
		} else {
			$id = $this->session->userdata('id_jabatan');
			$data['title'] = 'Dashboard';
			$data['subkomponen'] = $this->penilaian->getNilai($id);
			$data['nilai'] = $this->penilaian->detail_nilai($id);
			$data['komponen'] = $this->komponen->getAll();
			$data['belum_dinilai'] = $this->penilaian->belum_dinilai($id);
			$this->load->view('ternilai/layout/header');
			$this->load->view('ternilai/layout/sidebar');
			$this->load->view('ternilai/index', $data);
			$this->load->view('ternilai/layout/footer');
		}
	}
	public function logout()
	{
		$this->session->sess_destroy();
		redirect('auth');
	}
}
