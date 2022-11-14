// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:explore/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TextInfo extends StatelessWidget {
  String? title;
  NumberFormat? formatter;
  Object? value;

  TextInfo(
      {Key? key,
      required this.title,
      required this.value,
      required this.formatter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkActive = context.read<DarkThemeProvider>().darkTheme;
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: title,
        style: TextStyle(
          color:
              isDarkActive ? const Color(0xFF1C1917) : const Color(0xFFEAECF0),
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      TextSpan(
        text: (value is String)
            ? value.toString()
            : formatter!.format(int.parse(value.toString())),
        style: const TextStyle(
          color: Color(0xFF1C1917),
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
      )
    ]));
  }
}
