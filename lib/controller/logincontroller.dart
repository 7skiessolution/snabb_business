import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/models/signup_model.dart';
import 'package:snabb_business/screen/dashboardScreen.dart';
import 'package:snabb_business/static_data.dart';
import 'package:dio/dio.dart' as deo;
import 'package:snabb_business/utils/color.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  bool isLogin = true;
  bool remember = true;

  Future signup(SignupModel model) async {
    var res =
        await httpClient().post(StaticValues.registerUser, data: model.toMap());
    res.data['status'];
    if (res.statusCode == 200) {
      res.data['status'];
      Fluttertoast.showToast(
          msg: res.data["status"],
          backgroundColor: blue,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          fontSize: 15,
          //timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_LONG);
    }
    Fluttertoast.showToast(
        msg: res.data["status"],
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 15,
        //timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG);
    return res;
  }

  changeLogin(bool v) {
    isLogin = v;
    update();
  }

  Future<bool> login(Map<String, dynamic> model, BuildContext context) async {
    bool v = false;
    deo.Response res =
        await httpClient().post(StaticValues.loginUser, data: model);

    if (res.statusCode == 200) {
      v = true;
      print(res.data);

      if (res.data["status"] == "Incorrect Email or Password") {
        print("email or password incorrect");
        //  Fluttertoast.showToast(
        //     msg: res.data["status"],
        //     backgroundColor: Colors.blue,
        //     textColor: Colors.white,
        //     gravity: ToastGravity.BOTTOM,
        //     fontSize: 17,
        //     //timeInSecForIosWeb: 1,
        //     toastLength: Toast.LENGTH_LONG);
      } else if (res.data["status"] == "Verify Your Email Address for Login") {
        //

        print("Exception ${res.data["status"]}");
      } else if (res.data["status"] == "Login Successfully") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (ctx) => const DashBoardScreen()),
            (Route<dynamic> route) => false);
        StaticValues.token = res.data["data"];
        print("tocken idd${StaticValues.token}");
        setDataForIntro(res.data["data"]);

        Fluttertoast.showToast(
            msg: "Login Successfully",
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            gravity: ToastGravity.BOTTOM,
            fontSize: 17,
            // timeInSecForIosWeb: 1,
            toastLength: Toast.LENGTH_LONG);
      } else {
        print(res.data["status"]);

        Fluttertoast.showToast(
            msg: res.data["status"],
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            gravity: ToastGravity.BOTTOM,
            fontSize: 17,
            // timeInSecForIosWeb: 1,
            toastLength: Toast.LENGTH_LONG);
      }
    }

    return v;
  }

  /// forget password
  Future<void> resetPassword(context, email) async {
    try {
      var result = await httpClient()
          .post('${StaticValues.forgotpassword}${email.text}');

      showetoast(result.data["status"]);
    } catch (e) {
      showetoast("Failed to send password reset email: $e");
      print("Failed to send password reset email: $e");
    }
  }

  void showetoast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  setDataForIntro(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
}
