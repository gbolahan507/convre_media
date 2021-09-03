import 'package:convre/export.dart';
import 'base_vm.dart';



class SplashViewModel extends BaseModel {
  Future<void> isLoggedIn() async {
    final loginData = false;
    Future<void>.delayed(const Duration(seconds: 2), () {
      if (loginData) {
        navigate.navigateToReplacing(LoginScreen);
      } else {
        navigate.navigateToReplacing(LoginScreen);
      }
    });
  }
}
