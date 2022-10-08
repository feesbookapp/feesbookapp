// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:exampleapplication/bottomsheet/bottomsheet.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'bottomsheet/homepage.dart';
// import 'models/user.dart';

// class Registration extends StatefulWidget {
//   Registration({Key? key}) : super(key: key);

//   @override
//   State<Registration> createState() => _RegistrationState();
// }

// class _RegistrationState extends State<Registration> {
//   final formGlobalKey = GlobalKey<FormState>();
//   final _auth = FirebaseAuth.instance;
//   final nameEditingController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Center(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 40,
//                     right: 40,
//                   ),
//                   child: Form(
//                     key: formGlobalKey,
//                     child: TextFormField(
//                       controller: nameEditingController,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Name cannot be empty";
//                         } else {
//                           return null;
//                         }
//                       },
//                       onSaved: (value) {
//                         nameEditingController.text = value!;
//                       },
//                       decoration: InputDecoration( 
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(
//                             10,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (formGlobalKey.currentState!.validate()) {
//                       postDetailsToFirestore();
//                     }
//                   },
//                   child: Text(
//                     'Get Started',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   postDetailsToFirestore() async {
//     // calling our firestore
//     // calling our user model
//     // sedning these values

//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     User? user = _auth.currentUser;

//     // ignore: deprecated_member_use
//     user!.updateProfile(
//         photoURL:
//             'https://firebasestorage.googleapis.com/v0/b/chef-connect-testing.appspot.com/o/chef-profile%2Ftyt1vei5Zlfdm2miAs90seonQt22?alt=media&token=8fcaf32d-96d0-4afa-a711-d90cf8911c9e');

//     UserModel userModel = UserModel();

//     // writing all the values
//     userModel.uid = user.uid;
//     userModel.mobile = user.phoneNumber;
//     userModel.username = nameEditingController.text;
//     await firebaseFirestore
//         .collection("users")
//         .doc(user.uid)
//         .set(userModel.toMap())
//         .then((value) async {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setString('uid', user.uid);
//       Navigator.pushAndRemoveUntil(
//           (context),
//           MaterialPageRoute(
//             builder: (context) => Bottompage(),
//           ),
//           (route) => false);
//     });
//     Fluttertoast.showToast(msg: "Account created successfully :) ");
//   }
// }
