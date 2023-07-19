class ApiUrl{
  static const String protocol = 'http://116.193.76.26';
  static const String port = ':1988';
  static const String baseUrl = '$protocol$port/api/v1';

  // Auth
  static const String checkToken = '$baseUrl/check-login';
  static const String signIn = '$baseUrl/login';
  static const String infoUser = '$baseUrl/users/profile';
  static const String changePassword = '$baseUrl/users/change-password';
}