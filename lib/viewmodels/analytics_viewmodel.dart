import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/constants/helper_class.dart';

class AnalyticsViewModel {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<int> getNumberOfUsers() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection(Constants.fcUsers).get();
      return snapshot.size;
    } catch (e) {
      log(e.toString());
      return -1;
    }
  }

  Future<int> getNumberOfAppointmentsForToday() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(Constants.fcAppointments)
          .where("apptStatus", isEqualTo: Constants.appointmentActive)
          .where("apptDate", isEqualTo: HelperClass.getSameDayDate())
          .get();
      return snapshot.size;
    } catch (e) {
      log(e.toString());
      return -1;
    }
  }

  Future<int> getRemainingTodaysAppointment() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(Constants.fcAppointments)
          .where("apptStatus", isEqualTo: Constants.appointmentActive)
          .where("apptDate", isEqualTo: HelperClass.getSameDayDate())
          .get();
      return snapshot.size;
    } catch (e) {
      log(e.toString());
      return -1;
    }
  }
}
