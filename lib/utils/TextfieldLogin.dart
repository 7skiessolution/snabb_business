// // ignore_for_file: must_be_immutable, file_names

// import 'package:flutter/material.dart';
// import 'package:snabb_business/utils/color.dart';

// class TextFileldLogin extends StatelessWidget {
//   TextFileldLogin({
//     required this.validator,
//     required this.hint,
//     required this.controller,
//     required this.prefixIcon,
//     super.key,
//   });
//   TextEditingController controller;
//   String hint;
//   IconData prefixIcon;
//   String? Function(String?) validator;

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;

//     return Padding(

//       padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
//       child: Container(
//         height: height * 0.07,
//         width: width,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(color: lightgray)),
//         child: TextFormField(

//           validator: validator,

//           controller: controller,
//           cursorColor: darkblue,
//           decoration: InputDecoration(

//             errorStyle: TextStyle(fontSize: 12),
//               border: InputBorder.none,
//               hintText: hint,
//               hintStyle: TextStyle(color: lightgray),
//               prefixIcon: Icon(
//                 prefixIcon,
//                 color: lightgray,
//               )),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:snabb_business/utils/color.dart';

class TextFileldLogin extends StatefulWidget {
  TextFileldLogin({
    required this.validator,
    required this.hint,
    required this.controller,
    required this.issufix,
    required this.prefixIcon,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final IconData prefixIcon;
  bool issufix;
  final String? Function(String?) validator;

  @override
  _TextFileldLoginState createState() => _TextFileldLoginState();
}

class _TextFileldLoginState extends State<TextFileldLogin> {
  bool _obscureText = true;
  //* Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  //* For Password Sufix icon color
  Color setIconColor(var truee) {
    if (true == truee) {
      return blue;
    } else {
      return lightgray;
    }
  }

  @override
  void initState() {
    _obscureText = widget.issufix;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: _obscureText,
        cursorColor: darkblue,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: lightgray),
          ),
          hintText: widget.hint,
          labelText: widget.hint,
          hintStyle: TextStyle(color: lightgray),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: lightgray,
          ),
          suffixIcon: widget.issufix
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    size: 15,
                    color: setIconColor(_obscureText),
                  ),
                  onPressed: () {
                    _toggle();
                  },
                )
              : SizedBox(),
          errorStyle: TextStyle(fontSize: 12),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
