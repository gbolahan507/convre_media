import 'package:convre/core/view_model/splash_vm.dart';
import 'package:convre/export.dart';
import 'package:convre/view/base_view.dart';
import 'package:flutter/material.dart';




class SplashView extends StatelessWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BaseView<SplashViewModel>(
      onModelReady: (SplashViewModel model) => model.isLoggedIn(),
      builder: (_, __, ___) => Scaffold(
        backgroundColor: AppColors.red,
        body: Center(
          child: regularSansText(
            context,
            text: 'ConVre',
            color: AppColors.white,
            textAlign: TextAlign.center,
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
