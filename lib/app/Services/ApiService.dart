import "dart:convert";

import "package:http/http.dart" as http;
import "package:tscore_app/app/Services/ApiClient.dart";
import "package:tscore_app/app/data/ApiData/UserData.dart";
import "package:tscore_app/main.dart";

class ApiServices {
  var client = http.Client();
  Map<String, String> header = {
    "Accept": "application/json",
    "content-type": "application/json; charset=UTF-8",
  };
  String baseUrl = ApiEndPoints.baseurl;
  Future<User> getUser() async {
    var url = Uri.parse(baseUrl);
    try {
      var response = await client.get(url);
      print(response.body);
      return User.fromJson(json.decode(response.body));
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }

  Future<bool> loginUser(dynamic user) async {
    var url = Uri.parse(baseUrl + ApiEndPoints.authEndPoints.registration);
    try {
      var response = await client.post(
        url,
        body: json.encode(user),
        headers: header,
        // encoding: Encoding.getByName("utf-8"),
      );
      print(response.body);
      if (response.statusCode != 200) {
        return false;
      }
      print(response.body);
      storesInfo({
        "verified": "verified",
        "email": user["email"],
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> verifyOtp(dynamic data) async {
    var url = Uri.parse(baseUrl + ApiEndPoints.authEndPoints.otp);
    try {
      var response = await client.post(
        url,
        body: json.encode(data),
        headers: header,
      );
      var message = json.decode(response.body);
      if (response.statusCode != 200) {
        throw Exception(message["message"]);
      }
      print(message);
      storesInfo({
        "token": message["message"]["access_token"],
        "refresh_token": message["message"]["refresh_token"],
      });
      return true;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> resendOtp(dynamic data) async {
    var url = Uri.parse(baseUrl + ApiEndPoints.authEndPoints.resendOtp);
    try {
      var response = await client.post(
        url,
        body: json.encode(data),
        headers: header,
      );
      var message = json.decode(response.body);
      if (response.statusCode != 200) {
        throw message["message"];
      }
      return true;
    } catch (e) {
      throw e.toString();
    }
  }

  storesInfo(Map<String, String> data) {
    data.forEach((key, value) => box.write(key, value));
    print("Saved");
  }
}
