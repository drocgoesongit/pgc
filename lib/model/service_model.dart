class ServiceModel {
  String serviceId;
  String serviceName;
  String serviceDescription;
  List<String> servicePhotos;
  int serviceFees;

  ServiceModel({
    required this.serviceId,
    required this.serviceName,
    required this.serviceDescription,
    required this.servicePhotos,
    required this.serviceFees,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      serviceId: json['serviceId'] as String,
      serviceName: json['serviceName'] as String,
      serviceDescription: json['serviceDescription'] as String,
      servicePhotos: List<String>.from(json['servicePhotos'] as List<dynamic>),
      serviceFees: json['serviceFees'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceId': serviceId,
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'servicePhotos': servicePhotos,
      'serviceFees': serviceFees,
    };
  }
}
