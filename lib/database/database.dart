import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Database {
  static updateLastLogin(String? uid) async {
    try {
      var now = DateTime.now();
      var formatter = DateFormat('EEEE, dd MMMM yyyy - HH:mm:ss');
      var currentDate = formatter.format(now);
      print(currentDate);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({
        'last_login': currentDate
      });

      return true;
    } catch(error) {
      print(error.toString());
      return false;
    }
  }

  static updateScoreFinalTest(String score, String uid) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({
        'score': score
      });

      return true;
    } catch(error) {
      print(error.toString());
      return false;
    }
  }
}