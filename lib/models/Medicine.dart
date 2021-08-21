import 'package:flutter/foundation.dart';
import 'package:mediminder/Helpers/DbHelper.dart';
class Medicine {
  final int medicineId;
  String medicineName;
  final int medicineDosage;
  final String medicineType;

  final int interval;
  final String startTime;

  Medicine(
      {this.medicineId,

      @required this.medicineName,
      @required this.medicineDosage,
      @required this.medicineType,

      @required this.interval,
      @required this.startTime});

  int get getDosage => medicineDosage;

  String get getType => medicineType;

  int get getInterval => interval;

  String get getStartTime => startTime;

  factory Medicine.fromMap(Map<String, dynamic> incomingData) {
    return Medicine(

      medicineId: incomingData[DbHelper.medicineIdColumnName],
      medicineName: incomingData[DbHelper.medicineNameColumnName],
      medicineDosage: incomingData[DbHelper.medicineDosageColumnName],
      medicineType: incomingData[DbHelper.medicineTypeColumnName],
      interval: incomingData[DbHelper.intervalColumnName],
      startTime: incomingData[DbHelper.startTimeColumnName],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.medicineNameColumnName: this.medicineName,
      DbHelper.medicineDosageColumnName: this.medicineDosage,
      DbHelper.medicineTypeColumnName: this.medicineType,

      DbHelper.intervalColumnName:this.interval,
      DbHelper.startTimeColumnName: this.startTime,
    };
  }
}
