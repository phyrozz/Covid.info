import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_info/models/info.dart';
import 'package:covid_info/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userInfoCollection =
      FirebaseFirestore.instance.collection("info");

  Future updateUserData(int points, String name) async {
    return await userInfoCollection.doc(uid).set({
      'points': points,
      'name': name,
    });
  }

  Future updatePoints(int points) async {
    return await userInfoCollection.doc(uid).set({
      'points': points,
    });
  }

  List<Info> _infoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Info(
          name: doc.data()['name'] ?? '', points: doc.data()['points'] ?? 0);
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      points: snapshot.data()['points'],
    );
  }

  Stream<List<Info>> get userInfo {
    return userInfoCollection.snapshots().map(_infoListFromSnapshot);
  }

  Stream<UserData> get userData {
    return userInfoCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
