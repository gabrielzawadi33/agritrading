import 'package:agritrade/model/qc.dart';
import 'package:agritrade/model/supervisor.dart';

class Register {
  final String? harvestLocation;
  final int? noOfCrates;
  final int? noOfLabour;
  final List<Supervisor>? supervisors;
  final List<Qc>? qcs;
  final double? totalCost;
  Register({
    this.harvestLocation,
    this.noOfCrates,
    this.noOfLabour,
    this.supervisors,
    this.qcs,
    this.totalCost,
  });
}
