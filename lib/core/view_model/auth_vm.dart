import 'package:convre/export.dart';
import 'base_vm.dart';

class AuthViewModel extends BaseModel {
  final AuthApi _authApi = locator<AuthApi>();

  Future<void> registerUser(Map<String, String> data) async {
    navigate.navigateToReplacing(LayoutScreen);
    await _authApi.registerUser(data);
  }

  Future<void> loginUser(BuildContext context, Map<String, String> data) async {
    await _authApi.loginUsers(data);
    navigate.navigateToReplacing(LayoutScreen);
  }
}
// git remote set-url origin git@github.com:ppreyer/conVre.git
// git remote add github git@github.com:ppreyer/conVre.git
