class AppLink {
  static const String server = "https://easycuteg.com";
// ============================= Test ================================
  static const String test = "$server/test.php";
// ================================= Auth ==========================
  static const String signUp = "$server/users/auth/signup.php";
  static const String login = "$server/users/auth/login.php";
  static const String activateCode = "$server/users/auth/activatecode.php";
  static const String resend = "$server/users/auth/resend.php";
// ================================= ForgetPassword ====================
  static const String checkEmail = "$server/users/auth/checkemail.php";
  static const String resetPassword = "$server/users/auth/resetpassword.php";
  static const String verifyCode = "$server/users/auth/verifycode.php";
// ================================= Home ====================
  static const String home = "$server/users/home/home.php";
}
