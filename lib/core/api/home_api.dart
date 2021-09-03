import 'package:convre/core/model/home_page_model.dart';

class HomeApi {
  //get All Items
  Future<List<HomePageModel>> getHome() async {
    try {
      // simulate loading/network delay
      await Future<void>.delayed(const Duration(seconds: 1));
      // since there's no api to get from, we fetch from a list locally stored
      return homePageModel;
    } catch (e) {
      throw 'Error';
    }
  }
}
