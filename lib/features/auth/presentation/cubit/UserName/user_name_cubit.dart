import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user_name_state.dart';

class UserNameCubit extends Cubit<UserNameState> {
  UserNameCubit() : super(UserNameInitial());

  Future<void> saveUserName(String firstName, String lastName) async {
    emit(UserNameLoading());

    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // إنشاء أو تحديث بيانات المستخدم في Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'firstName': firstName,
          'lastName': lastName,
          'email': user.email, // يمكنك إضافة البريد الإلكتروني
        }, SetOptions(merge: true));

        emit(UserNameSuccess());
      } else {
        emit(UserNameError("No user is logged in"));
      }
    } catch (e) {
      emit(UserNameError(e.toString()));
    }
  }
}
