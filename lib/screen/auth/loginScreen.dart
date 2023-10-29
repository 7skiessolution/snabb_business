import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snabb_business/controller/logincontroller.dart';
import 'package:snabb_business/models/signup_model.dart';
import 'package:snabb_business/utils/TextfieldLogin.dart';
import 'package:snabb_business/utils/spinkit.dart';

import '../../utils/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeysignup = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyforget = GlobalKey<FormState>();
  List gender = ["Male", "Female", "Other"];

  bool obsCheck = false;
  bool isLogin = true;
  bool islodding = false;
  String errMsg = "";
  TextEditingController mPassword = TextEditingController();
  TextEditingController mEmail = TextEditingController();
  TextEditingController mEmailsignup = TextEditingController();
  TextEditingController mNamesignup = TextEditingController();
  TextEditingController mpasssignup = TextEditingController();
  String? select;

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: blue,
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

  clear() {
    mpasssignup.clear();
    mNamesignup.clear();
    mEmailsignup.clear();
    mEmail.clear();
    mPassword.clear();
  }

  changeLodingStatus(bool v) {
    setState(() {
      islodding = v;
    });
  }

  bool obscureText = true;

  Widget setLoginUnderLineColor() {
    if (isLogin == true) {
      return Container(
        width: 50,
        height: 2,
        color: blue,
      );
    } else {
      return Container(
        width: 20,
        height: 2,
        color: whitecolor,
      );
    }
  }

