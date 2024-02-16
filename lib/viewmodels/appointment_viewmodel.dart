import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/model/appointment_model.dart';
import 'package:pgc/model/user_model.dart';

class AppointmentViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> bookAppointment(String serviceId, String date, String time,
      String userId, String petId, String appointmentDate) async {
    try {
      String appointmentId =
          await _firestore.collection(Constants.fcAppointments).doc().id;
      UserModel user = await _firestore
          .collection(Constants.fcUsers)
          .doc(userId)
          .get()
          .then((value) =>
              UserModel.fromJson(value.data() as Map<String, dynamic>));

      AppointmentModel appointment = AppointmentModel(
          serviceId: serviceId,
          timeOfBooking: DateTime.now().millisecondsSinceEpoch,
          apptId: appointmentId,
          userId: userId,
          petId: petId,
          apptTime: time,
          feesStatus: 'pending',
          petName: "Lorem Ipsum",
          apptDate: date,
          apptStatus: Constants.appointmentActive,
          username: "${user.firstName} ${user.lastName}");

      await _firestore
          .collection(Constants.fcAppointments)
          .doc(appointmentId)
          .set(appointment.toJson());

      time = HelperClass.reformatHourToModelType(time);
      await _firestore
          .collection(Constants.fcAvailability)
          .doc(serviceId)
          .collection(Constants.fcDates)
          .doc(date)
          .update({
        time: FieldValue.arrayUnion([appointmentId])
      });

      await _firestore.collection(Constants.fcUsers).doc(userId).update({
        'appointments': FieldValue.arrayUnion([appointmentId])
      });

      return "success";
    } catch (e) {
      print(e);
      log(e.toString());
      return "error";
    }
  }

  Future<String> cancelAppointment(AppointmentModel model) async {
    try {
      await _firestore
          .collection(Constants.fcAppointments)
          .doc(model.apptId)
          .update({
        'feesStatus': Constants.appointmentCancelled,
        'apptStatus': Constants.appointmentCancelled
      });

      String formattedTime =
          HelperClass.reformatHourToModelType(model.apptTime);

      await _firestore
          .collection(Constants.fcAvailability)
          .doc(model.serviceId)
          .collection(Constants.fcDates)
          .doc(model.apptDate)
          .update({
        formattedTime: FieldValue.arrayRemove([model.apptId])
      });

      await _firestore.collection(Constants.fcUsers).doc(model.userId).update({
        'appointments': FieldValue.arrayRemove([model.apptId])
      });
      return 'success';
    } catch (e) {
      print(e);
      log(e.toString());
      return 'error';
    }
  }

  Future<String> rescheduleAppointment(AppointmentModel prevAppointmentModel,
      String newDate, String newTime) async {
    try {
      await _firestore
          .collection(Constants.fcAvailability)
          .doc(prevAppointmentModel.serviceId)
          .collection(Constants.fcDates)
          .doc(prevAppointmentModel.apptDate)
          .update({
        HelperClass.reformatHourToModelType(prevAppointmentModel.apptTime):
            FieldValue.arrayRemove([prevAppointmentModel.apptId])
      });

      await _firestore
          .collection(Constants.fcAppointments)
          .doc(prevAppointmentModel.apptId)
          .update({
        'apptDate': newDate,
        'apptTime': newTime,
        'timeOfBooking': DateTime.now().millisecondsSinceEpoch
      });
      await _firestore
          .collection(Constants.fcAvailability)
          .doc(prevAppointmentModel.serviceId)
          .collection(Constants.fcDates)
          .doc(newDate)
          .update({
        HelperClass.reformatHourToModelType(newTime):
            FieldValue.arrayUnion([prevAppointmentModel.apptId])
      });
      return "success";
    } catch (e) {
      log(e.toString());
      return "error";
    }
  }

  Future<void> setPastAppointmentToDone() async {
    try {
      await _firestore
          .collection(Constants.fcAppointments)
          .where('apptStatus', isEqualTo: Constants.appointmentActive)
          .where('apptDate', isLessThan: HelperClass.getTwoDaysBeforeDate())
          .get()
          .then((value) {
        value.docs.forEach((element) async {
          await _firestore
              .collection(Constants.fcAppointments)
              .doc(element.id)
              .update({'apptStatus': Constants.appointmentCompleted});
        });
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<AppointmentModel>> fetchAppointments(selectedDate) async {
    List<AppointmentModel> appointments = [];

    try {
      if (selectedDate == '') {
        selectedDate = HelperClass.getSameDayDate();

        appointments = [];

        // Fetch appointments for today
        await FirebaseFirestore.instance
            .collection(Constants.fcAppointments)
            .where('apptDate', isEqualTo: selectedDate)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            log(querySnapshot.docs.toString());
            appointments.add(
                AppointmentModel.fromJson(doc.data() as Map<String, dynamic>));
          });
        });

        return appointments;
      } else {
        log("selected date = $selectedDate  in fetch function");
        appointments = [];
        // Fetch appointments for selected date
        await FirebaseFirestore.instance
            .collection(Constants.fcAppointments)
            .where('apptDate', isEqualTo: selectedDate)
            .where('apptStatus', isEqualTo: Constants.appointmentActive)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            log(querySnapshot.docs.toString());

            appointments.add(
                AppointmentModel.fromJson(doc.data() as Map<String, dynamic>));
          });
        });

        return appointments;
      }
    } catch (e) {
      print(e);
      log(e.toString());
      return appointments;
    }
  }
}
