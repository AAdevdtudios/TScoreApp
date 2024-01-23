class ApiEndPoints {
  static const String baseurl =
      'https://8848-102-88-71-29.ngrok-free.app/api/v1/';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registration = 'auth/register/';
  final String login = 'auth/login/';
  final String getUser = 'auth/data/';
  final String resendOtp = 'auth/resendOtp/';
  final String otp = 'auth/validateOtp/';
  final String subscriber = 'subscribe/';
  final String refreshToken = 'auth/token/refresh/';
}

class WEBAPI {
  final String website = '''
      <iframe src="" 
      frameborder="0" width="600" height="760" allowfullscreen allow='autoplay; fullscreen' 
      style="width:100%;height:760px;overflow:hidden;display:block;" class="_scorebatEmbeddedPlayer_"></iframe>''';
}
