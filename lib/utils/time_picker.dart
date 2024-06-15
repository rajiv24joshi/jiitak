import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiitak_test/utils/appColors.dart';

class TimePickerWidget extends StatefulWidget {
  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay _startTime = const TimeOfDay(hour: 10, minute: 00);
  TimeOfDay _endTime = const TimeOfDay(hour: 20, minute: 00);

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _startTime : _endTime,
    );
    if (picked != null && picked != (isStartTime ? _startTime : _endTime)) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTimeField(context, _startTime, true),
        const Text(
          ' ~ ',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        _buildTimeField(context, _endTime, false),
      ],
    );
  }

  Widget _buildTimeField(
      BuildContext context, TimeOfDay time, bool isStartTime) {
    return GestureDetector(
      onTap: () => _selectTime(context, isStartTime),
      child: Container(
        // height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                time.format(context),
                style: GoogleFonts.notoSansJp(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Appcolor.black45,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Appcolor.lightGrey8C,
              )
            ],
          ),
        ),
      ),
    );
  }
}
