import 'package:convre/export.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: regularRobotoText(context,
            color: AppColors.red, text: 'Register', fontSize: 14.sp),
      ),
    );
  }
}
