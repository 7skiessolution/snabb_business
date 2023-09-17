// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/colors.dart';

class SaleController extends GetxController {
  static SaleController get to => Get.find();
  File? compressedFile;
  XFile? pickImage;
  String pathFile = "";
  final picker = ImagePicker();
  Future<File> _createFile(Uint8List data) async {
    // Create a temporary directory
    Directory tempDir = await getTemporaryDirectory();

    // Generate a unique file name
    String tempPath =
        '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    // Write the data to a file
    File file = File(tempPath);
    await file.writeAsBytes(data);

    return file;
  }

  Future<File?> compressImage(XFile img) async {
    pathFile = img.path;
    update();

    final File imageFile = File(img.path);
    // Get the original image bytes
    List<int> imageBytes = await imageFile.readAsBytes();

    // Check if the image is already smaller than 300KB
    if (imageBytes.length <= 300 * 1024) {
      return imageFile;
    } else if (imageBytes.length >= 300 * 1024 &&
        imageBytes.length <= 600 * 1024) {
      Uint8List uint8List = Uint8List.fromList(imageBytes);
      // Compress the image to 75% quality
      List<int> compressedBytes = await FlutterImageCompress.compressWithList(
        uint8List,
        quality: 25,
      );

      // Convert the compressed bytes to a Uint8List
      ///compressedBytes
      Uint8List compressedData = Uint8List.fromList(compressedBytes);

      // Create a file from the compressed data
      compressedFile = await _createFile(compressedData);

      return compressedFile;
    } else if (imageBytes.length >= 600 * 1024 &&
        imageBytes.length <= 999 * 1024) {
      Uint8List uint8List = Uint8List.fromList(imageBytes);
      // Compress the image to 75% quality
      List<int> compressedBytes = await FlutterImageCompress.compressWithList(
        uint8List,
        quality: 10,
      );

      // Convert the compressed bytes to a Uint8List
      Uint8List compressedData = Uint8List.fromList(compressedBytes);

      // Create a file from the compressed data
      File compressedFile = await _createFile(compressedData);

      return compressedFile;
    } else {
      Uint8List uint8List = Uint8List.fromList(imageBytes);
      // Compress the image to 75% quality
      List<int> compressedBytes = await FlutterImageCompress.compressWithList(
        uint8List,
        quality: 5,
      );

      // Convert the compressed bytes to a Uint8List
      Uint8List compressedData = Uint8List.fromList(compressedBytes);

      // Create a file from the compressed data
      File compressedFile = await _createFile(compressedData);

      return compressedFile;
    }
  }

  Future<void> selectImage(
      BuildContext context, double height, double width) async {
    final PermissionStatus status = await Permission.camera.request();
    final PermissionStatus status1 = await Permission.storage.request();
    if (status.isGranted && status1.isGranted) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (context) {
          return SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppLocalizations.of(context)!.selectcategory,
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    AppLocalizations.of(context)!
                        .doyouwanttoselectanimagefromgallery,
                    style: TextStyle(
                      fontSize: width * 0.035,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    height: height * 0.07,
                    child: Row(
                      children: [
                        TextButton(
                          child: Text(AppLocalizations.of(context)!.gallery,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: darkblue)),
                          onPressed: () async {
                            //Navigator.of(context).pop();
                            //getImage(ImgSource.Gallery);
                            pickImage = await picker.pickImage(
                                source: ImageSource.gallery);

                            // Handle the picked image
                            if (pickImage != null) {
                              // ignore: await_only_futures
                              // compressedFile = await pickImage;

                              await compressImage(pickImage as XFile);

                              // Do something with the picked image
                              // For example, you can display it in an Image widget
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(AppLocalizations.of(context)!.camera,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: darkblue)),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            pickImage = await picker.pickImage(
                                source: ImageSource.camera);
                            // Handle the picked image
                            if (pickImage != null) {
                              pathFile = pickImage!.path;
                              update();
                              compressedFile = File(pickImage!.path);

                              // Do something with the picked image
                              // For example, you can display it in an Image widget
                            }
                          },
                        ),
                        TextButton(
                          child: Text(
                            AppLocalizations.of(context)!.cancel,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, color: Colors.red),
                          ),
                          onPressed: () async {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Text('Select Image'),
      //       content: Text(
      //           'Do you want to select an image from the gallery or take a picture?'),
      //       actions: <Widget>[
      //         TextButton(
      //           child: Text('Gallery',
      //               style: TextStyle(
      //                   fontWeight: FontWeight.w600,
      //                   color: AppTheme.colorPrimary)),
      //           onPressed: () async {
      //             //Navigator.of(context).pop();
      //             //getImage(ImgSource.Gallery);
      //             pickImage =
      //                 await picker.pickImage(source: ImageSource.gallery);

      //             // Handle the picked image
      //             if (pickImage != null) {
      //               File compressedFile =
      //                   await compressImage(pickImage as XFile);
      //               _uploadPicture(compressedFile);
      //               // Do something with the picked image
      //               // For example, you can display it in an Image widget
      //             }
      //             Navigator.of(context).pop();
      //           },
      //         ),
      //         TextButton(
      //           child: Text('Camera',
      //               style: TextStyle(
      //                   fontWeight: FontWeight.w600,
      //                   color: AppTheme.colorPrimary)),
      //           onPressed: () async {
      //             Navigator.of(context).pop();
      //             pickImage =
      //                 await picker.pickImage(source: ImageSource.camera);
      //             // Handle the picked image
      //             if (pickImage != null) {
      //               pathPickImage = pickImage!.path;

      //               setState(() {
      //                 pathFile = pickImage!.path;
      //               });

      //               final File imageFile = File(pickImage!.path);

      //               _uploadPicture(imageFile);
      //               // Do something with the picked image
      //               // For example, you can display it in an Image widget
      //             }
      //           },
      //         ),
      //         TextButton(
      //           child: Text(
      //             'Cancel',
      //             style:
      //                 TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
      //           ),
      //           onPressed: () async {
      //             Navigator.of(context).pop();
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );
    } else {
      // Handle the case where the user denied permission
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              AppLocalizations.of(context)!.permissiondenied,
            ),
            content: Text(
              AppLocalizations.of(context)!.pleasegrantpermissionphoto,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  AppLocalizations.of(context)!.ok,
                ),
                onPressed: () async {
                  await Permission.photos.request();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
