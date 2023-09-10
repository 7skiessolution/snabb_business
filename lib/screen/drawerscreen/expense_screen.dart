// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:snabb_business/utils/appbarwidget.dart';
// import 'package:snabb_business/utils/color.dart';
// import 'package:snabb_business/utils/colors.dart';

// class ExpenseScreen extends StatefulWidget {
//   const ExpenseScreen({super.key});

//   @override
//   State<ExpenseScreen> createState() => _ExpenseScreenState();
// }

// class _ExpenseScreenState extends State<ExpenseScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;

//     var width = MediaQuery.of(context).size.width;

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: backgroundColor,
//         body: Column(children: [
//           AppBarWidgt(text: "Chart"),
//           Expanded(
//             child: Stack(
//               children: [
//                 Container(
//                   height: height * 0.15,
//                   width: width,
//                   color: darkblue,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.only(top: 15.0, left: 20, right: 20),
//                     child: Text(
//                       "New Entry",
//                       style: TextStyle(
//                           color: white,
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: height * 0.08,
//                   left: width * 0.025,
//                   child: Container(
//                     height: height * 0.8,
//                     width: width * 0.95,
//                     color: white,
//                     child: const AddBalanceDialog(balanceType: "Credit"),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

// class AddBalanceDialog extends StatefulWidget {
//   final String balanceType;

//   const AddBalanceDialog({super.key, required this.balanceType});

//   @override
//   // ignore: library_private_types_in_public_api
//   _AddBalanceDialogState createState() => _AddBalanceDialogState();
// }

// class _AddBalanceDialogState extends State<AddBalanceDialog> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _balanceController = TextEditingController();
//   final TextEditingController _currentDateController = TextEditingController();
//   final TextEditingController _dueDateController = TextEditingController();
//   final TextEditingController _person = TextEditingController();

//   DateTime _currentDate = DateTime.now();
//   DateTime _dueDate = DateTime.now();

//   @override
//   void dispose() {
//     _balanceController.dispose();
//     _currentDateController.dispose();
//     _dueDateController.dispose();
//     _person.dispose();
//     super.dispose();
//   }

//   Future<void> _selectDate(BuildContext context,
//       TextEditingController controller, DateTime initialDate) async {
//     final DateTime? selectedDate = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );

