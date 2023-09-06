

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/enduser.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Enduser _userFirebaseUser(User? firebaseUser){
    return Enduser(uid: firebaseUser!.uid);
  }
  
  Future loginUser(String email, String pwd) async{
    try {
      UserCredential creds = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: pwd);
        User firebaseUser = creds.user!;
        return _userFirebaseUser(firebaseUser);
    } catch (e, s){
      print('login failed');
      print('Err - $e');
      print('Stack - $s');
    }
  }

  Future registerUser(String email, String pwd, String fullname) async{
    try {
      UserCredential creds = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: pwd);
        User firebaseUser = creds.user!;
        Enduser newUser = Enduser(uid: firebaseUser.uid, fullname: fullname, email: email, age: 0, bio: "" );
        addUserToCollection(newUser).then((_) {
          firebaseUser.updateDisplayName(fullname);
        });
        
        return _userFirebaseUser(firebaseUser);
    } catch (e, s){
      print('login failed');
      print('Err - $e');
      print('Stack - $s');
    }
  }

  Future logoutUser() async {
    try {
      await _firebaseAuth.signOut();
      print('Logged out');
    } catch (e, s) {
      print('logout failed');
      print('Err - $e');
      print('Stack - $s');

    }
  }

  Future<void> addUserToCollection(Enduser enduser) async{
     await _firebaseFirestore
     .collection("users")
     .doc(enduser.uid)
     .set(enduser.toJson());
     
    }
    
    Future<DocumentSnapshot>getUserByUID(String userID) async {
      return await _firebaseFirestore.collection("users").doc(userID).get();
    }
  }
