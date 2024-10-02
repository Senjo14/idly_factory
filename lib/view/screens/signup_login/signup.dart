// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../intro_screens/language_region.dart';
//
// class Signup extends StatefulWidget {
//   const Signup({super.key});
//
//   @override
//   State<Signup> createState() => _SignupState();
// }
//
// class _SignupState extends State<Signup> {
//   bool isValue = false;
//   Language selectedLanguage = Language.CanadaEnglish;
//   bool isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         physics: AlwaysScrollableScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("First Name"),
//                 SizedBox(height: 10),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: "First Name",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text("Email Address"),
//                 SizedBox(height: 10),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: "Email Address",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 Text("Date of Birth"),
//                 SizedBox(height: 15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Flexible(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Year",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Flexible(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Month",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Flexible(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Day",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "Must be added at least 7 Days prior to your birthday in order to\nreceive a Birthday Offer Reward this year",
//                   style: TextStyle(fontSize: 12),
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Checkbox(
//                       value: isValue,
//                       onChanged: (bool? value) {
//                         setState(() {
//                           isValue = value ?? false;
//                         });
//                       },
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: Text(
//                         "I want to receive special offers and other information via email",
//                         overflow: TextOverflow.clip,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Checkbox(
//                       value: isValue,
//                       onChanged: (bool? value) {
//                         setState(() {
//                           isValue = value ?? false;
//                         });
//                       },
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: Text(
//                         "I agree to the following Privacy Policy, Idly Factory Rewards Terms and Conditions, and Terms of Service",
//                         overflow: TextOverflow.clip,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Center(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.white,
//                       backgroundColor: Colors.redAccent,
//                       padding: EdgeInsets.symmetric(horizontal: 120),
//                       shape: ContinuousRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                     ),
//                     onPressed: () {},
//                     child: Text(
//                       "Create an Account",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.sports_baseball),
//                     SizedBox(width: 8),
//                     TextButton(
//                       onPressed: () {
//                         showModalBottomSheet(
//                           context: context,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(10),
//                               topLeft: Radius.circular(10),
//                             ),
//                           ),
//                           isScrollControlled: true,
//                           showDragHandle: true,
//                           builder: (context) {
//                             return FractionallySizedBox(
//                               heightFactor: 0.85,
//                               widthFactor: 1,
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     "Select a Language",
//                                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     "Canada",
//                                     style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
//                                   ),
//                                   SizedBox(height: 10),
//                                   ListTile(
//                                     leading: Radio<Language>(
//                                       activeColor: Colors.red,
//                                       value: Language.CanadaEnglish,
//                                       groupValue: selectedLanguage,
//                                       onChanged: (Language? value) {
//                                         setState(() {
//                                           selectedLanguage = value!;
//                                         });
//                                       },
//                                     ),
//                                     onTap: () {
//                                       setState(() {
//                                         selectedLanguage = Language.CanadaEnglish;
//                                       });
//                                     },
//                                     title: Text(
//                                       "English",
//                                       style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
//                                     ),
//                                     subtitle: Text(
//                                       "English (Canada)",
//                                       style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
//                                     ),
//                                   ),
//                                   ListTile(
//                                     leading: Radio<Language>(
//                                       activeColor: Colors.red,
//                                       value: Language.CanadaFrench,
//                                       groupValue: selectedLanguage,
//                                       onChanged: (Language? value) {
//                                         setState(() {
//                                           selectedLanguage = value!;
//                                         });
//                                       },
//                                     ),
//                                     onTap: () {
//                                       setState(() {
//                                         selectedLanguage = Language.CanadaFrench;
//                                       });
//                                     },
//                                     title: Text(
//                                       "French",
//                                       style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
//                                     ),
//                                     subtitle: Text(
//                                       "French (Canada)",
//                                       style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
//                                     ),
//                                   ),
//                                   SizedBox(height: 20),
//                                   Text(
//                                     "USA",
//                                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
//                                   ),
//                                   SizedBox(height: 10),
//                                   ListTile(
//                                     leading: Radio<Language>(
//                                       activeColor: Colors.red,
//                                       value: Language.USAEnglish,
//                                       groupValue: selectedLanguage,
//                                       onChanged: (Language? value) {
//                                         setState(() {
//                                           selectedLanguage = value!;
//                                         });
//                                       },
//                                     ),
//                                     onTap: () {
//                                       setState(() {
//                                         selectedLanguage = Language.USAEnglish;
//                                       });
//                                     },
//                                     title: Text(
//                                       "English",
//                                       style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
//                                     ),
//                                     subtitle: Text(
//                                       "English (USA)",
//                                       style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
//                                     ),
//                                   ),
//                                   Spacer(),
//                                   Container(
//                                     width: double.infinity,
//                                     child: ElevatedButton(
//                                       style: ElevatedButton.styleFrom(
//                                         padding: const EdgeInsets.symmetric(vertical: 15),
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(5),
//                                         ),
//                                         backgroundColor: Colors.red,
//                                       ),
//                                       onPressed: isLoading
//                                           ? null
//                                           : () async {
//                                         setState(() {
//                                           isLoading = true;
//                                         });
//                                         Navigator.pop(context);
//                                         setState(() {
//                                           isLoading = false;
//                                         });
//                                       },
//                                       child: isLoading
//                                           ? SizedBox(
//                                         height: 20,
//                                         width: 20,
//                                         child: CircularProgressIndicator(
//                                           color: Colors.white,
//                                           strokeWidth: 2.0,
//                                         ),
//                                       )
//                                           : Text(
//                                         "Done",
//                                         style: TextStyle(
//                                           fontSize: 18,
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                       },
//                       child: Text(AutofillHints.language),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 100,)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