//* For Password Show Or Not
  bool _obscureText = true;
  bool isLoggingIn = false;
  bool isExpended = false;
  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //* Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  //* For Password Sufix icon color
  Color setIconColor(var truee) {
    if (true == truee) {
      return blackcolor;
    } else {
      return blue;
    }
  }

  //! Set Sign Up Button Underline Color
  Widget setSignUpUnderLineColor() {
    if (isLogin == false) {
      return Container(
        width: 60,
        height: 2,
        color: blue,
      );
    } else {
      return Container(
        width: 20,
        height: 2,
        color: whitecolor,
      );
    }
  }

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return "Please Enter Email";
    }
    return null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  void initState() {
    Get.put(LoginController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: GetBuilder<LoginController>(builder: (obj) {
          return SingleChildScrollView(
            child: SizedBox(
              height: height,
              width: width,
              child: InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Stack(children: [
                  Container(
                    height: height * 0.4,
                    width: width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/dollar.jpg"))),
                  ),
                  Column(children: [
                    Container(
                      height: height * 0.4,
                      width: width,
                      color: blue.withOpacity(0.9),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Column(
                          // mainAxisAlignment: mian,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * 0.1,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Welcome to ",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                Text(
                                  "Snabb Business",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.015,
                            ),
                            const Text(
                              "Signup to Continue",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  isExpended == false
                      ? Positioned(
                          top: height * 0.25,
                          left: width * 0.015,
                          child: Card(
                            elevation: 5,
                            child: Container(
                              height: height * 0.48,
                              width: width * 0.95,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height * 0.08,
                                    width: width,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            height: height,
                                            width: width,
                                            child: obj.isLogin == true
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'login',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            // fontWeight: FontWeight.bold,
                                                            fontSize:
                                                                width * 0.05),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: width *
                                                                    0.12,
                                                                right: width *
                                                                    0.12),
                                                        child: Divider(
                                                          color: darkblue,
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
                                                          obj.changeLogin(true);
                                                        },
                                                        child: Text(
                                                          'login',
                                                          style: TextStyle(
                                                              color: lightgray,
                                                              fontSize:
                                                                  width * 0.05),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: height,
                                            width: width,
                                            child: obj.isLogin == false
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'signup',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize:
                                                                width * 0.05),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left:
                                                                    width * 0.1,
                                                                right: width *
                                                                    0.1),
                                                        child: Divider(
                                                          color: darkblue,
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
                                                          obj.changeLogin(
                                                              false);
                                                        },
                                                        child: Text(
                                                          'signup',
                                                          style: TextStyle(
                                                              color: lightgray,
                                                              fontSize:
                                                                  width * 0.05),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  obj.isLogin == true
                                      ? Form(
                                          key: _formKey,
                                          child: Expanded(
                                            child: SizedBox(
                                              height: height,
                                              width: width,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  TextFileldLogin(
                                                    controller: mEmail,
                                                    hint: "Email",
                                                    issufix: false,
                                                    prefixIcon:
                                                        Icons.person_2_outlined,
                                                    validator: (val) {
                                                      // return _validateEmail(val!);
                                                      if (val!.isEmpty) {
                                                        return "field is empty";
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  TextFileldLogin(
                                                    controller: mPassword,
                                                    hint: "password",
                                                    issufix: true,
                                                    prefixIcon: Icons
                                                        .lock_outline_rounded,
                                                    validator: (val) {
                                                      return _validatePassword(
                                                          val!);
                                                    },
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        value: obj.remember,
                                                        focusColor: lightgray,
                                                        hoverColor: lightgray,
                                                        activeColor: darkblue,
                                                        autofocus: false,
                                                        onChanged: (value) {
                                                          obj.remember =
                                                              !obj.remember;
                                                          obj.update();
                                                        },
                                                      ),
                                                      Text(
                                                        "Remember me",
                                                        style: TextStyle(
                                                            color: lightgray),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.091,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            isExpended = true;
                                                          });
                                                        },
                                                        child: Text(
                                                          "Forgot password?",
                                                          style: TextStyle(
                                                              color: lightgray,
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : Form(
                                          key: _formKeysignup,
                                          child: Expanded(
                                            child: SizedBox(
                                              height: height,
                                              width: width,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  TextFileldLogin(
                                                    controller: mNamesignup,
                                                    hint: "Username",
                                                    issufix: false,
                                                    prefixIcon:
                                                        Icons.person_2_outlined,
                                                    validator: (val) {
                                                      if (val!.isEmpty) {
                                                        return "please enter name";
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                  ),
                                                  TextFileldLogin(
                                                    controller: mEmailsignup,
                                                    hint: "Email",
                                                    issufix: false,
                                                    prefixIcon:
                                                        Icons.note_alt_rounded,
                                                    validator: (value) {
                                                      return _validateEmail(
                                                          value!);
                                                    },
                                                  ),
                                                  TextFileldLogin(
                                                    controller: mpasssignup,
                                                    hint: "Password",
                                                    issufix: false,
                                                    prefixIcon:
                                                        Icons.lock_outlined,
                                                    validator: (value) {
                                                      return _validatePassword(
                                                          value!);
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.07,
                                                    width: width * 0.85,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Select Gender",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .blue[900],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        addRadioButton(
                                                            0, 'Male'),
                                                        addRadioButton(
                                                            1, 'Female'),
                                                        // addRadioButton(
                                                        //     2, 'Others'),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                ],
                              ),
                            ),
                          ))

                      //// forget screen

                      : Positioned(
                          top: height * 0.32,
                          left: width * 0.012,
                          child: Card(
                              elevation: 5,
                              child: Container(
                                  height: height * 0.38,
                                  width: width * 0.95,
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: SizedBox(
                                      height: height,
                                      width: width,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: height * 0.04,
                                            ),
                                            Text(
                                              'Forget Password',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  // fontWeight: FontWeight.bold,
                                                  fontSize: width * 0.04),
                                            ),
                                            Form(
                                                key: _formKeyforget,
                                                child: Expanded(
                                                  child: SizedBox(
                                                    height: height,
                                                    width: width,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        TextFileldLogin(
                                                          controller: mEmail,
                                                          hint: "Email",
                                                          issufix: false,
                                                          prefixIcon: Icons
                                                              .person_2_outlined,
                                                          validator: (val) {
                                                            // return _validateEmail(val!);
                                                            if (val!.isEmpty) {
                                                              return "field is empty";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.02,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              isExpended =
                                                                  false;
                                                            });
                                                          },
                                                          child: Text(
                                                            "Go back Login ?",
                                                            style: TextStyle(
                                                                color:
                                                                    lightgray,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                          ]))))),
                  if (isExpended == false)
                    obj.isLogin == true
                        ? Positioned(
                            top: height * 0.67,
                            left: width * 0.45,
                            child: SizedBox(
                                height: height * 0.1,
                                width: width * 0.2,
                                // color: white,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: white,
                                  child: InkWell(
                                    onTap: isLoggingIn
                                        ? null
                                        : () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              changeLodingStatus(true);
                                              Map<String, dynamic> map = {
                                                "email": mEmail.text,
                                                "password": mPassword.text
                                              };
                                              obj
                                                  .login(map, context)
                                                  .then((value) {
                                                if (value) {
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (ctx) =>
                                                  //             DashBoardScreen()));
                                                  clear();
                                                  changeLodingStatus(false);
                                                } else {
                                                  changeLodingStatus(false);
                                                  clear();
                                                }
                                              });
                                            }
                                          },
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: darkblue,
                                      child: Center(
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: white,
                                          size: 35,
                                        ),

                                        // decoration:
                                        //     BoxDecoration shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                )))
                        : Positioned(
                            top: height * 0.7,
                            left: width * 0.45,
                            child: SizedBox(
                                height: height * 0.1,
                                width: width * 0.2,
                                // color: white,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: white,
                                  child: InkWell(
                                    onTap: islodding
                                        ? null
                                        : () async {
                                            if (_formKeysignup.currentState!
                                                .validate()) {
                                              changeLodingStatus(true);

                                              SignupModel model = SignupModel(
                                                  email:
                                                      mEmailsignup.text.trim(),
                                                  name: mNamesignup.text.trim(),
                                                  password:
                                                      mpasssignup.text.trim(),
                                                  gender: select);
                                              obj.signup(model).then((value) {
                                                changeLodingStatus(false);
                                                obj.changeLogin(true);
                                                clear();
                                              });
                                            }
                                          },
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: darkblue,
                                      child: Center(
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: white,
                                          size: 35,
                                        ),

                                        // decoration:
                                        //     BoxDecoration shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                )))
                  else
                    // forget button
                    Positioned(
                        top: height * 0.64,
                        left: width * 0.38,
                        child: SizedBox(
                            height: height * 0.11,
                            width: width * 0.21,
                            // color: white,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: white,
                              child: InkWell(
                                onTap: islodding
                                    ? null
                                    : () async {
                                        if (_formKeyforget.currentState!
                                            .validate()) {
                                          changeLodingStatus(true);
                                          obj
                                              .resetPassword(context, mEmail)
                                              .then((value) {
                                            changeLodingStatus(false);
                                            obj.changeLogin(true);
                                            clear();
                                          });

                                          //   Future.delayed(Duration(seconds: 3),
                                          //       () {
                                          //     isExpended = false;
                                          //     islodding = false;
                                          //   });
                                          // } else {
                                          //   obj.showetoast(
                                          //       "Failed to send password reset email");
                                        }
                                      },
                                child: CircleAvatar(
                                  radius: 27,
                                  backgroundColor: darkblue,
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: white,
                                      size: 35,
                                    ),

                                    // decoration:
                                    //     BoxDecoration shape: BoxShape.circle),
                                  ),
                                ),
                              ),
                            ))),
                  islodding == true
                      ? Container(
                          height: height,
                          width: width,
                          color: blue.withOpacity(0.5),
                          child: Padding(
                            padding: EdgeInsets.only(top: height * 0.4),
                            child: Center(
                              child: SizedBox(
                                height: height * 0.1,
                                width: width * 0.2,
                                child: SpinKit.loadSpinkit,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox()
                ]),
              ),
            ),
          );
        }));
  }
}
