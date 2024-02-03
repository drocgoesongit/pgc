class OneHourAvaialabilityModel {
  final List<String> hour01_00_am;
  final List<String> hour02_00_am;
  final List<String> hour03_00_am;
  final List<String> hour04_00_am;
  final List<String> hour05_00_am;
  final List<String> hour06_00_am;
  final List<String> hour07_00_am;
  final List<String> hour08_00_am;
  final List<String> hour09_00_am;
  final List<String> hour10_00_am;
  final List<String> hour11_00_am;
  final List<String> hour12_00_pm;
  final List<String> hour01_00_pm;
  final List<String> hour02_00_pm;
  final List<String> hour03_00_pm;
  final List<String> hour04_00_pm;
  final List<String> hour05_00_pm;
  final List<String> hour06_00_pm;
  final List<String> hour07_00_pm;
  final List<String> hour08_00_pm;
  final List<String> hour09_00_pm;
  final List<String> hour10_00_pm;
  final List<String> hour11_00_pm;
  final List<String> hour12_00_am;

  OneHourAvaialabilityModel({
    required this.hour01_00_am,
    required this.hour02_00_am,
    required this.hour03_00_am,
    required this.hour04_00_am,
    required this.hour05_00_am,
    required this.hour06_00_am,
    required this.hour07_00_am,
    required this.hour08_00_am,
    required this.hour09_00_am,
    required this.hour10_00_am,
    required this.hour11_00_am,
    required this.hour12_00_pm,
    required this.hour01_00_pm,
    required this.hour02_00_pm,
    required this.hour03_00_pm,
    required this.hour04_00_pm,
    required this.hour05_00_pm,
    required this.hour06_00_pm,
    required this.hour07_00_pm,
    required this.hour08_00_pm,
    required this.hour09_00_pm,
    required this.hour10_00_pm,
    required this.hour11_00_pm,
    required this.hour12_00_am,
  });

  // Convert the object to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      '01_00_am': hour01_00_am,
      '02_00_am': hour02_00_am,
      '03_00_am': hour03_00_am,
      '04_00_am': hour04_00_am,
      '05_00_am': hour05_00_am,
      '06_00_am': hour06_00_am,
      '07_00_am': hour07_00_am,
      '08_00_am': hour08_00_am,
      '09_00_am': hour09_00_am,
      '10_00_am': hour10_00_am,
      '11_00_am': hour11_00_am,
      '12_00_pm': hour12_00_pm,
      '01_00_pm': hour01_00_pm,
      '02_00_pm': hour02_00_pm,
      '03_00_pm': hour03_00_pm,
      '04_00_pm': hour04_00_pm,
      '05_00_pm': hour05_00_pm,
      '06_00_pm': hour06_00_pm,
      '07_00_pm': hour07_00_pm,
      '08_00_pm': hour08_00_pm,
      '09_00_pm': hour09_00_pm,
      '10_00_pm': hour10_00_pm,
      '11_00_pm': hour11_00_pm,
      '12_00_am': hour12_00_am,
    };
  }

  // Create an object from Firestore data
  factory OneHourAvaialabilityModel.fromMap(Map<String, dynamic> map) {
    return OneHourAvaialabilityModel(
      hour01_00_am: List<String>.from(map['01_00_am'] ?? []),
      hour02_00_am: List<String>.from(map['02_00_am'] ?? []),
      hour03_00_am: List<String>.from(map['03_00_am'] ?? []),
      hour04_00_am: List<String>.from(map['04_00_am'] ?? []),
      hour05_00_am: List<String>.from(map['05_00_am'] ?? []),
      hour06_00_am: List<String>.from(map['06_00_am'] ?? []),
      hour07_00_am: List<String>.from(map['07_00_am'] ?? []),
      hour08_00_am: List<String>.from(map['08_00_am'] ?? []),
      hour09_00_am: List<String>.from(map['09_00_am'] ?? []),
      hour10_00_am: List<String>.from(map['10_00_am'] ?? []),
      hour11_00_am: List<String>.from(map['11_00_am'] ?? []),
      hour12_00_pm: List<String>.from(map['12_00_pm'] ?? []),
      hour01_00_pm: List<String>.from(map['01_00_pm'] ?? []),
      hour02_00_pm: List<String>.from(map['02_00_pm'] ?? []),
      hour03_00_pm: List<String>.from(map['03_00_pm'] ?? []),
      hour04_00_pm: List<String>.from(map['04_00_pm'] ?? []),
      hour05_00_pm: List<String>.from(map['05_00_pm'] ?? []),
      hour06_00_pm: List<String>.from(map['06_00_pm'] ?? []),
      hour07_00_pm: List<String>.from(map['07_00_pm'] ?? []),
      hour08_00_pm: List<String>.from(map['08_00_pm'] ?? []),
      hour09_00_pm: List<String>.from(map['09_00_pm'] ?? []),
      hour10_00_pm: List<String>.from(map['10_00_pm'] ?? []),
      hour11_00_pm: List<String>.from(map['11_00_pm'] ?? []),
      hour12_00_am: List<String>.from(map['12_00_am'] ?? []),
    );
  }
}