//     if (selectedDate != null) {
//       setState(() {
//         controller.text = DateFormat.yMMMd().format(selectedDate);
//         if (controller == _currentDateController) {
//           _currentDate = selectedDate;
//         } else if (controller == _dueDateController) {
//           _dueDate = selectedDate;
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: SizedBox(
//             height: height,
//             width: width,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   height: height * 0.05,
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Expanded(
//                         flex: 3,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 8.0),
//                           child: TextFormField(
//                             controller: _balanceController,
//                             keyboardType: const TextInputType.numberWithOptions(
//                                 decimal: true),
//                             decoration:
//                                 const InputDecoration(labelText: "Amount"),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter the balance amount';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                       ),
//                       const Expanded(child: Text("PKR")),
//                       const Expanded(
//                           child: CircleAvatar(
//                         radius: 7,
//                         child: CircleAvatar(
//                           radius: 5,
//                           backgroundColor: Colors.red,
//                         ),
//                       )),
//                       const Expanded(
//                           flex: 4,
//                           child: Text(
//                             "Partial Payment",
//                             style: TextStyle(
//                                 fontSize: 15,
//                                 decoration: TextDecoration.underline),
//                           ))
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(right: 20.0),
//                       child: Container(
//                         height: height * 0.05,
//                         width: width * 0.33,
//                         color: AppColors.backgroundColor,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 6.0),
//                           child: TextFormField(
//                             controller: _balanceController,
//                             keyboardType: const TextInputType.numberWithOptions(
//                                 decimal: true),
//                             decoration: const InputDecoration(
//                               enabledBorder: InputBorder.none,
//                               labelText: "Enter Amount",
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter the balance amount';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                         height: height * 0.07,
//                         width: width * 0.15,
//                         child: const CircleAvatar(
//                           // backgroundColor: Colors.green,
//                           child: CircleAvatar(
//                             radius: 22,
//                             // backgroundColor: white,
//                             backgroundImage: AssetImage("images/expensive.png"),
//                           ),
//                         )),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Expense",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text("Total:")
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           const Text("0.0PKR"),
//                           SizedBox(
//                             width: width * 0.05,
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: CircleAvatar(
//                               radius: 15,
//                               backgroundColor: Colors.red,
//                               child: Icon(
//                                 Icons.add,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: height * 0.03,
//                 ),
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8.0),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.wallet,
//                             size: 25,
//                             color: Colors.grey.shade700,
//                           ),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           const Text(
//                             "Wallet:",
//                             style: TextStyle(fontWeight: FontWeight.w600),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 InkWell(
//                   onTap: () => _selectDate(
//                       context, _currentDateController, _currentDate),
//                   child: IgnorePointer(
//                     child: TextFormField(
//                       style:
//                           TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
//                       controller: _currentDateController,
//                       decoration: const InputDecoration(
//                         enabledBorder: InputBorder.none,
//                         labelText: 'Date',
//                         labelStyle: TextStyle(fontWeight: FontWeight.w700),
//                         prefixIcon: Icon(
//                           Icons.calendar_today,
//                           size: 25,
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter the current date';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: InkWell(
//                         onTap: () =>
//                             _selectDate(context, _dueDateController, _dueDate),
//                         child: IgnorePointer(
//                           child: TextFormField(
//                             style: TextStyle(
//                                 fontSize: 12, fontWeight: FontWeight.w700),
//                             controller: _dueDateController,
//                             decoration: const InputDecoration(
//                               enabledBorder: InputBorder.none,
//                               labelText: 'Payback Date',
//                               labelStyle:
//                                   TextStyle(fontWeight: FontWeight.w700),
//                               prefixIcon: Icon(
//                                 Icons.calendar_today,
//                                 size: 25,
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter the due date';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                     height: height * 0.06,
//                     width: width * 0.85,
//                     color: AppColors.backgroundColor,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: InkWell(
//                         onTap: () {
//                           showDialog(
//                             context: context,
//                             builder: (context) {
//                               return Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: SizedBox(
//                                   height: height * 0.5,
//                                   width: width * 0.8,
//                                   child: Center(
//                                     child: Container(
//                                       color: Colors.grey.shade300,
//                                       height: height * 0.5,
//                                       width: width * 0.8,
//                                       child: Stack(
//                                         children: [
//                                           Container(
//                                             height: height * 0.15,
//                                             width: width * 0.8,
//                                             color: darkblue,
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   top: 15.0,
//                                                   left: 60,
//                                                   right: 20),
//                                               child: Text(
//                                                 "Select Payment ",
//                                                 style: TextStyle(
//                                                     color: white,
//                                                     fontSize: 15,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ),
//                                           ),
//                                           Positioned(
//                                             top: height * 0.08,
//                                             left: width * 0.05,
//                                             child: Container(
//                                               height: height * 0.35,
//                                               width: width * 0.7,
//                                               color: white,
//                                               child: Column(children: [
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceEvenly,
//                                                   children: [
//                                                     SizedBox(
//                                                       width: width * 0.11,
//                                                       height: height * 0.11,
//                                                       child: const Image(
//                                                           image: AssetImage(
//                                                               "images/bank.jpeg")),
//                                                     ),
//                                                     const Text(
//                                                       "BANK",
//                                                       style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       width: width * 0.2,
//                                                     )
//                                                   ],
//                                                 ),
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceEvenly,
//                                                   children: [
//                                                     SizedBox(
//                                                       width: width * 0.11,
//                                                       height: height * 0.11,
//                                                       child: const Image(
//                                                           image: AssetImage(
//                                                               "images/Group.jpeg")),
//                                                     ),
//                                                     const Text(
//                                                       "CASH",
//                                                       style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       width: width * 0.2,
//                                                     )
//                                                   ],
//                                                 ),
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceEvenly,
//                                                   children: [
//                                                     SizedBox(
//                                                       width: width * 0.11,
//                                                       height: height * 0.11,
//                                                       child: const Image(
//                                                           image: AssetImage(
//                                                               "images/Group 247.jpeg")),
//                                                     ),
//                                                     const Text(
//                                                       "OTHERS",
//                                                       style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       width: width * 0.18,
//                                                     )
//                                                   ],
//                                                 ),
//                                               ]),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                         child: const Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Icon(Icons.attach_money_outlined),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "Select Payment ",
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 16),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     const Icon(Icons.person),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Container(
//                       width: width * 0.7,
//                       height: height * 0.05,
//                       child: TextFormField(
//                         controller: _person,
//                         decoration: InputDecoration(
//                           labelText: widget.balanceType == "Debit"
//                               ? 'Recever(Optional)'
//                               : 'Sender(Optional)',
//                           labelStyle: TextStyle(fontSize: 14, color: lightgray),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter a name';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     const Icon(Icons.edit),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Container(
//                       width: width * 0.7,
//                       height: height * 0.05,
//                       child: TextFormField(
//                         controller: _person,
//                         decoration: InputDecoration(
//                           labelText: 'Notes (Optional)',
//                           labelStyle: TextStyle(fontSize: 14, color: lightgray),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter a name';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: height * 0.03,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.folder_rounded,
//                       size: 30,
//                       color: lightgray,
//                     ),
//                     Icon(
//                       Icons.folder_delete,
//                       size: 30,
//                       color: lightgray,
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: height * 0.03,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                           height: height * 0.05,
//                           width: width * 0.3,
//                           color: Colors.red,
//                           child: const Center(
//                               child: Text(
//                             'Cancel',
//                             style: TextStyle(color: Colors.white),
//                           ))),
//                       Container(
//                           height: height * 0.05,
//                           width: width * 0.3,
//                           color: Colors.green,
//                           child: const Center(
//                               child: Text(
//                             'Save',
//                             style: TextStyle(color: Colors.white),
//                           ))),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
