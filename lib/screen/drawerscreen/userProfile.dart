import 'package:flutter/material.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/colors.dart';

import '../../utils/color.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController mName = TextEditingController();

  String? select;
  List gender = ["Male", "Female", "Other"];
  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Colors.blue[900],
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              print(value);
              select = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  @override
  void initState() {
    mName.text = HomeController.to.profilemodel!.data!.name!;
    select = HomeController.to.profilemodel!.data!.gender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
            // mainAxisAlignment: M,
            children: [
              AppBarWidgt(text: "Profile"),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: width,
                      height: height * 0.12,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("images/dollar.jpg"))),
                    ),
                    Container(
                      height: height * 0.12,
                      color: AppColors.blue.withOpacity(0.9),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 12, left: width * 0.05),
                              child: Text(
                                "Profile",
                                style: TextStyle(
                                    color: white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.08,
                      left: width * 0.05,
                      //bottom: height * 0.02,
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.blue[900],
                        child: Container(
                            height: height * 0.65,
                            width: width * 0.9,
                            color: white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: height * 0.1,
                                        width: width * 0.2,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.blue[900]),
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: width * 0.07,
                                        ),
                                      )),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Text(
                                    "User Information",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width * 0.04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                              height: height,
                                              width: width,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Name : ",
                                                    style: TextStyle(
                                                        fontSize: width * 0.035,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.blue[900]),
                                                  ),
                                                  Text(
                                                    HomeController
                                                        .to
                                                        .profilemodel!
                                                        .data!
                                                        .name!,
                                                    style: TextStyle(
                                                        fontSize: width * 0.03),
                                                  ),
                                                ],
                                              )),
                                        ),
                                        SizedBox(
                                            height: height,
                                            width: width * 0.35,
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Gender : ",
                                                  style: TextStyle(
                                                      fontSize: width * 0.035,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blue[900]),
                                                ),
                                                Text(
                                                  HomeController
                                                      .to
                                                      .profilemodel!
                                                      .data!
                                                      .gender!,
                                                  style: TextStyle(
                                                      fontSize: width * 0.03),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                    child: Row(
                                      children: [
                                        Text(
                                          "Email : ",
                                          style: TextStyle(
                                              fontSize: width * 0.035,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue[900]),
                                        ),
                                        Text(
                                          HomeController
                                              .to.profilemodel!.data!.email!,
                                          style:
                                              TextStyle(fontSize: width * 0.03),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Divider(
                                    color: Colors.blue[900],
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  SizedBox(
                                    width: width * 0.84,
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: mName,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        errorStyle: const TextStyle(
                                            color: Colors.black),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 20),
                                        fillColor: Colors.grey,
                                        hintText: "Name",
                                        labelText: "Name",
                                        alignLabelWithHint: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: AppColors.blue
                                              //  provider.brightness ==
                                              //         AppBrightness.dark
                                              //     ? AppTheme.colorWhite
                                              //     : AppTheme.colorPrimary,
                                              ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: AppColors.blue
                                                  // provider.brightness ==
                                                  //         AppBrightness.dark
                                                  //     ? AppTheme.colorWhite
                                                  //   : AppTheme.colorPrimary,
                                                  ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  SizedBox(
                                    height: height * 0.07,
                                    width: width * 0.85,
                                    child: Row(
                                      children: [
                                        Text(
                                          "Select Gender",
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        ),
                                        addRadioButton(0, 'Male'),
                                        addRadioButton(1, 'Female'),
                                        // addRadioButton(
                                        //     2, 'Others'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Center(
                                    child: SizedBox(
                                      width: width / 2,
                                      child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: InkWell(
                                          onTap: () {
                                            // _saveIncome();
                                          },
                                          child: Container(
                                            height: height * 0.05,
                                            width: width * 0.4,
                                            decoration: BoxDecoration(
                                                color: AppColors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            child: Center(
                                              child: Text(
                                                "Update",
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
                                    ),
                                  ),
                                ],
                              ),
                            )
                            // ListView.builder(
                            //   itemCount: list.length,
                            //   itemBuilder: (BuildContext context, int index) {
                            //     return InkWell(
                            //       onTap: () {
                            //         setState(() {
                            //           indexNumber = index;
                            //         });
                            //       },
                            //       child: Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: Container(
                            //           decoration: BoxDecoration(
                            //               color:
                            //                   indexNumber == index ? darkblue : white,
                            //               borderRadius: BorderRadius.circular(11)),
                            //           child: Padding(
                            //             padding: const EdgeInsets.all(8.0),
                            //             child: Row(
                            //               mainAxisAlignment: MainAxisAlignment.start,
                            //               children: [
                            //                 Padding(
                            //                   padding:
                            //                       const EdgeInsets.only(left: 28.0),
                            //                   child: Icon(
                            //                     list[index].icon,
                            //                     size: 35,
                            //                     color: indexNumber == index
                            //                         ? white
                            //                         : Colors.black,
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   width: width * 0.1,
                            //                 ),
                            //                 Text(
                            //                   "${list[index].title}",
                            //                   style: TextStyle(
                            //                       fontSize: 18,
                            //                       color: indexNumber == index
                            //                           ? white
                            //                           : Colors.black),
                            //                 )
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     );
                            //   },
                            // ),

                            ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
