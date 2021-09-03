import 'package:convre/app/utils/validators.dart';
import 'package:convre/core/view_model/auth_vm.dart';
import 'package:convre/export.dart';
import 'package:convre/view/auths/forgot_password_view.dart';
import 'package:convre/view/base_view.dart';
import 'package:convre/view/widget/buttons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  final GlobalKey<FormState> _validateEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> _validatePassword = GlobalKey<FormState>();
  final GlobalKey<FormState> _validateUserName = GlobalKey<FormState>();

  bool isCheck = false;
  bool emailValid = false;
  bool usernameValid = false;
  bool passwordValid = false;

  bool showPassword = true;

  bool isloginView = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BaseView<AuthViewModel>(
        onModelReady: (AuthViewModel m) => {},
        builder: (_, AuthViewModel model, __) => GestureDetector(
            onTap: Utils.offKeyboard,
            child: Scaffold(
                body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        verticalSpaceMedium,
                        verticalSpaceMedium,
                        verticalSpaceMedium,
                        Stack(
                          children: [
                            regularRobotoText(context,
                                text: 'Convre',
                                color: AppColors.colorDeepPink,
                                fontSize: 50.sp,
                                letterSpacing: 5.0,
                                fontWeight: FontWeight.w500),
                            Positioned(
                                top: 20,
                                left: 10,
                                child:
                                    Icon(Icons.more_horiz_outlined, size: 20)),
                          ],
                        ),
                        regularRobotoText(
                          context,
                          text:
                              'Welcome to Convre, Africas best. Your\n communities are waiting for you',
                          color: AppColors.textGrey,
                          fontSize: 16.sp,
                          textAlign: TextAlign.center,
                        ),
                        verticalSpaceMedium,
                        AuthButton(
                          image: 'images/goggle.png',
                          text: 'Continue with Google',
                          onTap: () => print('Google'),
                        ),
                        verticalSpaceMedium,
                        AuthButton(
                          image: 'images/facebook.png',
                          text: 'Continue with Facebook',
                          onTap: () => print('Facebook'),
                        ),
                        verticalSpaceMedium,
                        Row(
                          children: [
                            Expanded(
                              child: Divider(color: Colors.grey),
                            ),
                            horizontalSpaceMedium,
                            regularRobotoText(
                              context,
                              text: 'OR',
                              color: AppColors.black,
                              fontSize: 20.sp,
                              textAlign: TextAlign.center,
                            ),
                            horizontalSpaceMedium,
                            Expanded(
                              child: Divider(color: Colors.grey),
                            ),
                          ],
                        ),
                        verticalSpaceMedium,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              Form(
                                key: _validateEmail,
                                child: CustomTextField(
                                  hintText: 'Email address',
                                  validator: Utils.validateEmail,
                                  obscureText: false,
                                  textInputType: TextInputType.emailAddress,
                                  controller: emailController,
                                  textInputAction: TextInputAction.next,
                                  textAlign: TextAlign.start,
                                  onChanged: (a) {
                                    emailValid =
                                        _validateEmail.currentState.validate();
                                    setState(() {});
                                  },
                                ),
                              ),
                              verticalSpaceMedium,
                              isloginView
                                  ? Form(
                                      key: _validateUserName,
                                      child: CustomTextField(
                                        // readOnly: model.busy,
                                        hintText: 'username',
                                        validator: Utils.isValidName,
                                        obscureText: false,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        controller: usernameController,
                                        textInputAction: TextInputAction.next,
                                        textAlign: TextAlign.start,
                                        onChanged: (a) {
                                          usernameValid = _validateUserName
                                              .currentState
                                              .validate();
                                          setState(() {});
                                        },
                                      ),
                                    )
                                  : SizedBox(),
                              isloginView ? verticalSpaceMedium : SizedBox(),
                              Form(
                                key: _validatePassword,
                                child: CustomTextField(
                                  hintText: 'Password',
                                  validator: Utils.isValidPassword,
                                  obscureText: showPassword,
                                  textInputType: TextInputType.emailAddress,
                                  controller: passwordController,
                                  textInputAction: TextInputAction.next,
                                  textAlign: TextAlign.start,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      showPassword = !showPassword;
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.remove_red_eye,
                                      color: AppColors.textBlue,
                                    ),
                                  ),
                                  onChanged: (a) {
                                    passwordValid = _validatePassword
                                        .currentState
                                        .validate();
                                    setState(() {});
                                  },
                                ),
                              ),
                              verticalSpaceMedium,
                              isloginView
                                  ? Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          child: Checkbox(
                                              value: isCheck,
                                              onChanged: (values) {
                                                isCheck = values;
                                                setState(() {});
                                              }),
                                        ),
                                        horizontalSpaceSmall,
                                        regularRobotoText(
                                          context,
                                          text:
                                              'I agree to the Term of Use and Privacy and Policy',
                                          color: AppColors.black,
                                          fontSize: 12.sp,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )
                                  : SizedBox(),
                              !isloginView
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                          InkWell(
                                            onTap: () => routeTo(
                                                context, ForgotPasswordView()),
                                            child: regularRobotoText(context,
                                                text: 'Forgot Password?',
                                                color: AppColors.textBlue,
                                                fontSize: 16.sp,
                                                textAlign: TextAlign.center,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ])
                                  : SizedBox(),
                              verticalSpaceMedium,
                              customButtom(context,
                                  text: isloginView ? 'Register' : 'Login',
                                  fontSize: 14.sp,
                                  textColor: AppColors.white,
                                  buttonColor: AppColors.textBlue,
                                  borderColor: AppColors.textBlue,
                                  busy: model.busy,
                                  function: emailValid &&
                                          usernameValid &&
                                          passwordValid &&
                                          !model.busy
                                      ? () {
                                          if (!_validateEmail.currentState
                                                  .validate() &&
                                              !_validateUserName.currentState
                                                  .validate() &&
                                              !_validatePassword.currentState
                                                  .validate()) {
                                            _validateEmail.currentState
                                                    .validate() &&
                                                _validateUserName.currentState
                                                    .validate() &&
                                                _validatePassword.currentState
                                                    .validate();
                                            setState(() {});
                                            return;
                                          }
                                          Utils.unfocusKeyboard(context);
                                          final Map<String, String> logindata =
                                              <String, String>{
                                            'email': emailController.text,
                                            'password': passwordController.text,
                                          };

                                          final Map<String, String>
                                              registerData = <String, String>{
                                            'email': emailController.text,
                                            'username': usernameController.text,
                                            'password': passwordController.text,
                                          };

                                          isloginView
                                              ? model.registerUser(registerData)
                                              : model.loginUser(
                                                  context, logindata);

                                          print('logidat is $logindata');
                                          print('registerdta is $registerData');
                                        }
                                      : null),
                              verticalSpaceMedium,
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: !isloginView
                                        ? "Don't have an account? "
                                        : 'Already have an account? ',
                                    style: GoogleFonts.openSans(
                                      fontSize: 16.w,
                                      letterSpacing: 0.1,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.black.withOpacity(0.8),
                                    ),
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text:
                                            !isloginView ? 'Register' : 'Login',
                                        style: GoogleFonts.nunito(
                                          fontSize: 16.w,
                                          fontWeight: FontWeight.w800,
                                          color: AppColors.textBlue,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            isloginView = !isloginView;
                                            setState(() {});
                                          },
                                      ),
                                    ]),
                              ),
                              verticalSpaceMedium,
                              verticalSpaceSmall,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  regularRobotoText(
                                    context,
                                    text: 'About',
                                    color: AppColors.textGrey.withOpacity(0.5),
                                    fontSize: 18.sp,
                                    textAlign: TextAlign.center,
                                  ),
                                  horizontalSpaceSmall,
                                  Container(
                                      height: 30,
                                      width: 1,
                                      color:
                                          AppColors.textGrey.withOpacity(0.5)),
                                  horizontalSpaceSmall,
                                  regularRobotoText(
                                    context,
                                    text: 'Terms of Use',
                                    color: AppColors.textGrey.withOpacity(0.5),
                                    fontSize: 18.sp,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ))));
  }
}

class AuthButton extends StatelessWidget {
  final String image;
  final String text;
  final Function onTap;
  const AuthButton({
    Key key,
    this.image,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.black)),
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 30,
              ),
              horizontalSpaceMedium,
              regularRobotoText(
                context,
                text: text,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
