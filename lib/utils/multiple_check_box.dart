import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiitak_test/utils/appColors.dart';

class DaySelectionWidget extends StatefulWidget {
  @override
  _DaySelectionWidgetState createState() => _DaySelectionWidgetState();
}

class _DaySelectionWidgetState extends State<DaySelectionWidget> {
  Map<String, bool> days = {
    '月': false,
    '火': false,
    '水': false,
    '木': false,
    '金': false,
    '土': true,
    '日': true,
    '祝': true,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemCount: days.keys.length,
            itemBuilder: (context, index) {
              String day = days.keys.elementAt(index);
              return DayCheckbox(
                label: day,
                value: days[day]!,
                onChanged: (value) {
                  setState(() {
                    days[day] = value!;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class DayCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final Function(bool?) onChanged;

  DayCheckbox({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: Appcolor.primaryColor,
        ),
        Text(
          label,
          style: GoogleFonts.notoSansJp(
            color: Appcolor.black4B,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
