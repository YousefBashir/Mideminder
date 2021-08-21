import 'package:flutter/material.dart';

class MedicineManinIfo extends StatelessWidget {
  String fieldTitle;
  String fieldInfo;

  MedicineManinIfo({@required this.fieldTitle, @required this.fieldInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.height*0.1,
      child:ListView(
        children: [
          Text(fieldTitle,style: TextStyle(
              fontSize: 17,
              color: Color(0xFFC9C9C9),
              fontWeight: FontWeight.bold),),
          Text(fieldInfo,style: TextStyle(
              fontSize: 24,
              color:Color(0xFF3EB16F),
              fontWeight: FontWeight.bold),)

        ],
      ),
    );
  }
}
