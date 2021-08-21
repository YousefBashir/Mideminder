import 'package:flutter/material.dart';
import 'package:mediminder/Helpers/DbHelper.dart';
import 'package:mediminder/models/Medicine.dart';
import 'package:mediminder/providers/medicineProvider.dart';
import 'package:mediminder/ui/success_page.dart';
import 'package:mediminder/widget/custom_text_span.dart';
import 'package:mediminder/widget/interval_selection.dart';
import 'package:mediminder/widget/medicine_type.dart';
import 'package:provider/provider.dart';

class NewEntryPage extends StatefulWidget {
  static final routeName='newEntry';
  @override
  _NewEntryPageState createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
  String name;
  int dosage;
  String selectedType = '';
  bool _clicked = false;
  var intervals = [
    6,
    8,
    12,
    24,
  ];
  var selected = 0;
  TimeOfDay _time = TimeOfDay(hour: 0, minute: 00);
  Future<TimeOfDay> selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        _clicked = true;
      });
    }
    return picked;
  }
  selectIcon(String s) {
    this.selectedType = s;
    setState(() {});
  }
  TextEditingController nameController;
  TextEditingController dosageController;

  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();
  }
  // selectedInterval(int time){
  //   this.interval=time;
  //   setState(() {
  //   });
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Consumer<MedicineProvider>(builder: (context,medicineProvider,x){
      return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.green,
          ),
          centerTitle: true,
          title: Text(
            'Add New Mediminder',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          child:SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormTitle(
                  title: 'Medicine Name',
                  isRequired: true,
                ),
                TextFormField(
                  controller: nameController,
                  maxLength: 12,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                  onChanged: (value) {
                   // name = value;
                  },
                ),
                TextFormTitle(
                  title: 'Dosage in mg',
                  isRequired: true,
                ),
                TextFormField(
                  controller: dosageController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                  onChanged: (value) {
                    //dosage = value as int;
                  },
                ),
                TextFormTitle(
                  title: 'Medicine type',
                  isRequired: false,
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MedicineTypeView(
                      fun: selectIcon,
                      name: 'Bottle',
                      iconValue: 0xe900,
                      isSelected: selectedType == 'Bottle',
                    ),
                    MedicineTypeView(
                      iconValue: 0xe901,
                      fun: selectIcon,
                      name: 'Pill',
                      isSelected: selectedType == 'Pill',
                    ),
                    MedicineTypeView(
                      fun: selectIcon,
                      name: 'Syringe',
                      iconValue: 0xe902,
                      isSelected: selectedType == 'Syringe',
                    ),
                    MedicineTypeView(
                      fun: selectIcon,
                      name: 'Tablet',
                      iconValue: 0xe903,
                      isSelected: selectedType == 'Tablet',
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormTitle(title: 'Interval Selection', isRequired: true),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Remind me every',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownButton<int>(
                      iconEnabledColor: Color(0xFF3EB16F),
                      hint: selected == 0
                          ? Text(
                        'Select an interval',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      )
                          : null,
                      value: selected == 0 ? null : selected,
                      items: intervals.map((int value) {
                        return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ));
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          selected = newVal;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'hours',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                TextFormTitle(title: 'Starting time', isRequired: true),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 60,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 4),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectTime(context);
                          });
                        },
                        child: Text(
                          "Pick Time",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF3EB16F)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                Center(
                    child: Text(
                      'Selected starting time: ' + '${_time.format(context)}',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.08,
                    right: MediaQuery.of(context).size.height * 0.08,
                  ),
                  child: Container(
                    width: 220,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (nameController.text == "") {
                          SnackBar snackBar = SnackBar(
                            content: Text('Please enter medicine name'),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        if (nameController.text != "") {
                          name = nameController.text;
                        }
                        if (dosageController.text == "") {
                          dosage = 0;
                        }
                        if (dosageController.text != "") {
                          dosage = int.parse(dosageController.text);
                        }
                        await medicineProvider.addMedicine(Medicine(
                            medicineName: name,
                            medicineDosage: dosage,
                            medicineType: selectedType,
                            interval: selected,
                            startTime: _time.format(context)));

                        Navigator.of(context).pushNamedAndRemoveUntil(
                            SuccessPage.routeName, (route) => false);

                        // DbHelper.dbHelper.getTablesName();
                        // Medicine mm =
                        //     await DbHelper.dbHelper.getSpecificMedicine(6);
                        // print(mm.toMap());
                      },
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF3EB16F)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                            //side: BorderSide(color:Color(0xFF3EB16F)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),






              ],

            ),
          )


        ),

      );
    });
  }
}
