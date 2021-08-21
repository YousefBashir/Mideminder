import 'package:flutter/material.dart';
import 'package:mediminder/models/Medicine.dart';
import 'package:mediminder/ui/mediminder_details.dart';

class MedicineCard extends StatelessWidget {
  int icon;

  // String type;
  // int interval;
  // String name;
  Medicine medicine;

  MedicineCard({@required this.medicine, this.icon});

  //MedicineCard({@required this.name, @required this.interval,this.icon,this.type});

  int makeIcon(icon) {
    switch (medicine.medicineType) {
      case 'Bottle':
        return icon = 0xe900;
        break;
      case 'Pill':
        return icon = 0xe901;
        break;
      case 'Syringe':
        return icon = 0xe902;
        break;
      case 'Tablet':
        return icon = 0xe903;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => new MediminderDetails(
                  medicine: medicine,
                )));
      },
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  width: 80,
                  height: 80,
                  color: Colors.white70,
                  child: Icon(
                    IconData(makeIcon(this.icon), fontFamily: "Ic"),
                    color: Color(0xFF3EB16F),
                    size: 70,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  medicine.medicineName,
                  style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF3EB16F),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Every ${medicine.interval} hours',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFC9C9C9),
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
