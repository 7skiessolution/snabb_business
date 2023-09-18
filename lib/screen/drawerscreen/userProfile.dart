import 'package:flutter/material.dart';
import 'package:snabb_business/utils/colors.dart';

import '../../utils/color.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController mEmail = TextEditingController();

  TextEditingController mName = TextEditingController();
  TextEditingController mpassword = TextEditingController();
  TextEditingController mgender = TextEditingController();
  var indexNumber;
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
              //AppBarWidgt(text: "no data"),
              Expanded(
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
                      height: height * 0.16,
                      color: AppColors.blue.withOpacity(0.9),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
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
                      top: height * 0.1,
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
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Align(
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      radius: 35,
                                      backgroundImage:
                                          AssetImage("images/intro_two.png"),
                                    ),
                                  ),
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
                                    width: width * 0.84,
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: mEmail,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        errorStyle: const TextStyle(
                                            color: Colors.black),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 20),
                                        fillColor: Colors.grey,
                                        hintText: "Email",
                                        labelText: "Email",
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
                                    width: width * 0.84,
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: mgender,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        errorStyle: const TextStyle(
                                            color: Colors.black),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 20),
                                        fillColor: Colors.grey,
                                        hintText: "Gender",
                                        labelText: "Gender",
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
                                    width: width * 0.84,
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: mpassword,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        errorStyle: const TextStyle(
                                            color: Colors.black),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 20),
                                        fillColor: Colors.grey,
                                        hintText: "Password",
                                        labelText: "Password",
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
                                    height: height * 0.02,
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
