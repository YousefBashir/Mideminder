import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediminder/models/Medicine.dart';
import 'package:mediminder/providers/medicineProvider.dart';
import 'package:mediminder/widget/medicine_main_info.dart';
import 'package:mediminder/widget/medicine_optional_info.dart';

import 'package:provider/provider.dart';

class MediminderDetails extends StatefulWidget {
  Medicine medicine;
   int icon;
  MediminderDetails({@required this.medicine,this.icon});

  @override
  _MediminderDetailsState createState() => _MediminderDetailsState();
}

class _MediminderDetailsState extends State<MediminderDetails> {
  int makeIcon(icon) {
    switch (widget.medicine.medicineType) {
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
  int timesToTake(int time){
    switch(widget.medicine.interval){
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

  @override
  Widget build(BuildContext context) {
    return Consumer<MedicineProvider>(
      builder: (context,medicineProvider,x)=>
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            'Mediminder Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.green),
          backgroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.30,
              child: Row(
                children: [
                  Container(

                    margin: EdgeInsets.only(left: 10, right: 30),
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: Icon(
                      IconData(makeIcon(widget.icon), fontFamily: "Ic"),
                      color: Color(0xFF3EB16F),
                      size: 180,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40,left: 20),
                    child: Column(
                      children: [
                        MedicineManinIfo(
                            fieldTitle: 'Medicine Name', fieldInfo: widget.medicine.medicineName),
                        MedicineManinIfo(
                            fieldTitle: 'Dosage', fieldInfo: widget.medicine.medicineDosage.toString()),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MedicineOptionalInfo(
              fieldTitle: 'Medicine Type',
              fieldInfo: widget.medicine.medicineType,
            ),
            const SizedBox(
              height: 10,
            ),
            MedicineOptionalInfo(
              fieldTitle: 'Dosage Interval',
              fieldInfo: 'Every ${widget.medicine.interval} hours | ${timesToTake(widget.medicine.interval)} time(s) a day',
            ),
            const SizedBox(
              height: 10,
            ),
            MedicineOptionalInfo(
              fieldTitle: 'Start Time',
              fieldInfo: widget.medicine.startTime,
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: SizedBox(
                height:MediaQuery.of(context).size.height*0.08,
                width: MediaQuery.of(context).size.width*0.7,
                child: ElevatedButton(
                  onPressed: () {
                   medicineProvider.removeMedicine(widget.medicine);
                   Navigator.pop(context);
                  },
                  child: Text(
                    'Delete Mediminder',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary:Color(0xFF3EB16F),
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(60)
                    ),
                      padding: EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
