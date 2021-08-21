import 'package:flutter/material.dart';

class IntervalSelection extends StatefulWidget {
  @override
  _IntervalSelectionState createState() => _IntervalSelectionState();
  Function function;

  IntervalSelection(this.function);
}

class _IntervalSelectionState extends State<IntervalSelection> {
  var intervals = [
    6,
    8,
    12,
    24,
  ];
  var selected = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Remind me every',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          width: 10,
        ),
        DropdownButton<int>(
          iconEnabledColor: Color(0xFF3EB16F),
          hint: Text(
            'Select an interval',
            style: TextStyle(
                fontSize: 10,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          value: selected,
          items: [
            DropdownMenuItem(
              value: 0,
              child: Text(
                intervals[0].toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ), DropdownMenuItem(
              value:1,
              child: Text(
                intervals[1].toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ), DropdownMenuItem(
              value: 2,
              child: Text(
                intervals[2].toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 3,
              child: Text(
                intervals[3].toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
          onChanged: (value) {
            widget.function(value);
            selected = value;
            setState(() {});
          }, /*(newVal) {
            setState(() {
              selected = newVal;
            });
          },*/
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          selected == 1 ? 'hour' : 'hours',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
