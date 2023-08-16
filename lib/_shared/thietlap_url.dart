class ApiUrl {
  static const String protocol = 'http://192.168.1.79';
  static const String port = ':1988';
  static const String baseUrl = '$protocol$port/api/v1';

  // Auth
  static const String checkToken = '$baseUrl/check-login';
  static const String signIn = '$baseUrl/login';
  static const String infoUser = '$baseUrl/users/profile';
  static const String changePassword = '$baseUrl/users/change-password';


  // Media
  static const String media = '$baseUrl/media';
  static const String uploadFile = '$media/upload';
  static const String listFile = '$baseUrl/media/list';


  // Nhân viên
  static const String danhSachNhanVien = '$baseUrl/nhan-vien';

  // DS HĐ
  static const String searchContractCustomer =
      '$baseUrl/tim-kiem/hop-dong-theo-khach-hang';
  static const String updateContract = '$baseUrl/hop-dong';
  static const String infoUpdateCustomer = '$baseUrl/khach-hang/';
  static const String searchContract = '$baseUrl/hop-dong';
  static const String infoContract = '$baseUrl/hop-dong/';
  static const String updateFile = '$baseUrl/media/update/';
  static const String phieuThuMoiHD = '$baseUrl/phieu-thu-hop-dong/';

  // Cấp mã HĐ, KH tự động
  static const String capMaKhachHang = '$baseUrl/cap-ma/khach-hang';
  static const String capMaHopDong = '$baseUrl/cap-ma/hop-dong';

  // Khách hàng
  static const String danhSachKhachHang = '$baseUrl/khach-hang';

  //DOMAIN
  static const String danhSachDomain = '$baseUrl/domain';

  //PHIẾU THU
  static const String danhSachPhieuThu = '$baseUrl/phieu-thu';
  static const String phieuThuMoi = '$baseUrl/phieu-thu-moi';
  static const String phieuThuMoiNC = '$baseUrl/phieu-thu-hop-dong/';

  //BÀN GIAO
  static const String danhSachHDTheoSoHD = '$baseUrl/tim-kiem/phieu-thu-theo-so-hop-dong';

  //Blacklist
  static const String danhsachBlackList = '$baseUrl/black-list';

  // tim kiem hd 20152019

  static const String danhsach20152019 =
      "https://manager.nina.vn/administrator/api/jsonhdcu.php";
}
