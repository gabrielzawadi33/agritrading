class Vehicle {
  String? name;
  String? plateNumber;

  Vehicle({
    this.name,
    this.plateNumber,
  });

  // Create a Vehicle from a JSON object
  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      name: json['name'] as String?,
      plateNumber: json['plate_number'] as String?,
    );
  }

  // Create a Vehicle from a Map
  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      name: map['name'] as String?,
      plateNumber: map['plate_number'] as String?,
    );
  }
}