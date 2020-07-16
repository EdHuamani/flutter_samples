import 'package:clase3/models/user.dart';
import 'package:clase3/repository/authentication_repository.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider() {
    handleSignIn();
  }

  AuthenticationRepository repository = AuthenticationRepository();

  User user;

  signInWithEmailAndPassword(email, password) async {
    user = await repository.signInWithEmailAndPassword(email, password);
    notifyListeners();
  }

  handleSignIn() async {
    user = await repository.handleSignIn();
    notifyListeners();
  }

  signInWithGoogle() async {
    user = await repository.signInWithGoogle();
    notifyListeners();
  }

  signOut() async {
    user = await repository.signOut();
    notifyListeners();
  }

  createUserWithEmailAndPassword(email, password, username) async {
    user = await repository.createUserWithEmailAndPassword(
        email, password, username);
    notifyListeners();
  }

  signInFake() async {
    user = await repository.signInFake();
    notifyListeners();
  }
}
