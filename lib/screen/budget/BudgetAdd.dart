import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:snabb_business/controller/budget/add_budget_controller.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/screen/sale/user_category_model.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/colors.dart';
import 'package:snabb_business/utils/daimond_shape.dart';

class AddBudget extends StatefulWidget {
  const AddBudget({super.key});

  @override
  State<AddBudget> createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudget> {
  var height, width;

  @override
  void initState() {
    Get.put(AddBudgetController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: GetBuilder<AddBudgetController>(builder: (obj1) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Center(
              child: SizedBox(
            height: height,
            width: width,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: AppBarWidgt(text: "Add Buget")),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.1),
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
                            padding: EdgeInsets.only(
                                left: width * 0.1, top: height * 0.03),
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
                  padding: EdgeInsets.only(top: height * 0.16),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.blue[900],
                      child: SizedBox(
                        height: height * 0.5,
                        width: width * 0.9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GetBuilder<TransactionController>(builder: (obj) {
                              return ListTile(
                                onTap: () {
                                  obj1.clicktile = null;
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(
                                            builder: (context, state) {
                                          return AlertDialog(
                                            elevation: 10,
                                            shadowColor: darkblue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .selectcategory,
                                                  style: TextStyle(
                                                    fontSize: width * 0.035,
                                                    fontWeight: FontWeight.bold,
                                                    color: darkblue,
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
                                                        color: darkblue,
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
                                                            child:
                                                                SpinKitCircle(
                                                              color: darkblue,
                                                              size: 50.0,
                                                            ),
                                                          )
                                                        : ListView.builder(
                                                            itemCount: obj
                                                                .model!
                                                                .data!
                                                                .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return obj1
                                                                              .clicktile ==
                                                                          index &&
                                                                      obj1.clicktile !=
                                                                          null &&
                                                                      obj1.opencatagoryclick ==
                                                                          true
                                                                  ? Column(
                                                                      children: [
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              obj1.selectcatagorytital = obj.model!.data![index].name;
                                                                              obj1.selectedcatId = obj.model!.data![index].categoryId;
                                                                              obj1.update();
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                ListTile(
                                                                              trailing: IconButton(
                                                                                  onPressed: () {
                                                                                    state(() {
                                                                                      obj1.clicktile = index;
                                                                                      obj1.opencatagoryclick = !obj1.opencatagoryclick;
                                                                                    });
                                                                                    setState(() {});
                                                                                  },
                                                                                  icon: Icon(obj1.clicktile == index && obj1.clicktile != null ? Icons.arrow_drop_down_outlined : Icons.arrow_drop_up_outlined, color: darkblue)),
                                                                              leading: Container(
                                                                                height: height * 0.06,
                                                                                width: width * 0.12,
                                                                                decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage(obj.model!.data![index].imageUrl!))),
                                                                              ),
                                                                              title: Text(
                                                                                obj.model!.data![index].name!,
                                                                                style: TextStyle(fontSize: width * 0.035, color: darkblue, fontWeight: FontWeight.bold),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            obj.model!.data![index].child!.isEmpty
                                                                                ? AppLocalizations.of(context)!.nosubcategory
                                                                                : "${AppLocalizations.of(context)!.subcatagoriesof}${obj.model!.data![index].name!}",
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 10,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height: height *
                                                                                0.1 *
                                                                                obj.model!.data![index].child!.length,
                                                                            child:
                                                                                ListView.builder(
                                                                              physics: const NeverScrollableScrollPhysics(),
                                                                              itemCount: obj.model!.data![index].child!.length,
                                                                              itemBuilder: (BuildContext context, int i) {
                                                                                return Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: ListTile(
                                                                                    onTap: () {
                                                                                      obj1.selectcatagorytital = obj.model!.data![index].child![i].name;
                                                                                      obj1.selectedcatId = obj.model!.data![index].child![i].categoryId;
                                                                                      obj1.update();
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    leading: Container(
                                                                                      height: height * 0.06,
                                                                                      width: width * 0.12,
                                                                                      decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage(obj.model!.data![index].child![i].imageUrl!))),
                                                                                    ),
                                                                                    title: Text(
                                                                                      obj.model!.data![index].child![i].name!,
                                                                                      style: TextStyle(fontSize: width * 0.035, color: darkblue, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          )
                                                                        ])
                                                                  : ListTile(
                                                                      onTap:
                                                                          () {
                                                                        obj1.selectcatagorytital = obj
                                                                            .model!
                                                                            .data![index]
                                                                            .name;
                                                                        obj1.selectedcatId = obj
                                                                            .model!
                                                                            .data![index]
                                                                            .categoryId;
                                                                        obj1.update();
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      trailing: IconButton(
                                                                          onPressed: () {
                                                                            state(() {
                                                                              obj1.clicktile = index;
                                                                              obj1.opencatagoryclick = !obj1.opencatagoryclick;
                                                                            });
                                                                            setState(() {});
                                                                          },
                                                                          icon: Icon(
                                                                            obj1.clicktile == index && obj1.clicktile != null
                                                                                ? Icons.arrow_drop_down_outlined
                                                                                : Icons.arrow_drop_up_outlined,
                                                                            color:
                                                                                darkblue,
                                                                          )),
                                                                      leading:
                                                                          Container(
                                                                        height: height *
                                                                            0.06,
                                                                        width: width *
                                                                            0.12,
                                                                        decoration: BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(obj.model!.data![index].imageUrl!))),
                                                                      ),
                                                                      title:
                                                                          Text(
                                                                        obj
                                                                            .model!
                                                                            .data![index]
                                                                            .name!,
                                                                        style: TextStyle(
                                                                            fontSize: width *
                                                                                0.035,
                                                                            color:
                                                                                darkblue,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    );
                                                            },
                                                          ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      obj1.getimage = null;
                                                      obj1.isLoading = false;
                                                      obj1.subcatagorycontroller
                                                          .text = "";
                                                      obj1.update();

                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return StatefulBuilder(
                                                                builder:
                                                                    (context,
                                                                        set) {
                                                              return SingleChildScrollView(
                                                                child:
                                                                    AlertDialog(
                                                                  elevation: 10,
                                                                  shadowColor:
                                                                      darkblue,
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
                                                                        AppLocalizations.of(context)!
                                                                            .newsubcategory,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              width * 0.035,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              darkblue,
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
                                                                          height:
                                                                              height * 0.04,
                                                                          width:
                                                                              width * 0.08,
                                                                          decoration: BoxDecoration(
                                                                              color: darkblue,
                                                                              shape: BoxShape.circle),
                                                                          child:
                                                                              const Center(
                                                                            child:
                                                                                Icon(
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
                                                                        height: height *
                                                                            0.8,
                                                                        width:
                                                                            width,
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
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
                                                                                    style: TextStyle(fontSize: width * 0.035, color: darkblue, fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: width * 0.3,
                                                                                    child: TextFormField(
                                                                                      controller: obj1.subcatagorycontroller,
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
                                                                                    style: TextStyle(fontSize: width * 0.035, color: darkblue, fontWeight: FontWeight.bold),
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
                                                                                                    shadowColor: darkblue,
                                                                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                                                    title: Row(
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          AppLocalizations.of(context)!.selectcategory,
                                                                                                          style: TextStyle(fontSize: width * 0.035, color: darkblue, fontWeight: FontWeight.bold),
                                                                                                        ),
                                                                                                        InkWell(
                                                                                                          onTap: () {
                                                                                                            Navigator.pop(context);
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            height: height * 0.04,
                                                                                                            width: width * 0.08,
                                                                                                            decoration: BoxDecoration(color: darkblue, shape: BoxShape.circle),
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
                                                                                                                      obj1.selectedcat = obj.model!.data![index].name!;
                                                                                                                      obj1.selectedcatId = obj.model!.data![index].categoryId!;
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
                                                                                                                    style: TextStyle(fontSize: width * 0.035, color: darkblue, fontWeight: FontWeight.bold),
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
                                                                                        obj1.selectedcat == null ? AppLocalizations.of(context)!.selectcategory : obj1.selectedcat!,
                                                                                        style: TextStyle(fontSize: width * 0.035, color: darkblue, fontWeight: FontWeight.bold),
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
                                                                                    style: TextStyle(fontSize: width * 0.035, color: darkblue, fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                  obj1.getimage == null
                                                                                      ? const CircleAvatar(
                                                                                          radius: 20,
                                                                                          backgroundColor: Colors.grey,
                                                                                        )
                                                                                      : Container(
                                                                                          height: height * 0.06,
                                                                                          width: width * 0.12,
                                                                                          decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage(obj1.getimage!))),
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
                                                                                  itemCount: obj1.iconList.length,
                                                                                  itemBuilder: (context, index) {
                                                                                    return InkWell(
                                                                                      onTap: () {
                                                                                        set(() {
                                                                                          obj1.getimage = obj1.iconList[index];
                                                                                        });
                                                                                      },
                                                                                      child: Container(
                                                                                        height: height * 0.06,
                                                                                        width: width * 0.12,
                                                                                        decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage(obj1.iconList[index]))),
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
                                                                                      obj1.getimage = null;
                                                                                    });
                                                                                  },
                                                                                  child: Container(
                                                                                    height: height * 0.05,
                                                                                    width: width * 0.3,
                                                                                    decoration: BoxDecoration(color: darkblue, borderRadius: BorderRadius.circular(7)),
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
                                                                                    if (obj1.getimage != null && obj1.subcatagorycontroller.text.isNotEmpty) {
                                                                                      obj1.selectedCatagorymodel = UserCategoryModel(parentId: obj1.selectedcatId, imageUrl: obj1.getimage, name: obj1.subcatagorycontroller.text, type: "income");
                                                                                    //  TransactionController.to.adddCatagoriesdata(obj1.selectedCatagorymodel!);

                                                                                      Navigator.pop(context);
                                                                                    } else {
                                                                                      obj1.showtoast(AppLocalizations.of(context)!.pleasefullfillallfields, width);
                                                                                    }
                                                                                    obj1.getimage = null;
                                                                                    obj1.subcatagorycontroller.text = "";
                                                                                  },
                                                                                  child: Container(
                                                                                    height: height * 0.05,
                                                                                    width: width * 0.3,
                                                                                    decoration: BoxDecoration(color: darkblue, borderRadius: BorderRadius.circular(7)),
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
                                                          color: darkblue,
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
                                                              color:
                                                                  Colors.white,
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
                                                              shadowColor:
                                                                  darkblue,
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
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            width *
                                                                                0.035,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color:
                                                                            darkblue),
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
                                                                      width: width *
                                                                          0.08,
                                                                      decoration: BoxDecoration(
                                                                          color:
                                                                              darkblue,
                                                                          shape:
                                                                              BoxShape.circle),
                                                                      child:
                                                                          const Center(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .clear,
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
                                                              content: SizedBox(
                                                                height: height *
                                                                    0.8,
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
                                                                              vertical: height * 0.01,
                                                                            ),
                                                                            child:
                                                                                ListTile(
                                                                              leading: Container(
                                                                                height: height * 0.06,
                                                                                width: width * 0.12,
                                                                                decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage(obj.model!.data![index].imageUrl!))),
                                                                              ),
                                                                              title: Text(
                                                                                obj.model!.data![index].name!,
                                                                                style: TextStyle(fontSize: width * 0.035, color: darkblue, fontWeight: FontWeight.bold),
                                                                              ),
                                                                              trailing: InkWell(
                                                                                  onTap: () {
                                                                                  //  TransactionController.to.deleteCatagoriesdata(obj.model!.data![index].categoryId!, "income");
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
                                                                      darkblue,
                                                                  onPressed:
                                                                      () {
                                                                    obj1.controller
                                                                        .text = '';
                                                                    obj1.maingetimage ==
                                                                        null;
                                                                    obj1.update();
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return StatefulBuilder(builder:
                                                                              (context, set) {
                                                                            return SingleChildScrollView(
                                                                              child: AlertDialog(
                                                                                elevation: 10,
                                                                                shadowColor: darkblue,
                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                                title: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      AppLocalizations.of(context)!.addcatagory,
                                                                                      style: TextStyle(
                                                                                        fontSize: width * 0.035,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        color: darkblue,
                                                                                      ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      onTap: () {
                                                                                        Navigator.pop(context);
                                                                                      },
                                                                                      child: Container(
                                                                                        height: height * 0.04,
                                                                                        width: width * 0.08,
                                                                                        decoration: BoxDecoration(color: darkblue, shape: BoxShape.circle),
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
                                                                                              style: TextStyle(fontSize: width * 0.035, color: darkblue, fontWeight: FontWeight.bold),
                                                                                            ),
                                                                                            SizedBox(
                                                                                              width: width * 0.3,
                                                                                              child: TextFormField(
                                                                                                controller: obj1.controller,
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
                                                                                              style: TextStyle(fontSize: width * 0.035, color: darkblue, fontWeight: FontWeight.bold),
                                                                                            ),
                                                                                            obj1.maingetimage == null
                                                                                                ? const CircleAvatar(
                                                                                                    radius: 50,
                                                                                                    backgroundColor: Colors.grey,
                                                                                                  )
                                                                                                : Container(
                                                                                                    height: height * 0.06,
                                                                                                    width: width * 0.12,
                                                                                                    decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage(obj1.maingetimage!))),
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
                                                                                            itemCount: obj1.iconList.length, // Number of grid items
                                                                                            itemBuilder: (context, index) {
                                                                                              return InkWell(
                                                                                                onTap: () {
                                                                                                  set(() {
                                                                                                    obj1.maingetimage = obj1.iconList[index];
                                                                                                  });
                                                                                                },
                                                                                                child: Container(
                                                                                                  height: height * 0.06,
                                                                                                  width: width * 0.12,
                                                                                                  decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage(obj1.iconList[index]))),
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
                                                                                                obj1.maingetimage = null;

                                                                                                Navigator.pop(context);
                                                                                              });
                                                                                            },
                                                                                            child: Container(
                                                                                              height: height * 0.05,
                                                                                              width: width * 0.3,
                                                                                              decoration: BoxDecoration(color: darkblue, borderRadius: BorderRadius.circular(7)),
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
                                                                                              UserCategoryModel model = UserCategoryModel(parentId: null, imageUrl: obj1.maingetimage, name: obj1.controller.text, type: "income");
                                                                                              //TransactionController.to.adddCatagoriesdata(model);

                                                                                              Navigator.pop(context);
                                                                                            },
                                                                                            child: Container(
                                                                                              height: height * 0.05,
                                                                                              width: width * 0.3,
                                                                                              decoration: BoxDecoration(color: darkblue, borderRadius: BorderRadius.circular(7)),
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
                                                          color: darkblue,
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
                                                              color:
                                                                  Colors.white,
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
                                  obj1.selectcatagorytital ??
                                      AppLocalizations.of(context)!
                                          .selectcategory,
                                  style: TextStyle(
                                    fontSize: width * 0.035,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_drop_down,
                                  color: darkblue,
                                ),
                              );
                            }),
                            Padding(
                              padding: EdgeInsets.all(width * 0.05),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    AppLocalizations.of(context)!.amount,
                                    style: const TextStyle(fontSize: 16),
                                  )),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35,
                                      child: TextFormField(
                                        controller: obj1.amountTextController,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10, 0, 10, 10),
                                          hintText: '0,000',
                                          hintStyle: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(width * 0.05),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    AppLocalizations.of(context)!.duration,
                                    style: TextStyle(fontSize: width * 0.035),
                                  )),
                                  Expanded(
                                      child: DropdownButtonFormField<String>(
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: darkblue,
                                          ),
                                          hint: Text(
                                            AppLocalizations.of(context)!
                                                .select,
                                          ),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: darkblue,
                                          ),
                                          isDense: true,
                                          items: obj1.dropdownItems.map((item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(item),
                                            );
                                          }).toList(),
                                          onChanged: (newValue) {
                                            obj1.selectedDuration = newValue!;
                                            obj1.update();
                                          }))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.06,
                              width: width * 0.8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: height * 0.07,
                                      width: width * 0.3,
                                      color: Colors.red,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      obj1.saveBudget(context, width);
                                    },
                                    child: Container(
                                      height: height * 0.07,
                                      width: width * 0.3,
                                      color: Colors.blue[900],
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Save",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
        );
      }),
    );
  }
}
