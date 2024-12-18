import 'package:agritrade/model/qc.dart';
import 'package:agritrade/model/supervisor.dart';

class Requisition {
  final String? harvestLocation;
  final int? noOfCrates;
  final int? noOfLabour;
  final List<Supervisor>? supervisors;
  final List<QualityController>? qcs;
  final String? totalHarvests;

  Requisition({
    this.harvestLocation,
    this.noOfCrates,
    this.noOfLabour,
    this.supervisors,
    this.qcs,
    this.totalHarvests,
  });
  factory Requisition.fromJson(Map<String, dynamic> json) {
    return Requisition(
      harvestLocation: json['harvest_location'] as String?,
      noOfCrates: json['no_Crates'] as int?,
      noOfLabour: json['no_Labour'] as int?,
      totalHarvests: json['total_cost'] as String?,
    );
  }

  factory Requisition.fromMap(Map<String, dynamic> map) {
    return Requisition(
      harvestLocation: map['harvestLocation'] as String?,
      noOfCrates: map['no_cCrates'] as int?,
      noOfLabour: map['no_labour'] as int?,
      totalHarvests: map['total_cost'] as String?,
    );
  }
}