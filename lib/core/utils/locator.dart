import 'package:convre/core/api/home_api.dart';
import 'package:convre/core/view_model/auth_vm.dart';
import 'package:convre/core/view_model/home_vm.dart';
import 'package:convre/core/view_model/splash_vm.dart';
import 'package:convre/export.dart';
import 'package:provider/provider.dart';



GetIt locator = GetIt.instance;


void setupLocator() {

  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());

  locator.registerFactory(() => SplashViewModel());

  locator.registerLazySingleton(() => AuthApi());
  locator.registerFactory(() => AuthViewModel());


  locator.registerLazySingleton(() => HomeApi());
  locator.registerFactory(() => HomeViewModel());


  


}

final List<SingleChildWidget> allProviders = <SingleChildWidget>[
  ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
  ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
  ChangeNotifierProvider<SplashViewModel>(
      create: (_) => SplashViewModel()),
];
