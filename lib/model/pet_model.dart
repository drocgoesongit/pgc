class PetModel {
  final String petId;
  final String petName;
  final String petBreed;
  final String petAge;
  final String petType;

  PetModel({
    required this.petId,
    required this.petName,
    required this.petBreed,
    required this.petAge,
    required this.petType,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      petId: json['petId'] as String,
      petName: json['petName'] as String,
      petBreed: json['petBreed'] as String,
      petAge: json['petAge'] as String,
      petType: json['petType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'petId': petId,
      'petName': petName,
      'petBreed': petBreed,
      'petAge': petAge,
      'petType': petType,
    };
  }
}
