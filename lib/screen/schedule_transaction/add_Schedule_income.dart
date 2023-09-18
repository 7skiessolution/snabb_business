import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart' as deo;
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/controller/schedule_controller.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/models/payment_type_model.dart';
import 'package:snabb_business/models/user_wallet_model.dart' as wal;
import 'package:snabb_business/screen/homeScreen.dart';
import 'package:snabb_business/screen/sale/IncomeDataMode.dart';
import 'package:snabb_business/screen/sale/income_catagery._model.dart';
import 'package:snabb_business/screen/sale/user_category_model.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/colors.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'package:uuid/uuid.dart';
import 'package:snabb_business/utils/color.dart';

import '../../utils/appbarwidget.dart';

class ScheduleIncome extends StatefulWidget {
  ScheduleIncome({super.key, required this.income});
  bool income;

  @override
  State<ScheduleIncome> createState() => _ScheduleIncomeState();
}

class _ScheduleIncomeState extends State<ScheduleIncome> {
  final TextEditingController _value = TextEditingController();
  final TextEditingController numberoftimescontroller = TextEditingController();
  final TextEditingController repeatcontrooler = TextEditingController();
  final TextEditingController selectPaymentMethod = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  int index = 1;
  String? selectedimage;
  String? selectedname;
  int? paymentMethod;
  String? walletID;
  String? walletName;
  var height, width;
  bool opencatagoryclick = false;
  String walletname = "Select Wallet";
  CatagoryModel? catagorymodel;
  int? clicktile;
  String? getimage;
  XFile? pickImage;
  String? maingetimage;
  String? selectedcatId;
  String? selectcatagorytital;
  String dropdownvalue = 'Day';
  UserCategoryModel? selectedCatagorymodel;
  String? selectcatagoryurl;
  String? selectedcat;

  List<SubCatagoriesModel> dummysubcatagorylist = [];
  List<SubCatagoriesModel> subcatagorylistview = [];
  final TextEditingController controller = TextEditingController();
  final TextEditingController subcatagorycontroller = TextEditingController();
  final TextEditingController fromcontroller = TextEditingController();
  final TextEditingController notescontroller = TextEditingController();
  List<String> listdropdown = [
    'Day',
    'Week',
    'Month',
    'Year',
  ];
  bool isLoading = false;
  bool status = false;
  bool isselectcatagory = false;

  final _formKey = GlobalKey<FormState>();

