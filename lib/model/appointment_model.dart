class AppointmentModel {
  String apptId;
  String userId;
  String serviceId;
  int timeOfBooking;
  String apptTime; // Changed the type to String
  String apptDate; // Added new variable
  String feesStatus;
  String petId;
  String petName;
  String apptStatus; // Added new variable
  String username; // Added new variable

  AppointmentModel({
    required this.apptId,
    required this.userId,
    required this.serviceId,
    required this.timeOfBooking,
    required this.apptTime,
    required this.apptDate,
    required this.feesStatus,
    required this.petId,
    required this.petName,
    required this.apptStatus,
    required this.username,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      apptId: json['apptId'] as String,
      userId: json['userId'] as String,
      serviceId: json['serviceId'] as String,
      timeOfBooking: json['timeOfBooking'] as int,
      apptTime: json['apptTime'] as String, // Changed the type to String
      apptDate: json['apptDate'] as String, // Added new variable
      feesStatus: json['feesStatus'] as String,
      petId: json['petId'] as String,
      petName: json['petName'] as String,
      apptStatus: json['apptStatus'] as String, // Added new variable
      username: json['username'] as String, // Added new variable
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'apptId': apptId,
      'userId': userId,
      'serviceId': serviceId,
      'timeOfBooking': timeOfBooking,
      'apptTime': apptTime,
      'apptDate': apptDate, // Added new variable
      'feesStatus': feesStatus,
      'petId': petId,
      'petName': petName,
      'apptStatus': apptStatus, // Added new variable
      'username': username, // Added new variable
    };
  }
}
