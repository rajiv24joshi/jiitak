import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiitak_test/utils/appColors.dart';

class CustomDropdown extends StatefulWidget {
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedCategory;
  List<String> categories = [
    '和食',
    '洋食',
    '中華',
    'イタリアン',
    'フレンチ',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Appcolor.listDateColor,
            width: 1,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      hint: Text(
        '料理カテゴリー選択',
        style: GoogleFonts.notoSansJp(
          color: Appcolor.black4B,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      value: selectedCategory,
      onChanged: (String? newValue) {
        setState(() {
          selectedCategory = newValue;
        });
      },
      items: categories.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
