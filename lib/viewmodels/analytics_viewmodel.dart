import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/constants/helper_class.dart';

class AnalyticsViewModel {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<int> getNumberOfUsers() async {
    try {
      int count = 0;
      _firestore.collection("users").count().get().then(
            (res) => count = res.count!,
            onError: (e) => throw Exception(e),
          );

      return count;
    } catch (e) {
      log(e.toString());
      return -1;
    }
  }

  Future<int> getNumberOfAppointments() async {
    try {
      int count = (await _firestore
          .collection(Constants.fcAppointments)
          .where("apptDate", isEqualTo: HelperClass.getSameDayDate())
          .snapshots()
          .length);
      return count;
    } catch (e) {
      log(e.toString());
      return -1;
    }
  }

  Future<int> getRemainingTodaysAppointment() async {
    try {
      int count = (await _firestore
          .collection(Constants.fcAppointments)
          .where("apptDate", isEqualTo: HelperClass.getSameDayDate())
          .where("apptStatus", isEqualTo: Constants.appointmentActive)
          .snapshots()
          .length);
      return count;
    } catch (e) {
      log(e.toString());
      return -1;
    }
  }
}
