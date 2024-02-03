import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/model/one_hour_model.dart';

class SlotsStatusViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<OneHourAvaialabilityModel> getOneHourAvailability(
      String serviceId, String date) async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection(Constants.fcAvailability)
          .doc(serviceId)
          .collection(Constants.fcDates)
          .doc(date)
          .get();
      if (snapshot.exists) {
        return OneHourAvaialabilityModel.fromMap(
            snapshot.data() as Map<String, dynamic>);
      } else {
        await _firestore
            .collection(Constants.fcAvailability)
            .doc(serviceId)
            .collection(Constants.fcDates)
            .doc(date)
            .set(getEmptyOneHourModel().toMap());
        DocumentSnapshot snapshot = await _firestore
            .collection(Constants.fcAvailability)
            .doc(serviceId)
            .collection(Constants.fcDates)
            .doc(date)
            .get();
        return OneHourAvaialabilityModel.fromMap(
            snapshot.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print(e);
      log(e.toString());
      return getEmptyOneHourModel();
    }
  }

  OneHourAvaialabilityModel getEmptyOneHourModel() {
    return OneHourAvaialabilityModel(
      hour01_00_am: [],
      hour02_00_am: [],
      hour03_00_am: [],
      hour04_00_am: [],
      hour05_00_am: [],
      hour06_00_am: [],
      hour07_00_am: [],
      hour08_00_am: [],
      hour09_00_am: [],
      hour10_00_am: [],
      hour11_00_am: [],
      hour12_00_pm: [],
      hour01_00_pm: [],
      hour02_00_pm: [],
      hour03_00_pm: [],
      hour04_00_pm: [],
      hour05_00_pm: [],
      hour06_00_pm: [],
      hour07_00_pm: [],
      hour08_00_pm: [],
      hour09_00_pm: [],
      hour10_00_pm: [],
      hour11_00_pm: [],
      hour12_00_am: [],
    );
  }
}
