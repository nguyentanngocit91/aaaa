class ApiUrl{
  static const String protocol = 'http://192.168.1.58';
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


  // Nhân viên
  static const String danhSachNhanVien = '$baseUrl/nhan-vien';


  // DS HĐ
  static const String searchContract = '$baseUrl/hop-dong';


  // Cấp mã HĐ, KH tự động
  static const String capMaKhachHang = '$baseUrl/cap-ma/khach-hang';
  static const String capMaHopDong = '$baseUrl/cap-ma/hop-dong';


  // Khách hàng
  static const String danhSachKhachHang = '$baseUrl/khach-hang';



  //PHIẾU THU
  static const String danhSachPhieuThu = '$baseUrl/phieu-thu';
  static const String phieuThuMoi = '$baseUrl/phieu-thu-moi';

  //BÀN GIAO
  static const String danhSachHDTheoSoHD = '$baseUrl/hop-dong';


  // blacklist
  static const String danhsachBlackList = '$baseUrl/black-list';

}