import 'package:flutter/material.dart';
import 'package:smedia/pages/profile.dart';
import 'package:smedia/theme/colors.dart';

void main() {
  runApp(const SMedia());
}

class SMedia extends StatefulWidget {
  const SMedia({super.key});

  @override
  State<SMedia> createState() => _SMediaState();
}

class _SMediaState extends State<SMedia> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: color1,
      ),
      home: Profile(),
    );
  }
}
