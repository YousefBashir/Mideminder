import 'package:flutter/material.dart';

class MedicineOptionalInfo extends StatelessWidget {
  String fieldTitle;
  String fieldInfo;

  MedicineOptionalInfo({@required this.fieldTitle, @required this.fieldInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.10,
      child: ListView(
        children: [
          Text(
            fieldTitle,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5,),
          Text(
            fieldInfo,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFFC9C9C9),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