  String? imageUrl;

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2400),
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: darkblue!,
              colorScheme: ColorScheme.light(primary: darkblue!),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!);
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        print(_selectedDate);
      });
    }
  }

  DateTime _selectedDateschedule = DateTime.now();
  Future<void> _selectDateschedule(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateschedule,
      firstDate: DateTime(2000),
      lastDate: DateTime(2400),
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: darkblue!,
              colorScheme: ColorScheme.light(primary: darkblue!),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!);
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDateschedule = pickedDate;
        print(_selectedDateschedule);
      });
    }
  }

  String formatTime = "";
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<File> _createFile(Uint8List data) async {
    Directory tempDir = await getTemporaryDirectory();

    String tempPath =
        '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    File file = File(tempPath);
    await file.writeAsBytes(data);

    return file;
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: darkblue!,
              colorScheme: ColorScheme.light(primary: darkblue!),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!);
      },
    );
    if (pickedTime != null) {
      _selectedTime = pickedTime;
      formatTime = "${_selectedTime.hour}:${_selectedTime.minute}";
    }
  }

  String pathPickImage = "null";
  String pathFile = "null";

  Future<File> compressImage(XFile img) async {
    pathPickImage = img.path;
    setState(() {
      pathFile = img.path;
    });
    final File imageFile = File(img.path);
    List<int> imageBytes = await imageFile.readAsBytes();
    if (imageBytes.length <= 300 * 1024) {
      return imageFile;
    } else if (imageBytes.length >= 300 * 1024 &&
        imageBytes.length <= 600 * 1024) {
      Uint8List uint8List = Uint8List.fromList(imageBytes);
      List<int> compressedBytes = await FlutterImageCompress.compressWithList(
        uint8List,
        quality: 25,
      );
      Uint8List compressedData = Uint8List.fromList(compressedBytes);
      File compressedFile = await _createFile(compressedData);
      return compressedFile;
    } else if (imageBytes.length >= 600 * 1024 &&
        imageBytes.length <= 999 * 1024) {
      Uint8List uint8List = Uint8List.fromList(imageBytes);
      List<int> compressedBytes = await FlutterImageCompress.compressWithList(
        uint8List,
        quality: 10,
      );
      Uint8List compressedData = Uint8List.fromList(compressedBytes);
      File compressedFile = await _createFile(compressedData);
      return compressedFile;
    } else {
      Uint8List uint8List = Uint8List.fromList(imageBytes);
      List<int> compressedBytes = await FlutterImageCompress.compressWithList(
        uint8List,
        quality: 5,
      );
      Uint8List compressedData = Uint8List.fromList(compressedBytes);
      File compressedFile = await _createFile(compressedData);
      return compressedFile;
    }
  }

  String? id;
  void postschedule(context) async {
    setState(() {
      isLoading = true;
    });

    if (_formKey.currentState!.validate() &&
        selectcatagorytital != null &&
        walletname != "Select Wallet" &&
        paymentMethod != null) {
      showGeneralDialog(
        context: context,
        pageBuilder: (ctx, a1, a2) {
          return Container();
        },
        transitionBuilder: (ctx, a1, a2, child) {
          return Transform.rotate(
            angle: math.radians(a1.value * 360),
            child: AlertDialog(
              elevation: 10,
              shadowColor: darkblue!,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              content: SizedBox(
                height: height * 0.3,
                width: width * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.success,
                      style: TextStyle(
                          fontSize: width * 0.04,
                          color: darkblue!,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height * 0.2,
                      width: width * 0.2,
                      child: Lottie.asset('assets/lottie_files/success.json'),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        ScheduleController.to.fetchTransactions();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => HomeScreen(),
                        //     ));
                      },
                      child: Container(
                        height: height * 0.05,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                            color: darkblue!,
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalizations.of(context)!.ok,
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 600),
      );

      double amount = double.parse(_value.text);
      bool cash;
      if (paymentMethod == "Cash") {
        cash = true;
      } else {
        cash = false;
      }
      int days = 1;
      if (dropdownvalue == 'Day') {
        days = 1;
      } else if (dropdownvalue == 'Week') {
        days = 7;
      } else if (dropdownvalue == 'Month') {
        days = 30;
      } else if (dropdownvalue == 'Year') {
        days = 365;
      }
      String? from;
      String? note;
      if (fromcontroller.text.isEmpty) {
        setState(() {
          from = "empty";
        });

        print("fromcontroller ${fromcontroller.text}");
      } else {
        setState(() {
          from = fromcontroller.text;
        });
      }
      if (notescontroller.text.isEmpty) {
        setState(() {
          note = "empty";
        });

        print("notescontroller ${notescontroller.text}");
      } else {
        setState(() {
          note = notescontroller.text;
        });
      }
      String time =
          "${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year} $formatTime";
      try {
        deo.FormData data = pickImage == null
            ? deo.FormData.fromMap({
                "From": from,
                "Name": walletname,
                "Amount": amount,
                "Note": note,
                "DateTime":
                    "${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}",
                "Type": widget.income ? 1 : 0,
                "IsCash": cash,
                "CategoryId": selectedcatId,
                "Days": days,
                "SecondDateTime":
                    "${_selectedDateschedule.month}-${_selectedDateschedule.day}-${_selectedDateschedule.year}",
                "NOT": int.parse(numberoftimescontroller.text),
                "Repeats": int.parse(repeatcontrooler.text),
                "File": null
              })
            : deo.FormData.fromMap({
                "From": from,
                "Name": walletname,
                "SecondDateTime":
                    "${_selectedDateschedule.month}-${_selectedDateschedule.day}-${_selectedDateschedule.year}",
                "Note": note,
                "NOT": int.parse(numberoftimescontroller.text),
                "Days": days,
                "Amount": amount,
                "DateTime":
                    "${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}",
                "Type": widget.income ? 1 : 0,
                "IsCash": cash,
                "CategoryId": selectedcatId,
                "Repeats": int.parse(repeatcontrooler.text),
                "File": await deo.MultipartFile.fromFile(
                  pickImage!.path,
                  filename: basename(pickImage!.path),
                ),
              });
        print("Rdata.toString() ${data.fields}");
        print("Rdata.toString() ${data.fields}");

        var response = await httpFormDataClient()
            .post(StaticValues.addcscheduleTransaction, data: data);
        print("Response status Cose ${response.statusCode}");

        if (response.statusCode == 200) {
          if (response.data != null) {
            print("Response data data ${response.data}");
          }
        }
        return response.data;
      } catch (e) {
        print("Exception = $e");
      }
      setState(() {
        isLoading = true;
      });

      pathFile = "";
    } else {
      showtoast("give all fields");
    }
  }

  Future<void> selectImage(BuildContext context) async {
    final PermissionStatus status = await Permission.camera.request();
    final PermissionStatus status1 = await Permission.storage.request();
    if (status.isGranted && status1.isGranted) {
      // ignore: use_build_context_synchronously
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
                    AppLocalizations.of(context)!.selectimage,
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: darkblue!),
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
                                  color: darkblue!)),
                          onPressed: () async {
                            pickImage = await picker.pickImage(
                                source: ImageSource.gallery);

                            if (pickImage != null) {
                              File compressedFile =
                                  await compressImage(pickImage as XFile);
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Camera',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: darkblue!)),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            pickImage = await picker.pickImage(
                                source: ImageSource.camera);

                            if (pickImage != null) {
                              pathPickImage = pickImage!.path;

                              setState(() {
                                pathFile = pickImage!.path;
                              });

                              final File imageFile = File(pickImage!.path);
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
    } else {
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

  IncomeDataCategory? selectcatagorytile;
  List<IncomeData> incomeDatList = [];
  final picker = ImagePicker();

  void deletecatagory(String id) async {}

  @override
  void initState() {
    Get.put(TransactionController());
    Get.put(HomeController());
    TransactionController.to
        .getCatagoriesdata(widget.income ? "income" : "expense");
    TransactionController.to.fetchAccounts();
    id = const Uuid().v4();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return KeyboardVisibilityBuilder(builder: (context, keyboard) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: height,
              width: width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: AppBarWidgt(
                        text: widget.income == true
                            ? "Add Income"
                            : "Add Expanse"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.1),
                    child: SizedBox(
                      width: width,
                      height: height * 0.15,
                      child: Stack(
                        children: [
                          Container(
                            width: width,
                            height: height * 0.15,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/dollar.jpg"))),
                          ),
                          Container(
                            width: width,
                            height: height * 0.15,
                            color: Colors.blue[900]!.withOpacity(0.9),
                          ),
                          SizedBox(
                            width: width,
                            height: height * 0.08,
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: index == 0
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.menu,
                                                size: width * 0.06,
                                                color: white,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: width * 0.12,
                                                    right: width * 0.12),
                                                child: Divider(
                                                  color: white,
                                                  thickness: 3,
                                                ),
                                              )
                                            ],
                                          )
                                        : Padding(
                                            padding: EdgeInsets.only(
                                                top: height * 0.00),
                                            child: Center(
                                              child: InkWell(
                                                  onTap: () {
                                                    index = 0;
                                                    fromcontroller.clear();
                                                    notescontroller.clear();
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.menu,
                                                    size: width * 0.06,
                                                    color: white,
                                                  )),
                                            ),
                                          ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: index == 1
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.schedule_outlined,
                                                size: width * 0.06,
                                                color: white,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: width * 0.1,
                                                    right: width * 0.1),
                                                child: Divider(
                                                  color: white,
                                                  thickness: 3,
                                                ),
                                              )
                                            ],
                                          )
                                        : Padding(
                                            padding: EdgeInsets.only(
                                                top: height * 0.00),
                                            child: Center(
                                              child: InkWell(
                                                  onTap: () {
                                                    index = 1;
                                                    fromcontroller.clear();
                                                    notescontroller.clear();
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.schedule_outlined,
                                                    size: width * 0.06,
                                                    color: white,
                                                  )),
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.17),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.blue[900],
                        child: SizedBox(
                          height: height * 0.78,
                          width: width * 0.9,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(children: [
                              SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: height * 0.01),
                                      Card(
                                        elevation: 7,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: SizedBox(
                                          width: width,
                                          child: TextFormField(
                                            controller: _value,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                  color: Colors.black),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 20),
                                              fillColor: Colors.grey,
                                              hintText:
                                                  AppLocalizations.of(context)!
                                                      .value,
                                              alignLabelWithHint: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: darkblue!),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: darkblue!),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 0.025),
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .category,
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      GetBuilder<TransactionController>(
                                          builder: (obj) {
                                        return ListTile(
                                          onTap: () {
                                            clicktile = null;
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return StatefulBuilder(
                                                      builder:
                                                          (context, state) {
                                                    return AlertDialog(
                                                      elevation: 10,
                                                      shadowColor: darkblue!,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      title: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .selectcategory,
                                                            style: TextStyle(
                                                              fontSize:
                                                                  width * 0.035,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: darkblue!,
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              height:
                                                                  height * 0.04,
                                                              width:
                                                                  width * 0.08,
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      darkblue!,
                                                                  shape: BoxShape
                                                                      .circle),
                                                              child:
                                                                  const Center(
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  size: 15,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      content: SizedBox(
                                                        height: height * 0.8,
                                                        width: width,
                                                        child: Column(
                                                          children: [
                                                            Expanded(
                                                              child: obj.model ==
                                                                      null
                                                                  ? Center(
                                                                      child:
                                                                          SpinKitCircle(
                                                                        color:
                                                                            darkblue!,
                                                                        size:
                                                                            50.0,
                                                                      ),
                                                                    )
                                                                  : ListView
                                                                      .builder(
                                                                      itemCount: obj
                                                                          .model!
                                                                          .data!
                                                                          .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              index) {
                                                                        return clicktile == index &&
                                                                                clicktile != null &&
                                                                                opencatagoryclick == true
                                                                            ? Column(children: [
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    setState(() {
                                                                                      selectcatagorytital = obj.model!.data![index].name;
                                                                                      selectedcatId = obj.model!.data![index].categoryId;
                                                                                    });
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child: ListTile(
                                                                                    trailing: IconButton(
                                                                                        onPressed: () {
                                                                                          state(() {
                                                                                            clicktile = index;
                                                                                            opencatagoryclick = !opencatagoryclick;
                                                                                          });
                                                                                          setState(() {});
                                                                                        },
                                                                                        icon: Icon(
                                                                                          clicktile == index && clicktile != null ? Icons.arrow_drop_down_outlined : Icons.arrow_drop_up_outlined,
                                                                                          color: darkblue!,
                                                                                        )),
                                                                                    leading: Container(
                                                                                      height: height * 0.05,
                                                                                      width: width * 0.1,
                                                                                      decoration: const BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                        child: Image(
                                                                                          image: AssetImage(obj.model!.data![index].imageUrl!),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    title: Text(
                                                                                      obj.model!.data![index].name!,
                                                                                      style: TextStyle(fontSize: width * 0.03, color: darkblue!, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  obj.model!.data![index].child!.isEmpty
                                                                                      ? AppLocalizations.of(context)!.nosubcategory
                                                                                      : "${AppLocalizations.of(context)!.subcatagoriesof}"
                                                                                          "${obj.model!.data![index].name!}",
                                                                                  style: const TextStyle(
                                                                                    fontSize: 10,
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: height * 0.1 * obj.model!.data![index].child!.length,
                                                                                  child: ListView.builder(
                                                                                    physics: const NeverScrollableScrollPhysics(),
                                                                                    itemCount: obj.model!.data![index].child!.length,
                                                                                    itemBuilder: (BuildContext context, int i) {
                                                                                      return Padding(
                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                        child: ListTile(
                                                                                          onTap: () {
                                                                                            setState(() {
                                                                                              selectcatagorytital = obj.model!.data![index].child![i].name;
                                                                                              selectedcatId = obj.model!.data![index].child![i].categoryId;
                                                                                            });
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          leading: Container(
                                                                                            height: height * 0.05,
                                                                                            width: width * 0.1,
                                                                                            decoration: const BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsets.all(8.0),
                                                                                              child: Image(
                                                                                                image: AssetImage(
                                                                                                  obj.model!.data![index].child![i].imageUrl!,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          title: Text(
                                                                                            obj.model!.data![index].child![i].name!,
                                                                                            style: TextStyle(fontSize: width * 0.03, color: darkblue!, fontWeight: FontWeight.bold),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                )
                                                                              ])
                                                                            : ListTile(
                                                                                onTap: () {
                                                                                  setState(() {
                                                                                    selectcatagorytital = obj.model!.data![index].name;
                                                                                    selectedcatId = obj.model!.data![index].categoryId;
                                                                                  });
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                trailing: IconButton(
                                                                                    onPressed: () {
                                                                                      state(() {
                                                                                        clicktile = index;
                                                                                        opencatagoryclick = !opencatagoryclick;
                                                                                      });
                                                                                      setState(() {});
                                                                                    },
                                                                                    icon: Icon(
                                                                                      clicktile == index && clicktile != null ? Icons.arrow_drop_down_outlined : Icons.arrow_drop_up_outlined,
                                                                                      color: darkblue!,
                                                                                    )),
                                                                                leading: Container(
                                                                                  height: height * 0.05,
                                                                                  width: width * 0.1,
                                                                                  decoration: const BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Image(
                                                                                      image: AssetImage(obj.model!.data![index].imageUrl!),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                title: Text(
                                                                                  obj.model!.data![index].name!,
                                                                                  style: TextStyle(fontSize: width * 0.03, color: darkblue!, fontWeight: FontWeight.bold),
                                                                                ),
                                                                              );
                                                                      },
                                                                    ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  getimage =
                                                                      null;
                                                                  isLoading =
                                                                      false;
                                                                  subcatagorycontroller
                                                                      .text = "";
                                                                });

                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return StatefulBuilder(builder:
                                                                          (context,
                                                                              set) {
                                                                        return SingleChildScrollView(
                                                                          child:
                                                                              AlertDialog(
                                                                            elevation:
                                                                                10,
                                                                            shadowColor:
                                                                                darkblue!,
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                            title:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  AppLocalizations.of(context)!.newsubcategory,
                                                                                  style: TextStyle(
                                                                                    fontSize: width * 0.035,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    color: darkblue!,
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child: Container(
                                                                                    height: height * 0.04,
                                                                                    width: width * 0.08,
                                                                                    decoration: BoxDecoration(color: darkblue!, shape: BoxShape.circle),
                                                                                    child: const Center(
                                                                                      child: Icon(
                                                                                        Icons.clear,
                                                                                        size: 15,
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                            content:
                                                                                Stack(
                                                                              children: [
                                                                                SizedBox(
                                                                                  height: height * 0.8,
                                                                                  width: width,
                                                                                  child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        height: height * 0.08,
                                                                                        width: width,
                                                                                        child: Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Text(
                                                                                              '${AppLocalizations.of(context)!.name} :',
                                                                                              style: TextStyle(fontSize: width * 0.03, color: darkblue!, fontWeight: FontWeight.bold),
                                                                                            ),
                                                                                            SizedBox(
                                                                                              width: width * 0.3,
                                                                                              child: TextFormField(
                                                                                                controller: subcatagorycontroller,
                                                                                                decoration: const InputDecoration(
                                                                                                  hintText: "...",
                                                                                                  hintStyle: TextStyle(color: Colors.black),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: height * 0.08,
                                                                                        width: width,
                                                                                        child: Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Text(
                                                                                              AppLocalizations.of(context)!.maincategory,
                                                                                              style: TextStyle(fontSize: width * 0.03, color: darkblue!, fontWeight: FontWeight.bold),
                                                                                            ),
                                                                                            InkWell(
                                                                                              onTap: () {
                                                                                                showDialog(
                                                                                                    context: context,
                                                                                                    builder: (BuildContext context) {
                                                                                                      return StatefulBuilder(builder: (context, setstateee) {
                                                                                                        return SingleChildScrollView(
                                                                                                          child: AlertDialog(
                                                                                                              elevation: 10,
                                                                                                              shadowColor: darkblue!,
                                                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                                                              title: Row(
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    AppLocalizations.of(context)!.selectcategory,
                                                                                                                    style: TextStyle(fontSize: width * 0.03, color: darkblue!, fontWeight: FontWeight.bold),
                                                                                                                  ),
                                                                                                                  InkWell(
                                                                                                                    onTap: () {
                                                                                                                      Navigator.pop(context);
                                                                                                                    },
                                                                                                                    child: Container(
                                                                                                                      height: height * 0.04,
                                                                                                                      width: width * 0.08,
                                                                                                                      decoration: BoxDecoration(color: darkblue!, shape: BoxShape.circle),
                                                                                                                      child: const Center(
                                                                                                                        child: Icon(
                                                                                                                          Icons.clear,
                                                                                                                          size: 15,
                                                                                                                          color: Colors.white,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  )
                                                                                                                ],
                                                                                                              ),
                                                                                                              content: SizedBox(
                                                                                                                height: height * 0.8,
                                                                                                                width: width,
                                                                                                                child: ListView.builder(
                                                                                                                    itemCount: obj.model!.data!.length,
                                                                                                                    itemBuilder: (context, index) {
                                                                                                                      return Padding(
                                                                                                                        padding: EdgeInsets.symmetric(
                                                                                                                          vertical: height * 0.01,
                                                                                                                        ),
                                                                                                                        child: InkWell(
                                                                                                                          onTap: () {
                                                                                                                            set(() {
                                                                                                                              setstateee(() {
                                                                                                                                selectedcat = obj.model!.data![index].name!;
                                                                                                                                selectedcatId = obj.model!.data![index].categoryId!;
                                                                                                                              });
                                                                                                                            });

                                                                                                                            Navigator.pop(context);
                                                                                                                          },
                                                                                                                          child: ListTile(
                                                                                                                            leading: Container(
                                                                                                                              height: height * 0.05,
                                                                                                                              width: width * 0.1,
                                                                                                                              decoration: const BoxDecoration(
                                                                                                                                shape: BoxShape.circle,
                                                                                                                              ),
                                                                                                                              child: Padding(
                                                                                                                                padding: const EdgeInsets.all(8.0),
                                                                                                                                child: Image(
                                                                                                                                  image: AssetImage(
                                                                                                                                    obj.model!.data![index].imageUrl!,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            title: Text(
                                                                                                                              obj.model!.data![index].name!,
                                                                                                                              style: TextStyle(fontSize: width * 0.03, color: darkblue!, fontWeight: FontWeight.bold),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    }),
                                                                                                              )),
                                                                                                        );
                                                                                                      });
                                                                                                    });
                                                                                              },
                                                                                              child: Container(
                                                                                                color: Colors.grey.withOpacity(0.4),
                                                                                                height: height * 0.05,
                                                                                                width: width * 0.33,
                                                                                                child: Center(
                                                                                                    child: Text(
                                                                                                  selectedcat == null ? AppLocalizations.of(context)!.selectcategory : selectedcat!,
                                                                                                  style: TextStyle(fontSize: width * 0.03, color: darkblue!, fontWeight: FontWeight.bold),
                                                                                                )),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: height * 0.02,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: height * 0.08,
                                                                                        width: width,
                                                                                        child: Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Text(
                                                                                              '${AppLocalizations.of(context)!.picture} :',
                                                                                              style: TextStyle(fontSize: width * 0.03, color: darkblue!, fontWeight: FontWeight.bold),
                                                                                            ),
                                                                                            getimage == null
                                                                                                ? const CircleAvatar(
                                                                                                    radius: 20,
                                                                                                    backgroundColor: Colors.grey,
                                                                                                  )
                                                                                                : Container(
                                                                                                    height: height * 0.05,
                                                                                                    width: width * 0.1,
                                                                                                    decoration: const BoxDecoration(
                                                                                                      shape: BoxShape.circle,
                                                                                                      color: Colors.grey,
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                                      child: Image(
                                                                                                        image: AssetImage(getimage!),
                                                                                                      ),
                                                                                                    ),
                                                                                                  )
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: height * 0.02,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: height * 0.45,
                                                                                        width: width,
                                                                                        child: Center(
                                                                                          child: GridView.builder(
                                                                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                                              crossAxisCount: 5,
                                                                                              mainAxisSpacing: 20.0,
                                                                                              crossAxisSpacing: 20.0,
                                                                                            ),
                                                                                            itemCount: iconList.length,
                                                                                            itemBuilder: (context, index) {
                                                                                              return InkWell(
                                                                                                onTap: () {
                                                                                                  set(() {
                                                                                                    getimage = iconList[index];
                                                                                                  });
                                                                                                },
                                                                                                child: Container(
                                                                                                  height: height * 0.05,
                                                                                                  width: width * 0.1,
                                                                                                  decoration: const BoxDecoration(
                                                                                                    shape: BoxShape.circle,
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                                    child: Image(
                                                                                                      image: AssetImage(iconList[index]),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            onTap: () {
                                                                                              set(() {
                                                                                                getimage = null;
                                                                                              });
                                                                                            },
                                                                                            child: Container(
                                                                                              height: height * 0.05,
                                                                                              width: width * 0.3,
                                                                                              decoration: BoxDecoration(color: darkblue!, borderRadius: BorderRadius.circular(7)),
                                                                                              child: Center(
                                                                                                child: Text(
                                                                                                  AppLocalizations.of(context)!.cancel,
                                                                                                  style: TextStyle(fontSize: width * 0.03, color: Colors.white, fontWeight: FontWeight.bold),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            onTap: () {
                                                                                              if (getimage != null && subcatagorycontroller.text.isNotEmpty) {
                                                                                                selectedCatagorymodel = UserCategoryModel(parentId: selectedcatId, imageUrl: getimage, name: subcatagorycontroller.text, type: widget.income ? "income" : "expense");
                                                                                                TransactionController.to.adddCatagoriesdata(selectedCatagorymodel!);

                                                                                                Navigator.pop(context);
                                                                                              } else {
                                                                                                showtoast(AppLocalizations.of(context)!.pleasefullfillallfields);
                                                                                              }
                                                                                              getimage = null;
                                                                                              subcatagorycontroller.text = "";
                                                                                            },
                                                                                            child: Container(
                                                                                              height: height * 0.05,
                                                                                              width: width * 0.3,
                                                                                              decoration: BoxDecoration(color: darkblue!, borderRadius: BorderRadius.circular(7)),
                                                                                              child: Center(
                                                                                                child: Text(
                                                                                                  AppLocalizations.of(context)!.save,
                                                                                                  style: TextStyle(fontSize: width * 0.03, color: Colors.white, fontWeight: FontWeight.bold),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      });
                                                                    });
                                                              },
                                                              child: Container(
                                                                height: height *
                                                                    0.05,
                                                                width:
                                                                    width * 0.4,
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                        darkblue!,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            7)),
                                                                child: Center(
                                                                  child: Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .newsubcategory,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            width *
                                                                                0.03,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  height * 0.02,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return StatefulBuilder(builder:
                                                                        (context,
                                                                            setstateee) {
                                                                      return AlertDialog(
                                                                        elevation:
                                                                            10,
                                                                        shadowColor:
                                                                            darkblue!,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20)),
                                                                        title:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              AppLocalizations.of(context)!.categorymanagement,
                                                                              style: TextStyle(
                                                                                fontSize: width * 0.035,
                                                                                fontWeight: FontWeight.bold,
                                                                                color: darkblue!,
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              onTap: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                              child: Container(
                                                                                height: height * 0.04,
                                                                                width: width * 0.08,
                                                                                decoration: BoxDecoration(color: darkblue!, shape: BoxShape.circle),
                                                                                child: const Center(
                                                                                  child: Icon(
                                                                                    Icons.clear,
                                                                                    size: 15,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                        content:
                                                                            SizedBox(
                                                                          height:
                                                                              height * 0.8,
                                                                          width:
                                                                              width,
                                                                          child: ListView.builder(
                                                                              itemCount: obj.model!.data!.length,
                                                                              itemBuilder: (context, index) {
                                                                                return Padding(
                                                                                  padding: EdgeInsets.symmetric(
                                                                                    vertical: height * 0.01,
                                                                                  ),
                                                                                  child: ListTile(
                                                                                    leading: Container(
                                                                                      height: height * 0.05,
                                                                                      width: width * 0.1,
                                                                                      decoration: const BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                        child: Image(
                                                                                          image: AssetImage(
                                                                                            obj.model!.data![index].imageUrl!,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    title: Text(
                                                                                      obj.model!.data![index].name!,
                                                                                      style: TextStyle(fontSize: width * 0.03, color: darkblue!, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                    trailing: InkWell(
                                                                                        onTap: () {
                                                                                          TransactionController.to.deleteCatagoriesdata(obj.model!.data![index].categoryId!, widget.income ? "income" : "expense");
                                                                                        },
                                                                                        child: const Icon(Icons.delete)),
                                                                                  ),
                                                                                );
                                                                              }),
                                                                        ),
                                                                        actions: <Widget>[
                                                                          FloatingActionButton(
                                                                            backgroundColor:
                                                                                darkblue!,
                                                                            onPressed:
                                                                                () {
                                                                              controller.text = '';
                                                                              maingetimage == null;
                                                                              showDialog(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return StatefulBuilder(builder: (context, set) {
                                                                                      return SingleChildScrollView(
                                                                                        child: AlertDialog(
                                                                                          elevation: 10,
                                                                                          shadowColor: darkblue!,
                                                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                                          title: Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                AppLocalizations.of(context)!.addcatagory,
                                                                                                style: TextStyle(
                                                                                                  fontSize: width * 0.035,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  color: darkblue!,
                                                                                                ),
                                                                                              ),
                                                                                              InkWell(
                                                                                                onTap: () {
                                                                                                  Navigator.pop(context);
                                                                                                },
                                                                                                child: Container(
                                                                                                  height: height * 0.04,
                                                                                                  width: width * 0.08,
                                                                                                  decoration: BoxDecoration(color: darkblue!, shape: BoxShape.circle),
                                                                                                  child: const Center(
                                                                                                    child: Icon(
                                                                                                      Icons.clear,
                                                                                                      size: 15,
                                                                                                      color: Colors.white,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                          ),
                                                                                          content: SizedBox(
                                                                                            height: height * 0.8,
                                                                                            width: width,
                                                                                            child: Column(
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                SizedBox(
                                                                                                  height: height * 0.08,
                                                                                                  width: width,
                                                                                                  child: Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        '${AppLocalizations.of(context)!.name} :',
                                                                                                        style: TextStyle(fontSize: width * 0.03, color: darkblue!, fontWeight: FontWeight.bold),
                                                                                                      ),
                                                                                                      SizedBox(
                                                                                                        width: width * 0.3,
                                                                                                        child: TextFormField(
                                                                                                          controller: controller,
                                                                                                          decoration: const InputDecoration(
                                                                                                            hintText: "...",
                                                                                                            hintStyle: TextStyle(color: Colors.black),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  height: height * 0.08,
                                                                                                  width: width,
                                                                                                  child: Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        '${AppLocalizations.of(context)!.picture} :',
                                                                                                        style: TextStyle(fontSize: width * 0.03, color: darkblue!, fontWeight: FontWeight.bold),
                                                                                                      ),
                                                                                                      maingetimage == null
                                                                                                          ? const CircleAvatar(
                                                                                                              radius: 50,
                                                                                                              backgroundColor: Colors.grey,
                                                                                                            )
                                                                                                          : Container(
                                                                                                              height: height * 0.08,
                                                                                                              width: width * 0.16,
                                                                                                              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                                                                                                              child: Padding(
                                                                                                                padding: const EdgeInsets.all(8.0),
                                                                                                                child: Image(
                                                                                                                  image: AssetImage(maingetimage!),
                                                                                                                ),
                                                                                                              ),
                                                                                                            )
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  height: height * 0.02,
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  height: height * 0.45,
                                                                                                  width: width,
                                                                                                  child: Center(
                                                                                                    child: GridView.builder(
                                                                                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                                                        crossAxisCount: 5,
                                                                                                        mainAxisSpacing: 20.0,
                                                                                                        crossAxisSpacing: 20.0,
                                                                                                      ),
                                                                                                      itemCount: iconList.length,
                                                                                                      itemBuilder: (context, index) {
                                                                                                        return InkWell(
                                                                                                            onTap: () {
                                                                                                              set(() {
                                                                                                                maingetimage = iconList[index];
                                                                                                              });
                                                                                                            },
                                                                                                            child: Container(
                                                                                                              height: height * 0.05,
                                                                                                              width: width * 0.1,
                                                                                                              decoration: const BoxDecoration(
                                                                                                                shape: BoxShape.circle,
                                                                                                              ),
                                                                                                              child: Padding(
                                                                                                                padding: const EdgeInsets.all(8.0),
                                                                                                                child: Image(
                                                                                                                  image: AssetImage(iconList[index]),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ));
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                  children: [
                                                                                                    InkWell(
                                                                                                      onTap: () {
                                                                                                        set(() {
                                                                                                          maingetimage = null;
                                                                                                          Navigator.pop(context);
                                                                                                        });
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        height: height * 0.05,
                                                                                                        width: width * 0.3,
                                                                                                        decoration: BoxDecoration(color: darkblue!, borderRadius: BorderRadius.circular(7)),
                                                                                                        child: Center(
                                                                                                          child: Text(
                                                                                                            AppLocalizations.of(context)!.cancel,
                                                                                                            style: TextStyle(fontSize: width * 0.03, color: Colors.white, fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    InkWell(
                                                                                                      onTap: () {
                                                                                                        UserCategoryModel model = UserCategoryModel(parentId: null, imageUrl: maingetimage, name: controller.text, type: widget.income ? "income" : "expense");
                                                                                                        TransactionController.to.adddCatagoriesdata(model);

                                                                                                        Navigator.pop(context);
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        height: height * 0.05,
                                                                                                        width: width * 0.3,
                                                                                                        decoration: BoxDecoration(color: darkblue!, borderRadius: BorderRadius.circular(7)),
                                                                                                        child: Center(
                                                                                                          child: Text(
                                                                                                            AppLocalizations.of(context)!.save,
                                                                                                            style: TextStyle(fontSize: width * 0.03, color: Colors.white, fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    });
                                                                                  });
                                                                            },
                                                                            child:
                                                                                const Text(
                                                                              "+",
                                                                              style: TextStyle(fontSize: 40),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      );
                                                                    });
                                                                  },
                                                                );
                                                              },
                                                              child: Container(
                                                                height: height *
                                                                    0.05,
                                                                width:
                                                                    width * 0.5,
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                        darkblue!,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            7)),
                                                                child: Center(
                                                                  child: Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .categorymanagement,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            width *
                                                                                0.03,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                                });
                                          },
                                          title: Text(
                                            selectcatagorytital ??
                                                AppLocalizations.of(context)!
                                                    .selectcategory,
                                            style: TextStyle(
                                              fontSize: width * 0.035,
                                            ),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_drop_down,
                                            color: darkblue!,
                                          ),
                                        );
                                      }),
                                      SizedBox(
                                          height: height * 0.06,
                                          width: width,
                                          // color: AppColors.backgroundColor,
                                          child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content: Container(
                                                      color:
                                                          Colors.grey.shade300,
                                                      height: height * 0.35,
                                                      width: width * 0.8,
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                            height:
                                                                height * 0.15,
                                                            width: width,
                                                            decoration: const BoxDecoration(
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: AssetImage(
                                                                        "images/dollar.jpg"))),
                                                          ),
                                                          Container(
                                                            height:
                                                                height * 0.15,
                                                            width: width,
                                                            color: Colors
                                                                .blue[900]!
                                                                .withOpacity(
                                                                    0.9),
                                                            child: Padding(
                                                              padding: EdgeInsets.only(
                                                                  top: height *
                                                                      0.03,
                                                                  left: width *
                                                                      0.02),
                                                              child: Text(
                                                                "Select Payment ",
                                                                style: TextStyle(
                                                                    color:
                                                                        white,
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: height *
                                                                        0.07),
                                                            child: Center(
                                                              child: Card(
                                                                elevation: 10,
                                                                shadowColor:
                                                                    Colors.blue[
                                                                        900],
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      height *
                                                                          0.3,
                                                                  width: width *
                                                                      0.7,
                                                                  color: white,
                                                                  child: Center(
                                                                    child: ListView
                                                                        .builder(
                                                                            itemCount:
                                                                                PaymentTypeModel.typemodellist.length,
                                                                            itemBuilder: (context, index) {
                                                                              bool isactive = HomeController.to.paymenttypeindex == index;
                                                                              return GestureDetector(
                                                                                onTap: () {
                                                                                  setState(() {
                                                                                    HomeController.to.paymenttypeindex = index;
                                                                                    paymentMethod = index;
                                                                                    selectedimage = PaymentTypeModel.typemodellist[HomeController.to.paymenttypeindex!].image;
                                                                                    selectPaymentMethod.text = PaymentTypeModel.typemodellist[HomeController.to.paymenttypeindex!].name!;
                                                                                  });
                                                                                  print("name $selectedname");
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: SizedBox(
                                                                                  height: height * 0.08,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: width * 0.11,
                                                                                        height: height * 0.11,
                                                                                        child: Image(image: AssetImage("${PaymentTypeModel.typemodellist[index].image}")),
                                                                                      ),
                                                                                      Text(
                                                                                        "${PaymentTypeModel.typemodellist[index].name}",
                                                                                        style: const TextStyle(
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: width * 0.2,
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: IgnorePointer(
                                              child: TextFormField(
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                controller: selectPaymentMethod,
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  labelText: 'Select Payment',
                                                  labelStyle: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  prefixIcon: Icon(
                                                    Icons.attach_money_outlined,
                                                    color: Colors.grey.shade700,
                                                    size: 25,
                                                  ),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please Select Payment';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        height: height * 0.07,
                                        width: width * 0.95,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: Container(
                                                          color: Colors
                                                              .grey.shade300,
                                                          height: height * 0.35,
                                                          width: width * 0.8,
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                height: height *
                                                                    0.15,
                                                                width: width,
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        image: AssetImage(
                                                                            "images/dollar.jpg"))),
                                                              ),
                                                              Container(
                                                                height: height *
                                                                    0.15,
                                                                width: width,
                                                                color: Colors
                                                                    .blue[900]!
                                                                    .withOpacity(
                                                                        0.9),
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: height *
                                                                          0.03,
                                                                      left: width *
                                                                          0.02),
                                                                  child: Text(
                                                                    "Select Wallet ",
                                                                    style: TextStyle(
                                                                        color:
                                                                            white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    top: height *
                                                                        0.07),
                                                                child: Center(
                                                                  child: Card(
                                                                    elevation:
                                                                        10,
                                                                    shadowColor:
                                                                        Colors.blue[
                                                                            900],
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          height *
                                                                              0.3,
                                                                      width:
                                                                          width *
                                                                              0.7,
                                                                      color:
                                                                          white,
                                                                      child:
                                                                          Center(
                                                                        child: ListView.builder(
                                                                            itemCount: HomeController.to.walletList.length,
                                                                            itemBuilder: (context, index) {
                                                                              return Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    setState(() {
                                                                                      walletID = HomeController.to.walletList[index].walletId;

                                                                                      walletname = HomeController.to.walletList[index].name!;
                                                                                      paymentMethod = index;
                                                                                      //                                                          walletname = account.name!;
                                                                                      // walletID = account.walletId;
                                                                                      // Navigator.pop(context);
                                                                                      setState(() {});
                                                                                    });
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child: Card(
                                                                                    elevation: 10,
                                                                                    child: SizedBox(
                                                                                      height: height * 0.08,
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          SizedBox(
                                                                                            width: width * 0.11,
                                                                                            height: height * 0.11,
                                                                                            child: Icon(
                                                                                              Icons.wallet,
                                                                                              color: Colors.grey.shade700,
                                                                                              size: 25,
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Container(
                                                                                              alignment: Alignment.centerLeft,
                                                                                              height: height,
                                                                                              width: width,
                                                                                              child: Text(
                                                                                                "${HomeController.to.walletList[index].name}",
                                                                                                style: TextStyle(
                                                                                                  fontSize: width * 0.03,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: IgnorePointer(
                                                  child: TextFormField(
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    controller:
                                                        _dueDateController,
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      labelText: 'Wallet',
                                                      labelStyle:
                                                          const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                      prefixIcon: Icon(
                                                        Icons.wallet,
                                                        color: Colors
                                                            .grey.shade700,
                                                        size: 25,
                                                      ),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please Select Wallet';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.07,
                                        width: width * 0.95,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  _selectDate(context);
                                                },
                                                child: IgnorePointer(
                                                  child: TextFormField(
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    controller:
                                                        TextEditingController(
                                                      text:
                                                          '  ${DateFormat.yMMMd().format(_selectedDate)}',
                                                    ),
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      labelText:
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .date,
                                                      labelStyle:
                                                          const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                      prefixIcon: Icon(
                                                        Icons.calendar_today,
                                                        color: Colors
                                                            .grey.shade700,
                                                        size: 25,
                                                      ),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please Select Date';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: EdgeInsets.only(
                                      //       left: width * 0.025),
                                      //   child: SizedBox(
                                      //     width: width * 0.4,
                                      //     child: InkWell(
                                      //       onTap: () => _selectDate(context),
                                      //       child: IgnorePointer(
                                      //         child: TextFormField(
                                      //           controller:
                                      //               TextEditingController(
                                      //             text:
                                      //                 '  ${DateFormat.yMMMd().format(_selectedDate)}',
                                      //           ),
                                      //           decoration: InputDecoration(
                                      //             labelText:
                                      //                 AppLocalizations.of(
                                      //                         context)!
                                      //                     .date,
                                      //             labelStyle: TextStyle(
                                      //                 fontSize: width * 0.045,
                                      //                 color:
                                      //                     Colors.grey.shade700,
                                      //                 fontWeight:
                                      //                     FontWeight.w500),
                                      //             prefix: Icon(
                                      //               Icons.calendar_today,
                                      //               color: Colors.grey.shade700,
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      index == 1
                                          ? Container(
                                              child: Column(children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Card(
                                                      elevation: 7,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: SizedBox(
                                                        width: width * 0.4,
                                                        height: height * 0.055,
                                                        child: TextFormField(
                                                          controller:
                                                              repeatcontrooler,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          decoration:
                                                              InputDecoration(
                                                            errorStyle:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical: 0,
                                                                    horizontal:
                                                                        20),
                                                            fillColor:
                                                                Colors.grey,
                                                            hintText: AppLocalizations
                                                                    .of(context)!
                                                                .repeatesevery,
                                                            alignLabelWithHint:
                                                                true,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          darkblue!),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          darkblue!),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Card(
                                                      elevation: 7,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Container(
                                                        height: height * 0.055,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border:
                                                                    Border.all(
                                                                  color:
                                                                      darkblue!,
                                                                )),
                                                        width: width * 0.4,
                                                        child:
                                                            DropdownButtonHideUnderline(
                                                          child: DropdownButton<
                                                              String>(
                                                            dropdownColor:
                                                                Colors.white,
                                                            focusColor:
                                                                darkblue!,
                                                            value:
                                                                dropdownvalue,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    width *
                                                                        0.035),
                                                            onChanged:
                                                                (newValue) {
                                                              setState(() {
                                                                dropdownvalue =
                                                                    newValue
                                                                        as String;
                                                              });
                                                            },
                                                            items: listdropdown.map<
                                                                DropdownMenuItem<
                                                                    String>>((String
                                                                value) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: value,
                                                                child: Text(
                                                                  value,
                                                                  style: TextStyle(
                                                                      color:
                                                                          darkblue!,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          width *
                                                                              0.035),
                                                                ),
                                                              );
                                                            }).toList(),
                                                            hint: Text(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .selecttype),
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              color: Colors.grey
                                                                  .shade700,
                                                            ),
                                                            elevation: 1,
                                                            isExpanded: true,
                                                            isDense: true,
                                                            selectedItemBuilder:
                                                                (BuildContext
                                                                    context) {
                                                              return listdropdown
                                                                  .map<Widget>(
                                                                      (String
                                                                          value) {
                                                                return Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            8.0),
                                                                    child: Text(
                                                                      value,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color: Colors
                                                                              .grey
                                                                              .shade700,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                );
                                                              }).toList();
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: width * 0.02),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Card(
                                                        elevation: 7,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: SizedBox(
                                                          width: width * 0.4,
                                                          height:
                                                              height * 0.055,
                                                          child: TextFormField(
                                                            controller:
                                                                numberoftimescontroller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            decoration:
                                                                InputDecoration(
                                                              errorStyle:
                                                                  const TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          0,
                                                                      horizontal:
                                                                          20),
                                                              fillColor:
                                                                  Colors.grey,
                                                              hintText: AppLocalizations
                                                                      .of(context)!
                                                                  .numberoftimes,
                                                              alignLabelWithHint:
                                                                  true,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            darkblue!),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            darkblue!),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        "Zero Time Means Limit",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: darkblue!,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Card(
                                                  elevation: 7,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: SizedBox(
                                                    width: width * 0.8,
                                                    height: height * 0.055,
                                                    child: TextFormField(
                                                      controller:
                                                          fromcontroller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          InputDecoration(
                                                        errorStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 0,
                                                                horizontal: 20),
                                                        fillColor: Colors.grey,
                                                        hintText:
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .fromoptional,
                                                        alignLabelWithHint:
                                                            true,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide: BorderSide(
                                                              color: darkblue!),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide: BorderSide(
                                                              color: darkblue!),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Card(
                                                  elevation: 7,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: SizedBox(
                                                    width: width * 0.8,
                                                    height: height * 0.055,
                                                    child: TextField(
                                                      controller:
                                                          notescontroller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          InputDecoration(
                                                        errorStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 0,
                                                                horizontal: 20),
                                                        fillColor: Colors.grey,
                                                        hintText:
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .noteoptional,
                                                        alignLabelWithHint:
                                                            true,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide: BorderSide(
                                                              color: darkblue!),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide: BorderSide(
                                                              color: darkblue!),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: width * 0.05),
                                                  child: SizedBox(
                                                    height: height * 0.07,
                                                    width: width * 0.95,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {
                                                              _selectDateschedule(
                                                                  context);
                                                            },
                                                            child:
                                                                IgnorePointer(
                                                              child:
                                                                  TextFormField(
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                                controller:
                                                                    TextEditingController(
                                                                  text:
                                                                      '  ${DateFormat.yMMMd().format(_selectedDateschedule)}',
                                                                ),
                                                                decoration:
                                                                    InputDecoration(
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  labelText:
                                                                      AppLocalizations.of(
                                                                              context)!
                                                                          .date,
                                                                  labelStyle: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                  prefixIcon:
                                                                      Icon(
                                                                    Icons
                                                                        .calendar_today,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade700,
                                                                    size: 25,
                                                                  ),
                                                                ),
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return 'Please Select Date';
                                                                  }
                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        SizedBox(
                                                            width: width * 0.3),
                                                        // InkWell(
                                                        //   onTap: () =>
                                                        //       _selectTime(
                                                        //           context),
                                                        //   child: Row(
                                                        //     mainAxisSize:
                                                        //         MainAxisSize.min,
                                                        //     children: [
                                                        //       const Icon(
                                                        //         Icons.access_time,
                                                        //       ),
                                                        //       const SizedBox(
                                                        //           width: 15),
                                                        //       Text(
                                                        //         '${_selectedTime.hour}:${_selectedTime.minute}',
                                                        //         style: TextStyle(
                                                        //             fontSize:
                                                        //                 width *
                                                        //                     0.045,
                                                        //             color: Colors
                                                        //                 .grey
                                                        //                 .shade700,
                                                        //             fontWeight:
                                                        //                 FontWeight
                                                        //                     .w400),
                                                        //       ),
                                                        //     ],
                                                        //   ),
                                                        // ),

                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {
                                                              _selectTime(
                                                                  context);
                                                            },
                                                            child:
                                                                IgnorePointer(
                                                              child:
                                                                  TextFormField(
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                                controller:
                                                                    TextEditingController(
                                                                  text:
                                                                      '${_selectedTime.hour}:${_selectedTime.minute}',
                                                                ),
                                                                decoration:
                                                                    InputDecoration(
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  labelText:
                                                                      "Time",
                                                                  labelStyle: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                  prefixIcon:
                                                                      Icon(
                                                                    Icons
                                                                        .access_time,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade700,
                                                                    size: 25,
                                                                  ),
                                                                ),
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return 'Please Select Time';
                                                                  }
                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            )
                                          : Container(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  Card(
                                                    elevation: 7,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: SizedBox(
                                                      width: width * 0.85,
                                                      child: TextFormField(
                                                        controller:
                                                            fromcontroller,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        decoration:
                                                            InputDecoration(
                                                          errorStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 0,
                                                                  horizontal:
                                                                      20),
                                                          fillColor:
                                                              Colors.grey,
                                                          hintText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .fromoptional,
                                                          alignLabelWithHint:
                                                              true,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide: BorderSide(
                                                                color:
                                                                    darkblue!),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide: BorderSide(
                                                                color:
                                                                    darkblue!),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  Card(
                                                    elevation: 7,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: SizedBox(
                                                      width: width * 0.85,
                                                      child: TextFormField(
                                                        controller:
                                                            notescontroller,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        decoration:
                                                            InputDecoration(
                                                          errorStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 0,
                                                                  horizontal:
                                                                      20),
                                                          fillColor:
                                                              Colors.grey,
                                                          hintText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .noteoptional,
                                                          alignLabelWithHint:
                                                              true,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide: BorderSide(
                                                                color:
                                                                    darkblue!),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide: BorderSide(
                                                                color:
                                                                    darkblue!),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                width * 0.05),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .checked,
                                                          style: TextStyle(
                                                              fontSize:
                                                                  width * 0.04,
                                                              color: darkblue!,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        FlutterSwitch(
                                                            height:
                                                                height * 0.032,
                                                            width: width * 0.13,
                                                            toggleSize:
                                                                width * 0.06,
                                                            activeColor:
                                                                darkblue!,
                                                            value: status,
                                                            onToggle: (val) {
                                                              setState(() {
                                                                status = val;
                                                              });
                                                            }),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Icon(
                                            Icons.file_present_outlined,
                                            size: width * 0.065,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Card(
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: InkWell(
                                              onTap: () {
                                                selectImage(context);
                                              },
                                              child: Container(
                                                height: height * 0.05,
                                                width: width * 0.2,
                                                decoration: BoxDecoration(
                                                    color: darkblue!,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3)),
                                                child: Center(
                                                  child: Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .addfile,
                                                    style: TextStyle(
                                                        fontSize: width * 0.03,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.05,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: height * 0.05,
                                                width: width * 0.35,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3)),
                                                child: Center(
                                                  child: Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .cancel,
                                                    style: TextStyle(
                                                        fontSize: width * 0.03,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                postschedule(context);
                                              },
                                              child: Container(
                                                height: height * 0.05,
                                                width: width * 0.35,
                                                decoration: BoxDecoration(
                                                    color: darkblue!,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3)),
                                                child: Center(
                                                  child: Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .save,
                                                    style: TextStyle(
                                                        fontSize: width * 0.03,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      keyboard
                                          ? SizedBox(
                                              height: height * 0.3,
                                            )
                                          : const SizedBox()
                                    ]),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  // Future<void> showWalletDialog(
  //   BuildContext context,
  //   var height,
  //   var width,
  // ) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //           elevation: 10,
  //           shadowColor: darkblue!,
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //           title: Text(
  //             '${AppLocalizations.of(context)!.select} ${AppLocalizations.of(context)!.wallet}:',
  //             style: TextStyle(fontWeight: FontWeight.bold, color: darkblue!),
  //           ),
  //           content: SizedBox(
  //             height: height * 0.3,
  //             width: width,
  //             child: FutureBuilder<wal.UserWalletModel>(
  //               future: TransactionController.to.fetchAccounts(),
  //               builder: (context, snapshot) {
  //                 if (snapshot.hasError) {
  //                   return Text('Error: ${snapshot.error}');
  //                 }

  //                 if (snapshot.connectionState == ConnectionState.waiting) {
  //                   return const Center(child: CircularProgressIndicator());
  //                 } else {
  //                   return SizedBox(
  //                     height: height,
  //                     child: ListView.builder(
  //                       itemCount: snapshot.data!.data!.length,
  //                       itemBuilder: (context, index) {
  //                         wal.Data account = snapshot.data!.data![index];
  //                         return InkWell(
  //                           onTap: () {
  //                             walletname = account.name!;
  //                             walletID = account.walletId;
  //                             Navigator.pop(context);
  //                             setState(() {});
  //                           },
  //                           child: SizedBox(
  //                               height: height * 0.1,
  //                               child: accountCard(account, index, context)),
  //                         );
  //                       },
  //                     ),
  //                   );
  //                 }
  //               },
  //             ),
  //           ));
  //     },
  //   );
  // }

  Card accountCard(wal.Data account, int index, context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
      shadowColor: darkblue!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              account.name!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${AppLocalizations.of(context)!.balance}:",
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${HomeController.to.curency}${account.amount!}",
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          if (account.transferred!)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.flag_circle),
                Text(
                  AppLocalizations.of(context)!.transferred,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

void showtoast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      backgroundColor: darkblue!,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      fontSize: 17,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_LONG);
}
