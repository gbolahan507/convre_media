import 'package:convre/app/utils/validators.dart';
import 'package:convre/core/view_model/auth_vm.dart';
import 'package:convre/export.dart';
import 'package:convre/view/base_view.dart';
import 'package:convre/view/widget/buttons.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  final emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
        onModelReady: (AuthViewModel m) => {},
        builder: (_, AuthViewModel model, __) => GestureDetector(
            onTap: Utils.offKeyboard,
            child: Scaffold(
              body: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      regularRobotoText(context,
                          text: 'Reset Password',
                          color: AppColors.black,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold),
                      regularRobotoText(
                        context,
                        text:
                            "Enter your username or email and we'll send\nyou a link to get back into your account",
                        color: AppColors.black,
                        fontSize: 16.sp,
                        textAlign: TextAlign.center,
                      ),
                      verticalSpaceSmall,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            CustomTextField(
                              // readOnly: model.busy,
                              hintText: 'Email/Username',
                              validator: Utils.isValidForgotPasword,
                              obscureText: false,
                              textInputType: TextInputType.emailAddress,
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              textAlign: TextAlign.start,
                            ),
                            verticalSpaceMedium30,
                            verticalSpaceSmall,
                            customButtom(context,
                                text: 'Submit',
                                fontSize: 14.sp,
                                textColor: AppColors.white,
                                buttonColor: AppColors.textBlue,
                                borderColor: AppColors.textBlue,
                                busy: model.busy, function: () {
                              if (_formKey.currentState.validate()) {
                                print('Submit');
                              }
                            }),
                            verticalSpaceMedium30,
                            verticalSpaceSmall,
                            regularRobotoText(
                              context,
                              text: "Have Code?",
                              color: AppColors.textBlue,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
