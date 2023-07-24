class ApiUrl{
  static const String protocol = 'http://192.168.1.58';
  static const String port = ':1988';
  static const String baseUrl = '$protocol$port/api/v1';

  // Auth
  static const String checkToken = '$baseUrl/check-login';
  static const String signIn = '$baseUrl/login';
  static const String infoUser = '$baseUrl/users/profile';
  static const String changePassword = '$baseUrl/users/change-password';
  static const String searchContract = '$baseUrl/hop-dong';


  // Khách hàng
  static const String danhSachKhachHang = '$baseUrl/khach-hang';


  // blacklist

  static const String danhsachBlackList = '$baseUrl/black-list';

}