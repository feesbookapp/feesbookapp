import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCollectionPath {
  static final _firestore = FirebaseFirestore.instance;

  static final users = _firestore.collection('users');
}
