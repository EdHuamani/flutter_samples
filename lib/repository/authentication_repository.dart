import 'dart:convert';

import 'package:clase3/abstract/authentication_repository_abs.dart';
import 'package:clase3/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class AuthenticationRepository implements AuthenticationServiceAbs {
  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    if (email.isEmpty || password.isEmpty) return null;

//  http.post("url", )
    AuthResult authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser firebaseUser = authResult.user;
    if (firebaseUser != null)
      return User(
        uid: firebaseUser.uid,
        displayName: firebaseUser.displayName,
        email: firebaseUser.email,
      );
    return null;
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      String email, String password, String username) async {
    AuthResult authResult = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    UserUpdateInfo userInfo = UserUpdateInfo();
    userInfo.displayName = username;
    // userInfo.photoUrl = "";

    await authResult.user.updateProfile(userInfo);

    await authResult.user.reload();
    FirebaseUser firebaseUser = authResult.user;
    return User(
      uid: firebaseUser.uid,
      displayName: firebaseUser.displayName,
      email: firebaseUser.email,
      photoUrl: firebaseUser.photoUrl,
    );
  }

  @override
  Future<User> handleSignIn() async {
    FirebaseUser firebaseUser = await _auth.currentUser();
    if (firebaseUser != null)
      return User(
        uid: firebaseUser.uid,
        displayName: firebaseUser.displayName,
        email: firebaseUser.email,
        photoUrl: firebaseUser.photoUrl,
      );
    return null;
  }

  @override
  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser firebaseUser =
        (await _auth.signInWithCredential(credential)).user;

    if (firebaseUser != null) {
      return User(
        uid: firebaseUser.uid,
        displayName: firebaseUser.displayName,
        email: firebaseUser.email,
        photoUrl: firebaseUser.photoUrl,
      );
    }
    return null;
  }

  @override
  Future<User> signOut() async {
    await _auth.signOut();
    return null;
  }

  @override
  Future<User> signInFake() async {
    http.Response response =
        await http.get("https://jsonplaceholder.typicode.com/users/1");

    Map<String, dynamic> data = jsonDecode(response.body);

    return User(
      uid: data['id'].toString(),
      email: data['email'],
      displayName: data['name'],
    );
  }
}
