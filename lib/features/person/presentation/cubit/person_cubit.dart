import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<String?> {
  ProfileCubit() : super(null);

  Future<void> chooseImageProfile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final File file = File(image.path);
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userEmail = user.email ?? "default";
        String fileName = 'user_profile_images/$userEmail.png';

        try {
          await FirebaseStorage.instance.ref(fileName).putFile(file);
          String downloadURL =
              await FirebaseStorage.instance.ref(fileName).getDownloadURL();
          emit(downloadURL);

          // Save to Firestore
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.email)
              .set({
            'profileImageUrl': downloadURL,
          }, SetOptions(merge: true));
        } catch (e) {
          print("Error occurred while uploading image: $e");
        }
      }
    }
  }

  Future<void> loadProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (snapshot.exists) {
        String? profileImageUrl = snapshot['profileImageUrl'];
        emit(profileImageUrl);
      }
    }
  }
}
