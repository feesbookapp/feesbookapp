import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exampleapplication/core/view_model/view_model.dart';
import 'package:exampleapplication/data/firestore_collection_path.dart';
import 'package:exampleapplication/models/institute.dart';
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

  Future<void> createUserInFirebase() async {
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

    await getUserFromFirebase();
  }

  Future<void> getUserFromFirebase() async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    final userDoc = await FirebaseCollectionPath.users.doc(currentUser.uid);
    final firebaseUser = await userDoc.get();
    state = state.rebuild(
        (b) => b.user = UserModel.fromJson(firebaseUser.data()!).toBuilder());
  }

  Future<void> updateUserName(String name) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    final userDoc = await FirebaseCollectionPath.users.doc(state.user!.id);

    final userMap = {
      'id': currentUser.uid,
      'phone': currentUser.phoneNumber,
      'name': name,
      'updatedAt': FieldValue.serverTimestamp(),
    };
    await userDoc.set(userMap);

    await getUserFromFirebase();
  }

  Future<void> getUserInstitute() async {
    final institutionDoc = await FirebaseCollectionPath.institutes
        .where('owner', isEqualTo: '/Users/${state.user!.id}')
        .limit(1)
        .get();

    if (institutionDoc.docs.isNotEmpty) {
      state = state.rebuild((b) => b.institute =
          Institute.fromJson(institutionDoc.docs.first.data()).toBuilder());
    }
  }

  Future<void> createInstitute({required String name}) async {
    final institutionDoc = await FirebaseCollectionPath.institutes;
    final id = institutionDoc.doc().id;

    final institutionMap = {
      'id': id,
      'name': name,
      'owner': '/Users/${state.user!.id}',
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
      'createdBy': '/Users/${state.user!.id}',
      'updatedBy': '/Users/${state.user!.id}',
    };

    await institutionDoc.doc(id).set(institutionMap);

    await getUserInstitute();
  }
}
