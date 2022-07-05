import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app2/models/users.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  Users? _userFromFirebase(User user){
    return user != null ? Users(uid: user.uid) : null   ;
  }
  Future signInEmail(String email, String password) async {
    try {
      UserCredential authResult = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = authResult.user;
      return _userFromFirebase(firebaseUser!) ;
    } catch (e) {
      print(e.toString());
    }
  }
  Future signUnEmail(String email, String password) async {
    try {
      UserCredential authResult = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = authResult.user;
      return _userFromFirebase(firebaseUser!) ;
    } catch (e) {
      print(e.toString());
    }
  }
  Future signOut() async {
    try {
      return auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
