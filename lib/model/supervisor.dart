class Supervisor {
  final String name;
  final String phone;

  Supervisor({
    required this.name,
    required this.phone,
  });

  factory Supervisor.fromJson(Map<String, dynamic> json) {
    return Supervisor(
      name: json['name'] as String,
      phone: json['phone'] as String,
    );
  }
  factory Supervisor.fromMap(Map<String, dynamic> map) {
    return Supervisor(
      name: map['name'] as String,
      phone: map['phone'] as String,
    );
  }
}