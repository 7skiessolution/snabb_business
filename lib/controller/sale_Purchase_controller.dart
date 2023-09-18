import 'dart:io';
import 'package:path/path.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as deo;
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/static_data.dart';

class SalePurchaseController extends GetxController {
  static SalePurchaseController get to => Get.find();
  String? pathimg;
  File? pickImage;
  Future addTransaction(String name, String note, double amount, double partial,
      String datetime, int type, bool iscash, String catId) async {
    print("...............datetime............. = $datetime");
    try {
      deo.FormData data = deo.FormData.fromMap({
        "Name": name,
        "Amount": amount,
        "Note": note,
        "DateTime": datetime,
        "Type": type,
        "PartialAmount": partial,
        "Currency": "DashBoardController.to.curency",
        "IsCash": iscash,
        "File": pathimg != null && pathimg != ""
            ? await deo.MultipartFile.fromFile(
                pickImage!.path,
                filename: basename(pickImage!.path),
              )
            : null,
        "CategoryId": catId,
      });

      print("...............url............. = ${StaticValues.addTransaction}");
      var response = await httpFormDataClient()
          .post("Transaction/AddTransaction", data: data);

      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        print("Response status Cose ${response.statusCode}");
        if (response.data != null) {
          print(".................${response.data}........");
        }
      }
      return response.data;
    } catch (e) {
      print("Exception = $e");
    }
    pathimg = null;
    // fetchTransaction();
    update();
  }
}
