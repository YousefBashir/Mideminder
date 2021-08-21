import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicineTypeView extends StatelessWidget {
  String name;
  int iconValue;
  bool isSelected;

  Function fun;

  MedicineTypeView(
      {@required this.name,
      this.fun,
      @required this.iconValue,
      @required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => fun(name),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 14.0),
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? Color(0xFF3EB16F) : Colors.white,
            ),
            child: Center(
              child:
              Icon(
                IconData(iconValue, fontFamily: "Ic"),
                size: 70,
                color: isSelected ? Colors.white : Color(0xFF3EB16F),
              ),

            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 7),
            width: 80,
            height: 30,
            decoration: BoxDecoration(
              color: isSelected ? Color(0xFF3EB16F) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.white : Color(0xFF3EB16F),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
