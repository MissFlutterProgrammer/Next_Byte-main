import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class DbHelper {
  static const String collectionUser = 'Users';
  static const String collectionVideos = 'Videos';
  static const String collectionVideo = 'Video';
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Add User
  static Future<void> addUser(UserModel userModel) =>
      _db.collection(collectionUser).doc(userModel.uid).set(userModel.toMap());
  //Check User
  static Future<bool> doseUserExist(String uid) async {
    final snapshot = await _db.collection(collectionUser).doc(uid).get();
    return snapshot.exists;
  }

  //Get User Data
  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserById(
          String uid) =>
      _db.collection(collectionUser).doc(uid).snapshots();
  //Get User Data
  static Future<DocumentSnapshot<Map<String, dynamic>>> getUserById2(
          String uid) =>
      _db.collection(collectionUser).doc(uid).get();

  //Get All Videos
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllVideos() =>
      _db.collection(collectionVideos).snapshots();

  //Get VideoById
  static Stream<DocumentSnapshot<Map<String, dynamic>>> getVideoById(
          String id) =>
      _db.collection(collectionVideo).doc(id).snapshots();

  //Update Profile
  static Future<void> updateProfile(String uid, Map<String, dynamic> map) {
    return _db.collection(collectionUser).doc(uid).update(map);
  }
}
