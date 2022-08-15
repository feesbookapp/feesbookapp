import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? mobile;
  String? username;

  UserModel({
    this.uid,
    this.mobile,
    this.username,
  });
//recive data to firestore
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      mobile: map['mobile'],
      username: map['username'],
    );
  }
//send data to firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'mobile': mobile,
      'username': username,
    };
  }
}

class Firebasehelper {
  static void updatemsg(appointid, status) async {
    CollectionReference appointmentdatbase =
        FirebaseFirestore.instance.collection("Users");
    var result =
        await appointmentdatbase.doc(appointid).update({"firstname": status});
  }

  static void updatepic(appointid, status) async {
    CollectionReference appointmentdatbase =
        FirebaseFirestore.instance.collection("Users");
    var result =
        await appointmentdatbase.doc(appointid).update({"profilepic": status});
  }
}
