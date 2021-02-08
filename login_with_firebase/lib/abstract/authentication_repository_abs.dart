import 'package:clase3/models/user.dart';

abstract class AuthenticationServiceAbs {
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> handleSignIn();
  Future<User> signInWithGoogle();
  Future<User> signOut();
  Future<User> createUserWithEmailAndPassword(String email, String password, String username);

  Future<User> signInFake();
}
