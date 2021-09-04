import 'package:convre/core/utils/dialog_manager.dart';
import 'package:convre/export.dart';
import 'package:convre/layout_view.dart';
import 'package:convre/view/onboarding/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

ValueNotifier<int> cartCount;

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: allProviders,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme:
                  GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
              primaryColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: LayoutView(),
          builder: (BuildContext context, Widget child) => Navigator(
              key: locator<DialogService>().dialogNavigationKey,
              onGenerateRoute: (RouteSettings settings) =>
                  MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) =>
                          DialogManager(child: child))),
          navigatorKey: locator<NavigationService>().navigationKey,
          onGenerateRoute: generateRoute,
        ));
  }
}
