import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:insta_send/app/data/models/create_account_model.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("Users");
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthCreate) {
      yield AuthLoading();
      try {
        await firebaseAuth
            .createUserWithEmailAndPassword(
                email: event.createAccount.emailAddress,
                password: event.createAccount.password)
            .then((result) {
          dbRef.child(result.user!.uid).set({
            "email": event.createAccount.emailAddress,
            "first_name": event.createAccount.firstName,
            "last_name": event.createAccount.lastName,
            "phone_number": event.createAccount.phoneNumber,
            "password": event.createAccount.password,
          });
        });
        yield AuthCreated(event.createAccount);
      } catch (e) {
        if (e is FirebaseAuthException) {
          print(e.code);
          yield AuthFailed(e.message.toString());
        }
      }
    }
    if (event is AuthSignIn) {
      yield AuthLoading();
      try {
        CreateAccountModel data = CreateAccountModel();
        await firebaseAuth
            .signInWithEmailAndPassword(
                email: event.email, password: event.password)
            .then((result) async {
          await dbRef
              .orderByKey()
              .equalTo(result.user!.uid)
              .once()
              .then((value) {
            Map<dynamic, dynamic> red = value.value[result.user!.uid];
            data = CreateAccountModel.fromJson(red.cast<String, Object>());
          });
        });
        yield AuthCreated(data);
      } catch (error) {
        if (error is FirebaseAuthException) {
          print(error.code);
          yield AuthFailed(error.message.toString());
        }
      }
    }
  }
}
