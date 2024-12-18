class Crate {
  String? name;
  int? quantity;

  Crate({
    this.name,
    this.quantity,
  });
  factory Crate.fromJson(Map<String, dynamic> json) {
    return Crate(
      name: json['name'] as String?,
      quantity: json['quantity'] as int?,
    );
  }

  factory Crate.fromMap(Map<String, dynamic> map) {
    return Crate(
      name: map['name'] as String?,
      quantity: map['quantity'] as int?,
    );
  }
}