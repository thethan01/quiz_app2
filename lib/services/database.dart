import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String uid;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Database({required this.uid});

  Future<void> addQuizData(Map<String, dynamic> quizData, String quizId) async {
    await firestore
        .collection("Quiz")
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      print(e);
    });
  }
}
