import 'package:arena_sports_app/CommonWidgets/textControllers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../SizeConfig.dart';
import '../theme.dart';
import 'Strings.dart';

class DatePicker extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final String title;
  final TextEditingController controller;
  final ValueChanged<DateTime> selectDateChangeListener;
  final String come;

  DatePicker(this.title, this.selectDateChangeListener,
      {this.initialDate,
      this.firstDate,
      this.lastDate,
      this.come,
      this.controller});

  @override
  State<StatefulWidget> createState() {
    return DatePickerState(initialDate, firstDate, lastDate, controller);
  }
}

class DatePickerState extends State<DatePicker> {
  DateTime selectedDate;
  DateTime firstDate;
  DateTime lastDate;
  TextEditingController controller;
  DatePickerState(DateTime initialDate, DateTime startDate, this.lastDate,
      this.controller) {
    selectedDate = initialDate ?? DateTime.now();
    firstDate = startDate ?? DateTime(1950, 1);
  }

  @override
  Widget build(BuildContext context) {
    widget.selectDateChangeListener(selectedDate);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            _selectDate(context, (dateTime) {
              setState(() {
                selectedDate = dateTime;
              });
            });
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: controller,
              cursorColor: AppTheme.blackColor,
              validator: (value) {
                if (value == null || value == "") {
                  return "Enter Valid Nacimineto";
                }
              },
              //  onFieldSubmitted: (v) {},
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.date_range_outlined,
                    color: AppTheme.blackColor,
                  ),
                  /*SvgPicture.asset(
                            'assets/dateTimeIcon.svg',
                            height: 20.0,
                          ),*/
                  contentPadding: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 2,
                      bottom: SizeConfig.blockSizeVertical * 2,
                      left: SizeConfig.blockSizeVertical * 1),
                  labelText: Strings.dob,
                  labelStyle: TextStyle(
                      fontSize: 15.0,
                      fontFamily: AppTheme.appFont,
                      color: AppTheme.blackColor)),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
          ),
        ),
/*
        Padding(
          padding: const EdgeInsets.only(right: 16.0, bottom: 4.0),
          child: InkWell(
            child: Image.asset("assets/images/ic_calendar.png",
                height: 20.0, width: 20.0),
            onTap: () {
              FocusScope.of(context).unfocus();

              _selectDate(context, (dateTime) {
                setState(() {
                  selectedDate = dateTime;
                });
              });
            },
          ),
        )
*/
      ],
    );
  }

  Future<void> _selectDate(
      BuildContext context, ValueChanged<DateTime> listner) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: firstDate.subtract(Duration(days: 1)) ?? DateTime(1950, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) listner(picked);
  }
}
