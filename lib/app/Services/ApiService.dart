import "dart:convert";

import "package:http/http.dart" as http;
import "package:tscore_app/app/Services/ApiClient.dart";
import "package:tscore_app/main.dart";

class ApiServices {
  var client = http.Client();
  Map<String, String> header = {
    "Accept": "application/json",
    "content-type": "application/json; charset=UTF-8",
    "Authorization": "",
  };
  String baseUrl = ApiEndPoints.baseurl;
  Future<bool> login(dynamic data) async {
    var url = Uri.parse(baseUrl + ApiEndPoints.authEndPoints.login);
    try {
      var response = await client.post(
        url,
        body: json.encode(data),
        headers: header,
      );
      var message = json.decode(response.body);
      if (response.statusCode != 200) {
        throw message["detail"];
      }
      storesInfo(
        {
          "refresh_token": message["refresh_token"],
          "token": message["access_token"],
        },
      );
      await getUser();
      return true;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool> getUser() async {
    var url = Uri.parse(baseUrl + ApiEndPoints.authEndPoints.getUser);
    try {
      header["Authorization"] = "Bearer " + box.read("token");
      print(header);
      var response = await client.get(url, headers: header);
      var message = json.decode(response.body);
      if (response.statusCode != 200) {
        return false;
      }
      print(message);
      storesInfo({
        "email": message["email"],
        "get_full_name": message["get_full_name"],
        "subscriber_number": message["subscriber_number"],
        "is_subscribed": message["is_subscribed"],
        "is_verified": message["is_verified"],
        "phone_number": message["phone_number"],
      });
      return true;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool> registerUser(dynamic user) async {
    var url = Uri.parse(baseUrl + ApiEndPoints.authEndPoints.registration);
    try {
      var response = await client.post(
        url,
        body: json.encode(user),
        headers: header,
        // encoding: Encoding.getByName("utf-8"),
      );
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

  Future<String> SubscribeUser(dynamic data) async {
    var url = Uri.parse(baseUrl + ApiEndPoints.authEndPoints.subscriber);
    try {
      header["Authorization"] = "Bearer " + box.read("token");
      var response =
          await client.post(url, body: json.encode(data), headers: header);
      var message = json.decode(response.body);
      if (response.statusCode == 401) {
        var refresh = await RefreshUserToken();
        if (refresh == false) {
          throw "User Session expired";
        }
        await SubscribeUser(data);
      }
      if (response.statusCode != 200) {
        throw "Un-known error";
      }

      return message["message"];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> RefreshUserToken() async {
    var url = Uri.parse(baseUrl + ApiEndPoints.authEndPoints.refreshToken);
    try {
      var response = await client.post(
        url,
        body: json.encode(
          {
            "refresh": box.read("refresh_token"),
          },
        ),
        headers: header,
      );
      if (response.statusCode != 200) {
        return false;
      }
      var message = json.decode(response.body);
      storesInfo({"token": message["access"]});
      return true;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  storesInfo(Map<String, dynamic> data) {
    data.forEach((key, value) => box.write(key, value));
    print("Saved");
  }
}
