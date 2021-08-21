import 'package:flutter/material.dart';
import 'package:mediminder/models/Medicine.dart';
import 'package:mediminder/providers/medicineProvider.dart';
import 'package:mediminder/widget/medicine_card.dart';
import 'package:provider/provider.dart';

import 'new_entry_page.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Medicine> medicines = MedicineProvider().allMedicines;

  @override
  Widget build(BuildContext context) {
    return Consumer<MedicineProvider>(
      builder: (context, medicineProvider, x) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF3EB16F),
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF3EB16F),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(50, 27),
                    bottomRight: Radius.elliptical(50, 27),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Mediminder',
                      style: TextStyle(
                        fontFamily: 'Angel',
                        fontSize: 65,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.green.shade100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Number of Mediminders',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      medicineProvider.allMedicines == null
                          ? '0'
                          : medicineProvider.allMedicines.length.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Neu",
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 7,
              child: Center(
                child: medicineProvider.allMedicines == null
                    ? Text(
                        "Press + to add a Mediminder",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold),
                      )
                    : Container(
                        color: Color(0xFFF6F8FC),
                        child: GridView.builder(
                            padding: EdgeInsets.only(top: 12),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: medicineProvider.allMedicines.length,
                            itemBuilder: (context, int index) {
                              return MedicineCard(
                                medicine: medicineProvider.allMedicines[index],
                                // name:medicineProvider.allMedicines[index].medicineName,
                                // interval: medicineProvider.allMedicines[index].interval,
                                // type: medicineProvider.allMedicines[index].medicineType,
                              );
                            }),
                      ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 4,
          backgroundColor: Color(0xFF3EB16F),
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewEntryPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
