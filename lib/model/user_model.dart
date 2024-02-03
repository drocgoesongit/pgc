class UserModel {
  String id;
  String firstName;
  String lastName;
  String email;
  String phone;
  int loginTimestamp;
  String chats;
  List<String> appointments;
  List<String> pets;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.loginTimestamp,
    required this.chats,
    required this.appointments,
    required this.pets,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      loginTimestamp: json['loginTimestamp'],
      chats: json['chats'],
      appointments: List<String>.from(json['appointments']),
      pets: List<String>.from(json['pets']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'loginTimestamp': loginTimestamp,
      'chats': chats,
      'appointments': appointments,
      'pets': pets,
    };
  }
}
