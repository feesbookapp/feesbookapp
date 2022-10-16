import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exampleapplication/core/view_model/view_model.dart';
import 'package:exampleapplication/data/firestore_collection_path.dart';
import 'package:exampleapplication/models/user.dart';
import 'package:exampleapplication/view_model/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppViewModel implements AppBaseViewModel {
  @override
  Future<void> init() async {}

  Future<void> signIn() async {}
}

class AppStateViewModel extends StateNotifier<AppState> {
  AppStateViewModel(super.state);

  Future<void> createUserInFirebase(Map<String, dynamic> userData) async {
    final currentUser = FirebaseAuth.instance.currentUser!;

    final userDoc = await FirebaseCollectionPath.users.doc(currentUser.uid);

    final firebaseUser = await userDoc.get();

    if (!firebaseUser.exists) {
      final userMap = {
        'id': currentUser.uid,
        'phone': currentUser.phoneNumber,
        'name': currentUser.displayName,
        'profilePicture': currentUser.photoURL,
        'updatedAt': FieldValue.serverTimestamp(),
        'createdAt': FieldValue.serverTimestamp(),
      };

      await userDoc.set(userMap);
    }

    state =
        state.rebuild((b) => b.user = UserModel.fromJson(userData).toBuilder());
  }
}
