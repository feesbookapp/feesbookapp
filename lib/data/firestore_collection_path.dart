import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollectionPath {
  static final _firestore = FirebaseFirestore.instance;

  static final users = _firestore.collection('Users');
  static final classes = _firestore.collection('Classes');
  static final institutes = _firestore.collection('Institutes');
}
