<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends CI_Controller
{

	function __construct()
	{
		parent::__construct();
		$this->load->model('M_Jabatan', 'jabatan');
		$this->load->model('M_Users', 'admin');
		$this->load->model('M_Komponen', 'komponen');
		$this->load->model('M_Subkomponen', 'subkomponen');
	}

	public function index()
	{
		if (!$this->session->userdata('level') == 'Admin') {
			redirect('auth');
		} else {
			$data['title'] = 'Dashboard';
			$data['jumlah_jabatan'] = $this->jabatan->jumlah_jabatan();
			$data['jumlah_admin'] = $this->admin->jumlah_admin();
			$data['jumlah_penilai'] = $this->admin->jumlah_penilai();
			$data['jumlah_ternilai'] = $this->admin->jumlah_ternilai();
			$data['jumlah_komponen'] = $this->komponen->jumlah_komponen();
			$data['jumlah_subkomponen'] = $this->subkomponen->jumlah_subkomponen();

			$this->load->view('admin/layout/header');
			$this->load->view('admin/layout/sidebar');
			$this->load->view('admin/index', $data);
			$this->load->view('admin/layout/footer');
		}
	}
	public function logout()
	{
		$this->session->sess_destroy();
		redirect('auth');
	}
}
