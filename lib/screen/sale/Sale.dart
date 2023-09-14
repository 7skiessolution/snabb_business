// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/controller/saleController.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/models/payment_type_model.dart';
import 'package:snabb_business/screen/sale/IncomeDataMode.dart';
import 'package:snabb_business/screen/sale/income_catagery._model.dart';
import 'package:snabb_business/screen/sale/user_category_model.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/utils/daimond_shape.dart';

class SaleScreen extends StatefulWidget {
  int? type;
  SaleScreen({super.key, required this.type});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  @override
  void initState() {
    Get.put(HomeController());
    Get.put(SaleController());
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController balanceController = TextEditingController();
  TextEditingController partialAmountController = TextEditingController();
  final TextEditingController _currentDateController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _person = TextEditingController();
  final TextEditingController selectPaymentMethod = TextEditingController();
  String? selectedimage;
  String? selectedname;
  String? walletID;
  String? walletName;
  int? paymentMethod;
  DateTime _currentDate = DateTime.now();
  DateTime _dueDate = DateTime.now();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController controller = TextEditingController();
  final TextEditingController subcatagorycontroller = TextEditingController();
  String formatTime = "";
  String? maingetimage;
  String? selectcatagorytital;
  String? selectcatagoryurl;
  UserCategoryModel? selectedCatagorymodel;
  String? selectedcat;
  String? selectedcatId;
  bool isLoading = false;
  bool isselectcatagory = false;
  bool schedual = false;
  CatagoryModel? catagorymodel;
  int? clicktile;
  var height, width;
  List<SubCatagoriesModel> dummysubcatagorylist = [];
  List<SubCatagoriesModel> subcatagorylistview = [];
  String? getimage;
  IncomeDataCategory? selectcatagorytile;
  bool opencatagoryclick = false;

  void showtoast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: Colors.blue[900],
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG);
  }

  Future<void> _selectDate(BuildContext context,
      TextEditingController controller, DateTime initialDate) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        controller.text = DateFormat("dd-MM-yyyy").format(selectedDate);
        formatTime = controller.text;
        if (controller == _currentDateController) {
          _currentDate = selectedDate;
        } else if (controller == _dueDateController) {
          _dueDate = selectedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[100],
        body: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Stack(children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    elevation: 10,
                    child: SizedBox(
                        height: height * 0.06,
                        width: width * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(Icons.arrow_back_ios)),
                              Expanded(
                                child: Container(
                                  height: height,
                                  width: width,
                                  alignment: Alignment.center,
                                  child: Text(
                                    widget.type == 1
                                        ? "Sale"
                                        : widget.type == 0
                                            ? "Purchase"
                                            : "expense",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.08),
                child: SizedBox(
                  height: height * 0.12,
                  width: width,
                  child: Stack(
                    children: [
                      Container(
                        height: height * 0.12,
                        width: width,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/dollar.jpg"))),
                      ),
                      Container(
                        height: height * 0.12,
                        width: width,
                        color: Colors.blue[900]!.withOpacity(0.9),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 20, right: 20),
                          child: Text(
                            "New Entry",
                            style: TextStyle(
                                color: white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.13),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.blue[900],
                    child: SizedBox(
                      height: height * 0.81,
                      width: width * 0.95,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.13,
                            width: width,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: height,
                                      width: width,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: height * 0.07,
                                            width: width,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller:
                                                          balanceController,
                                                      keyboardType:
                                                          const TextInputType
                                                                  .numberWithOptions(
                                                              decimal: true),
                                                      decoration:
                                                          const InputDecoration(
                                                        labelText: "Amount",
                                                      ),
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Please enter the balance amount';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  const Text("PKR")
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.05,
                                  ),
                                  Expanded(
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const CircleAvatar(
                                                  radius: 7,
                                                ),
                                                SizedBox(width: width * 0.02),
                                                const Text("Partial Payment",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                    )),
                                              ],
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: TextFormField(
                                                controller:
                                                    partialAmountController,
                                                keyboardType: const TextInputType
                                                        .numberWithOptions(
                                                    decimal: true),
                                                decoration: const InputDecoration(
                                                    labelText: "Amount",
                                                    suffix: Text("PKR")),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter the balance amount';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  height: height * 0.07,
                                  width: width * 0.15,
                                  child: CircleAvatar(
                                    child: CircleAvatar(
                                      radius: 22,
                                      // backgroundColor: white,
                                      backgroundImage:
                                          AssetImage(widget.type == 1
                                              ? "images/sale.png"
                                              : widget.type == 0
                                                  ? "images/sale.png"
                                                  : "images/expensive.png"),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.type == 1
                                          ? "Sale"
                                          : widget.type == 0
                                              ? "Purchase"
                                              : "expense",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text("Total:")
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text("0.0PKR"),
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.red,
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          GetBuilder<TransactionController>(builder: (obj) {
                            return ListTile(
                              onTap: () {
                                clicktile = null;
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                          builder: (context, state) {
                                        return AlertDialog(
                                          elevation: 10,
                                          shadowColor: Colors.blue[900],
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          title: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .selectcategory,
                                                style: TextStyle(
                                                  fontSize: width * 0.035,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue[900],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: height * 0.04,
                                                  width: width * 0.08,
                                                  decoration: BoxDecoration(
                                                      color: Colors.blue[900],
                                                      shape: BoxShape.circle),
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
                                              children: [
                                                Expanded(
                                                  child: obj.model == null
                                                      ? Center(
                                                          child: SpinKitCircle(
                                                            color: Colors
                                                                .blue[900],
                                                            size: 50.0,
                                                          ),
                                                        )
                                                      : ListView.builder(
                                                          itemCount: obj.model!
                                                              .data!.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return clicktile == index &&
                                                                    clicktile !=
                                                                        null &&
                                                                    opencatagoryclick ==
                                                                        true
                                                                ? Column(
                                                                    children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              selectcatagorytital = obj.model!.data![index].name;
                                                                              selectedcatId = obj.model!.data![index].categoryId;
                                                                            });
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              ListTile(
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
                                                                                  color: Colors.blue[900],
                                                                                )),
                                                                            leading:
                                                                                Container(
                                                                              height: height * 0.06,
                                                                              width: width * 0.12,
                                                                              decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage(obj.model!.data![index].imageUrl!))),
                                                                            ),
                                                                            title:
                                                                                Text(
                                                                              obj.model!.data![index].name!,
                                                                              style: TextStyle(fontSize: width * 0.035, color: Colors.blue[900], fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          obj.model!.data![index].child!.isEmpty
                                                                              ? AppLocalizations.of(context)!.nosubcategory
                                                                              : "${AppLocalizations.of(context)!.subcatagoriesof}"
                                                                                  "${obj.model!.data![index].name!}",
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                10,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: height *
                                                                              0.1 *
                                                                              obj.model!.data![index].child!.length,
                                                                          child:
                                                                              ListView.builder(
                                                                            physics:
                                                                                const NeverScrollableScrollPhysics(),
                                                                            itemCount:
                                                                                obj.model!.data![index].child!.length,
                                                                            itemBuilder:
                                                                                (BuildContext context, int i) {
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
                                                                                    height: height * 0.06,
                                                                                    width: width * 0.12,
                                                                                    decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage(obj.model!.data![index].child![i].imageUrl!))),
                                                                                  ),

                                                                                  //  Container(
                                                                                  //   height: height * 0.1,
                                                                                  //   width: width * 0.15,
                                                                                  //   decoration: BoxDecoration(
                                                                                  //     shape: BoxShape.circle,
                                                                                  //   ),
                                                                                  //   child: Image(
                                                                                  //     image: AssetImage(
                                                                                  //       ,
                                                                                  //     ),
                                                                                  //   ),
                                                                                  // ),
                                                                                  title: Text(
                                                                                    obj.model!.data![index].child![i].name!,
                                                                                    style: TextStyle(fontSize: width * 0.035, color: Colors.blue[900], fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        )
                                                                      ])
                                                                : ListTile(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        selectcatagorytital = obj
                                                                            .model!
                                                                            .data![index]
                                                                            .name;
                                                                        selectedcatId = obj
                                                                            .model!
                                                                            .data![index]
                                                                            .categoryId;
                                                                      });
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    trailing:
                                                                        IconButton(
                                                                            onPressed:
                                                                                () {
                                                                              state(() {
                                                                                clicktile = index;
                                                                                opencatagoryclick = !opencatagoryclick;
                                                                              });
                                                                              setState(() {});
                                                                            },
                                                                            icon:
                                                                                Icon(
                                                                              clicktile == index && clicktile != null ? Icons.arrow_drop_down_outlined : Icons.arrow_drop_up_outlined,
                                                                              color: Colors.blue[900],
                                                                            )),
                                                                    leading:
                                                                        Container(
                                                                      height:
                                                                          height *
                                                                              0.06,
                                                                      width: width *
                                                                          0.12,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        image: DecorationImage(
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            image: AssetImage(obj.model!.data![index].imageUrl!)),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                    title: Text(
                                                                      obj
                                                                          .model!
                                                                          .data![
                                                                              index]
                                                                          .name!,
                                                                      style: TextStyle(
                                                                          fontSize: width *
                                                                              0.035,
                                                                          color: Colors.blue[
                                                                              900],
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  );
                                                          },
                                                        ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      getimage = null;
                                                      isLoading = false;
                                                      subcatagorycontroller
                                                          .text = "";
                                                    });

                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return StatefulBuilder(
                                                              builder: (context,
                                                                  set) {
                                                            return SingleChildScrollView(
                                                              child:
                                                                  AlertDialog(
                                                                elevation: 10,
                                                                shadowColor:
                                                                    Colors.blue[
                                                                        900],
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20)),
                                                                title: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      AppLocalizations.of(
                                                                              context)!
                                                                          .newsubcategory,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            width *
                                                                                0.035,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Colors
                                                                            .blue[900],
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height: height *
                                                                            0.04,
                                                                        width: width *
                                                                            0.08,
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Colors.blue[900],
                                                                            shape: BoxShape.circle),
                                                                        child:
                                                                            const Center(
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            size:
                                                                                15,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                content: Stack(
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.8,
                                                                      width:
                                                                          width,
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                height * 0.08,
                                                                            width:
                                                                                width,
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  '${AppLocalizations.of(context)!.name} :',
                                                                                  style: TextStyle(fontSize: width * 0.035, color: Colors.blue[900]),
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
                                                                            height:
                                                                                height * 0.08,
                                                                            width:
                                                                                width,
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  AppLocalizations.of(context)!.maincategory,
                                                                                  style: TextStyle(fontSize: width * 0.035, color: Colors.blue[900], fontWeight: FontWeight.bold),
                                                                                ),
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    ////////// selection
                                                                                    showDialog(
                                                                                        context: context,
                                                                                        builder: (BuildContext context) {
                                                                                          return StatefulBuilder(builder: (context, setstateee) {
                                                                                            return SingleChildScrollView(
                                                                                              child: AlertDialog(
                                                                                                  elevation: 10,
                                                                                                  shadowColor: Colors.blue[900],
                                                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                                                  title: Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        AppLocalizations.of(context)!.selectcategory,
                                                                                                        style: TextStyle(fontSize: width * 0.03, color: Colors.blue[900], fontWeight: FontWeight.bold),
                                                                                                      ),
                                                                                                      InkWell(
                                                                                                        onTap: () {
                                                                                                          Navigator.pop(context);
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          height: height * 0.04,
                                                                                                          width: width * 0.08,
                                                                                                          decoration: BoxDecoration(color: Colors.blue[900], shape: BoxShape.circle),
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
                                                                                                                  height: height * 0.06,
                                                                                                                  width: width * 0.12,
                                                                                                                  decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage(obj.model!.data![index].imageUrl!))),
                                                                                                                ),
                                                                                                                title: Text(
                                                                                                                  obj.model!.data![index].name!,
                                                                                                                  style: TextStyle(fontSize: width * 0.035, color: Colors.blue[900], fontWeight: FontWeight.bold),
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
                                                                                      style: TextStyle(fontSize: width * 0.035, color: Colors.blue[900], fontWeight: FontWeight.bold),
                                                                                    )),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                height * 0.02,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                height * 0.08,
                                                                            width:
                                                                                width,
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  '${AppLocalizations.of(context)!.picture} :',
                                                                                  style: TextStyle(fontSize: width * 0.035, color: Colors.blue[900], fontWeight: FontWeight.bold),
                                                                                ),
                                                                                getimage == null
                                                                                    ? const CircleAvatar(
                                                                                        radius: 20,
                                                                                        backgroundColor: Colors.grey,
                                                                                      )
                                                                                    : Container(
                                                                                        height: height * 0.06,
                                                                                        width: width * 0.12,
                                                                                        decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage(getimage!))),
                                                                                      ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                height * 0.02,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                height * 0.45,
                                                                            width:
                                                                                width,
                                                                            child:
                                                                                Center(
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
                                                                                      height: height * 0.1,
                                                                                      width: width * 0.15,
                                                                                      decoration: const BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image(
                                                                                        image: AssetImage(iconList[index]),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
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
                                                                                  decoration: BoxDecoration(color: Colors.blue[900], borderRadius: BorderRadius.circular(7)),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      AppLocalizations.of(context)!.cancel,
                                                                                      style: TextStyle(fontSize: width * 0.035, color: Colors.white, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  if (getimage != null && subcatagorycontroller.text.isNotEmpty) {
                                                                                    selectedCatagorymodel = UserCategoryModel(parentId: selectedcatId, imageUrl: getimage, name: subcatagorycontroller.text, type: "income");
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
                                                                                  decoration: BoxDecoration(color: Colors.blue[900], borderRadius: BorderRadius.circular(7)),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      AppLocalizations.of(context)!.save,
                                                                                      style: TextStyle(fontSize: width * 0.035, color: Colors.white, fontWeight: FontWeight.bold),
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
                                                    height: height * 0.05,
                                                    width: width * 0.4,
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue[900],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7)),
                                                    child: Center(
                                                      child: Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .newsubcategory,
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.035,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (context,
                                                                setstateee) {
                                                          return AlertDialog(
                                                            elevation: 10,
                                                            shadowColor: Colors
                                                                .blue[900],
                                                            shape: RoundedRectangleBorder(
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
                                                                      .categorymanagement,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        width *
                                                                            0.035,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                            .blue[
                                                                        900],
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        height *
                                                                            0.04,
                                                                    width:
                                                                        width *
                                                                            0.08,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.blue[
                                                                            900],
                                                                        shape: BoxShape
                                                                            .circle),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .clear,
                                                                        size:
                                                                            15,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            content: SizedBox(
                                                              height:
                                                                  height * 0.8,
                                                              width: width,
                                                              child: ListView
                                                                  .builder(
                                                                      itemCount: obj
                                                                          .model!
                                                                          .data!
                                                                          .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              index) {
                                                                        return Padding(
                                                                          padding:
                                                                              EdgeInsets.symmetric(
                                                                            vertical:
                                                                                height * 0.01,
                                                                          ),
                                                                          child:
                                                                              ListTile(
                                                                            leading:
                                                                                Container(
                                                                              height: height * 0.06,
                                                                              width: width * 0.12,
                                                                              decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage(obj.model!.data![index].imageUrl!))),
                                                                            ),
                                                                            title:
                                                                                Text(
                                                                              obj.model!.data![index].name!,
                                                                              style: TextStyle(fontSize: width * 0.035, color: Colors.blue[900], fontWeight: FontWeight.bold),
                                                                            ),
                                                                            trailing: InkWell(
                                                                                onTap: () {
                                                                                  TransactionController.to.deleteCatagoriesdata(obj.model!.data![index].categoryId!, "income");
                                                                                },
                                                                                child: const Icon(Icons.delete)),
                                                                          ),
                                                                        );
                                                                      }),
                                                            ),
                                                            actions: <Widget>[
                                                              FloatingActionButton(
                                                                shape:
                                                                    const DiamondBorder(),
                                                                backgroundColor:
                                                                    Colors.blue[
                                                                        900],
                                                                onPressed: () {
                                                                  controller
                                                                      .text = '';
                                                                  maingetimage ==
                                                                      null;
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
                                                                              elevation: 10,
                                                                              shadowColor: Colors.blue[900],
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                              title: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    AppLocalizations.of(context)!.addcatagory,
                                                                                    style: TextStyle(
                                                                                      fontSize: width * 0.035,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      color: Colors.blue[900],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Container(
                                                                                      height: height * 0.04,
                                                                                      width: width * 0.08,
                                                                                      decoration: BoxDecoration(color: Colors.blue[900], shape: BoxShape.circle),
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
                                                                                            style: TextStyle(fontSize: width * 0.035, color: Colors.blue[900], fontWeight: FontWeight.bold),
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
                                                                                            style: TextStyle(fontSize: width * 0.035, color: Colors.blue[900], fontWeight: FontWeight.bold),
                                                                                          ),
                                                                                          maingetimage == null
                                                                                              ? const CircleAvatar(
                                                                                                  radius: 50,
                                                                                                  backgroundColor: Colors.grey,
                                                                                                )
                                                                                              : Container(
                                                                                                  height: height * 0.06,
                                                                                                  width: width * 0.12,
                                                                                                  decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage(maingetimage!))),
                                                                                                ),
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
                                                                                                height: height * 0.06,
                                                                                                width: width * 0.12,
                                                                                                decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage(iconList[index]))),
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
                                                                                              maingetimage = null;
                                                                                              Navigator.pop(context);
                                                                                            });
                                                                                          },
                                                                                          child: Container(
                                                                                            height: height * 0.05,
                                                                                            width: width * 0.3,
                                                                                            decoration: BoxDecoration(color: Colors.blue[900], borderRadius: BorderRadius.circular(7)),
                                                                                            child: Center(
                                                                                              child: Text(
                                                                                                AppLocalizations.of(context)!.cancel,
                                                                                                style: TextStyle(fontSize: width * 0.035, color: Colors.white, fontWeight: FontWeight.bold),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        InkWell(
                                                                                          onTap: () {
                                                                                            UserCategoryModel model = UserCategoryModel(parentId: null, imageUrl: maingetimage, name: controller.text, type: "income");
                                                                                            TransactionController.to.adddCatagoriesdata(model);

                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          child: Container(
                                                                                            height: height * 0.05,
                                                                                            width: width * 0.3,
                                                                                            decoration: BoxDecoration(color: Colors.blue[900], borderRadius: BorderRadius.circular(7)),
                                                                                            child: Center(
                                                                                              child: Text(
                                                                                                AppLocalizations.of(context)!.save,
                                                                                                style: TextStyle(fontSize: width * 0.035, color: Colors.white, fontWeight: FontWeight.bold),
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
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          40),
                                                                ),
                                                              )
                                                            ],
                                                          );
                                                        });
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    height: height * 0.05,
                                                    width: width * 0.5,
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue[900],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7)),
                                                    child: Center(
                                                      child: Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .categorymanagement,
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.035,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                color: Colors.blue[900],
                              ),
                            );
                          }),
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
                                              color: Colors.grey.shade300,
                                              height: height * 0.35,
                                              width: width * 0.8,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: height * 0.15,
                                                    width: width,
                                                    decoration: const BoxDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage(
                                                                "images/dollar.jpg"))),
                                                  ),
                                                  Container(
                                                    height: height * 0.15,
                                                    width: width,
                                                    color: Colors.blue[900]!
                                                        .withOpacity(0.9),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: height * 0.03,
                                                          left: width * 0.02),
                                                      child: Text(
                                                        "Select Wallet ",
                                                        style: TextStyle(
                                                            color: white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: height * 0.07),
                                                    child: Center(
                                                      child: Card(
                                                        elevation: 10,
                                                        shadowColor:
                                                            Colors.blue[900],
                                                        child: Container(
                                                          height: height * 0.3,
                                                          width: width * 0.7,
                                                          color: white,
                                                          child: Center(
                                                            child: ListView
                                                                .builder(
                                                                    itemCount: HomeController
                                                                        .to
                                                                        .walletList
                                                                        .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      return Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              walletID = HomeController.to.walletList[index].walletId;

                                                                              walletName = HomeController.to.walletList[index].name;
                                                                              paymentMethod = index;
                                                                            });
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Card(
                                                                            elevation:
                                                                                10,
                                                                            child:
                                                                                SizedBox(
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
                                                  // Align(
                                                  //   alignment: Alignment.topRight,
                                                  //   child: Container(
                                                  //     height: height * 0.05,
                                                  //     width: width * 0.1,
                                                  //     decoration:
                                                  //         const BoxDecoration(
                                                  //             shape:
                                                  //                 BoxShape.circle,
                                                  //             color: Colors.grey),
                                                  //     child: Icon(
                                                  //         Icons.cancel_outlined),
                                                  //   ),
                                                  // )
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
                                            fontWeight: FontWeight.w700),
                                        controller: _dueDateController,
                                        decoration: InputDecoration(
                                          enabledBorder: InputBorder.none,
                                          labelText: 'Wallet',
                                          labelStyle: const TextStyle(
                                              fontWeight: FontWeight.w700),
                                          prefixIcon: Icon(
                                            Icons.wallet,
                                            color: Colors.grey.shade700,
                                            size: 25,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
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
                                    onTap: () => _selectDate(
                                        context, _dueDateController, _dueDate),
                                    child: IgnorePointer(
                                      child: TextFormField(
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                        controller: _dueDateController,
                                        decoration: InputDecoration(
                                          enabledBorder: InputBorder.none,
                                          labelText: 'Payback Date',
                                          labelStyle: const TextStyle(
                                              fontWeight: FontWeight.w700),
                                          prefixIcon: Icon(
                                            Icons.calendar_today,
                                            color: Colors.grey.shade700,
                                            size: 25,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter the due date';
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
                              // color: AppColors.backgroundColor,
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Container(
                                          color: Colors.grey.shade300,
                                          height: height * 0.35,
                                          width: width * 0.8,
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: height * 0.15,
                                                width: width,
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            "images/dollar.jpg"))),
                                              ),
                                              Container(
                                                height: height * 0.15,
                                                width: width,
                                                color: Colors.blue[900]!
                                                    .withOpacity(0.9),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: height * 0.03,
                                                      left: width * 0.02),
                                                  child: Text(
                                                    "Select Payment ",
                                                    style: TextStyle(
                                                        color: white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: height * 0.07),
                                                child: Center(
                                                  child: Card(
                                                    elevation: 10,
                                                    shadowColor:
                                                        Colors.blue[900],
                                                    child: Container(
                                                      height: height * 0.3,
                                                      width: width * 0.7,
                                                      color: white,
                                                      child: Center(
                                                        child: ListView.builder(
                                                            itemCount:
                                                                PaymentTypeModel
                                                                    .typemodellist
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              bool isactive =
                                                                  HomeController
                                                                          .to
                                                                          .paymenttypeindex ==
                                                                      index;
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    HomeController
                                                                            .to
                                                                            .paymenttypeindex =
                                                                        index;
                                                                    paymentMethod =
                                                                        index;
                                                                    selectedimage = PaymentTypeModel
                                                                        .typemodellist[HomeController
                                                                            .to
                                                                            .paymenttypeindex!]
                                                                        .image;
                                                                    selectPaymentMethod.text = PaymentTypeModel
                                                                        .typemodellist[HomeController
                                                                            .to
                                                                            .paymenttypeindex!]
                                                                        .name!;
                                                                  });
                                                                  print(
                                                                      "name $selectedname");
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.08,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      SizedBox(
                                                                        width: width *
                                                                            0.11,
                                                                        height: height *
                                                                            0.11,
                                                                        child: Image(
                                                                            image:
                                                                                AssetImage("${PaymentTypeModel.typemodellist[index].image}")),
                                                                      ),
                                                                      Text(
                                                                        "${PaymentTypeModel.typemodellist[index].name}",
                                                                        style:
                                                                            const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width: width *
                                                                            0.2,
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
                                        fontWeight: FontWeight.w700),
                                    controller: selectPaymentMethod,
                                    decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Select Payment',
                                      labelStyle: const TextStyle(
                                          fontWeight: FontWeight.w700),
                                      prefixIcon: Icon(
                                        Icons.attach_money_outlined,
                                        color: Colors.grey.shade700,
                                        size: 25,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Select Wallet';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                // child: selectedimage == null
                                //     ? const Row(
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         children: [
                                //           Icon(Icons.attach_money_outlined),
                                //           SizedBox(
                                //             width: 10,
                                //           ),
                                //           Text(
                                //             "Select Payment ",
                                //             style: TextStyle(
                                //                 color: Colors.black,
                                //                 fontSize: 16),
                                //           ),
                                //         ],
                                //       )
                                //     : Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.start,
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.center,
                                //         children: [
                                //           Container(
                                //             height: height * 0.05,
                                //             width: width * 0.08,
                                //             decoration: BoxDecoration(
                                //                 image: DecorationImage(
                                //                     image: AssetImage(
                                //               "$selectedimage",
                                //             ))),
                                //           ),
                                //           SizedBox(
                                //             width: width * 0.01,
                                //           ),
                                //           Text(
                                //             "$selectedname",
                                //             style: const TextStyle(
                                //                 color: Colors.black,
                                //                 fontSize: 16),
                                //           ),
                                //         ],
                                //       ),
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.025),
                            child: SizedBox(
                              height: height * 0.07,
                              width: width * 0.95,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Colors.grey.shade700,
                                    size: 28,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: width,
                                      height: height,
                                      child: TextFormField(
                                        controller: _person,
                                        decoration: InputDecoration(
                                          labelText: widget.type != 1
                                              ? 'Recever(Optional)'
                                              : 'Sender(Optional)',
                                          labelStyle: TextStyle(
                                              fontSize: 14, color: lightgray),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.025),
                            child: SizedBox(
                              height: height * 0.07,
                              width: width * 0.95,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.grey.shade700,
                                    size: 28,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: width,
                                      height: height,
                                      child: TextFormField(
                                        controller: _noteController,
                                        decoration: InputDecoration(
                                          labelText: 'Notes (Optional)',
                                          labelStyle: TextStyle(
                                              fontSize: 14, color: lightgray),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 9),
                            child: Row(
                                        children: [
                                          Icon(
                                            Icons.file_present_outlined,
                                            color: darkblue,
                                          ),
                                          SizedBox(
                                            width: width * 0.05,
                                          ),
                                          InkWell(
                                            onTap: (){
                          SaleController.to
                                      .selectImage(context, height, width);
                                            },
                                            child: Card(
                                              child: Container(
                                                width: width * 0.25,
                                                height: height * 0.05,
                                                child: Center(
                                                    child: Text(
                                                  "Add File",
                                                  style: TextStyle(color: white),
                                                )),
                                                decoration: BoxDecoration(
                                                    color: darkblue,
                                                    borderRadius:
                                                        BorderRadius.circular(10)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                          ),
                                   
                                       
                                        InkWell(
                                          onTap: (){
TransactionController.to
                                  .addTransaction(
                                      _person.text,
                                      _noteController.text,
                                      double.parse(
                                          balanceController
                                              .text),
                                      double.parse(
                                          partialAmountController
                                              .text),
                                      formatTime,
                                      widget.type!,
                                      paymentMethod!,
                                      selectedcatId!,
                                      HomeController
                                          .to.curency,
                                      walletID!);
                                          },
                                          child: Card(
                                            child: Container(
                                              width: width * 0.4,
                                              height: height * 0.06,
                                              child: Center(
                                                  child: Text(
                                                "Add",
                                                style: TextStyle(color: white),
                                              )),
                                              decoration: BoxDecoration(
                                                  color: darkblue,
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                            ),
                                          ),
                                        )
                                  ,



                        
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
