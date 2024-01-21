import 'package:get/get.dart';
import 'package:tscore_app/app/Services/ApiService.dart';
import 'package:tscore_app/app/data/ApiData/UserData.dart';

class LoginController extends GetxController {
  Future<User> getData() async {
    User user = await ApiServices().getUser();
    return user;
  }
}
