import 'package:check_out_page/screens/check_out_screen.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: check_out_screen(),
    );
  }
}
