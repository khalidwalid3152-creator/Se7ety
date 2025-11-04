import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/feature/auth/presentation/cubit/cubit_state.dart';
import 'package:flutter/material.dart';

class CubitAuth extends Cubit<CubitState> {
  CubitAuth() : super(CubitState());

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  register() async {
    emit(LoadingState());
    //auth in firebase
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
      User? user = credential.user;
      await user?.updateDisplayName(nameController.text);
// التخزين في Firestore
      await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        'name': nameController.text,
        'email': emailController.text,
        'uid': user?.uid,
        'bioo': '',
        'image':'',
        'password': passwordController.text,
      });


      emit(SuccsessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(ErrorState('كلمة المرور ضعيفة جدًا'));
      } else if (e.code == 'email-already-in-use') {
        emit(ErrorState('هذا البريد مستخدم بالفعل'));
      } else {
        emit(ErrorState('حدث خطأ في التسجيل'));
      }
    } catch (e) {
      emit(ErrorState('حدث خطأ: $e'));
    }
  }

  // try {
  //   // final credential =
  //    await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(
  //         email: emailController.text,
  //         password: passwordController.text,
  //       );
  //   emit(SuccsessState());
  // } on FirebaseAuthException catch (e) {
  //   if (e.code == 'weak-password') {
  //     print('The password provided is too weak.');
  //   } else if (e.code == 'email-already-in-use') {
  //     print('The account already exists for that email.');
  //   }
  // } catch (e) {
  //   print(e);
  // }
  //
}
