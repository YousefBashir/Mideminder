import 'package:flutter/cupertino.dart';
import 'package:mediminder/Helpers/DbHelper.dart';
import 'package:mediminder/models/Medicine.dart';

class MedicineProvider extends ChangeNotifier {
  List<Medicine> allMedicines;
  Medicine medicine;
  int timesToTake(int time){
    switch(medicine.interval){
      case 6:
        return 4;
        break;
      case 8:
        return 3;
        break;
      case 12:
        return 2;
        break;
      case 24:
        return 1;
        break;
    }
  }

  MedicineProvider(){
    getAllMedicines();
  }

  getAllMedicines() async {
    this.allMedicines = await DbHelper.dbHelper.getAllMedicine();
    notifyListeners();
  }

  addMedicine(Medicine medicine) async {
    await DbHelper.dbHelper.insertMedicine(medicine);
    getAllMedicines();
  }

  removeMedicine(Medicine medicine) async {
    await DbHelper.dbHelper.deleteMedicine(medicine);
    getAllMedicines();
  }
  updateMedicine(Medicine medicine)async{
    await DbHelper.dbHelper.updateMedicine(medicine);
    getAllMedicines();
  }

}
