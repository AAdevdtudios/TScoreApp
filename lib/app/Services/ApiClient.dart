class ApiEndPoints {
  static const String baseurl =
      'https://3281-102-89-33-217.ngrok-free.app/api/v1/';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registration = 'auth/register/';
  final String login = 'auth/login/';
  final String resendOtp = 'auth/resendOtp/';
  final String otp = 'auth/validateOtp/';
}
