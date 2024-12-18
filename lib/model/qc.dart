class QualityController {
  final String name;
  final String phone;

  QualityController({
    required this.name,
    required this.phone,
  });

  factory QualityController.fromJson(Map<String, dynamic> json) {
    return QualityController(
      name: json['name'] as String,
      phone: json['phone'] as String,
    );
  }

  factory QualityController.fromMap(Map<String, dynamic> map) {
    return QualityController(
      name: map['name'] as String,
      phone: map['phone'] as String,
    );
  }
}