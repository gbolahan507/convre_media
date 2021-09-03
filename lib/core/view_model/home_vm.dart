import 'package:convre/core/api/home_api.dart';

import 'package:convre/export.dart';

class HomeViewModel extends BaseModel {
  final HomeApi _homeApi = locator<HomeApi>();
  List<HomePageModel> homepage;
  String error;

  Future<void> getHome() async {
    setBusy(true);
    try {
      homepage = await _homeApi.getHome();
      setBusy(false);
    } on AuthException catch (e) {
      setBusy(false);
      await dialog.showDialog(
          title: 'Error!', description: e.message, buttonTitle: 'Close');
      notifyListeners();
    }
  }
}
