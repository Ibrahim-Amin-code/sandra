import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/layout/cubit/cubit.dart';
import 'package:sandra_app/screens/splash/splashScreen.dart';
import 'package:sizer/sizer.dart';
import 'generated/codegen_loader.g.dart';
import 'network/bloc_observer.dart';
import 'network/dio/dio_helper.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
    statusBarColor: HexColor('ffcdd2'),
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.inti();
  runApp(EasyLocalization(
    supportedLocales: [Locale('ar', ''), Locale('en', '')],
    path: 'assets/translations', // <-- change the path of the translation files
    assetLoader: CodegenLoader(),
    child: MyApp(),));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Sizer(
      builder: (context, orientation, deviceType){
        return MultiBlocProvider(
            providers: [
              BlocProvider<AppCubit>(create: (context) => AppCubit()..createDb()),
              BlocProvider<HomeCubit>(
                  create: (context) => HomeCubit()
                    ..getAllProducts()
                    ..getProducts(id: '',brandId: '')
                    ..getCategories()
                    ..getShops()
                    ..getBanners()
                    ..getAllOffers()
                    ..getProductDetails( id: '')
                    ..contactInfo(),

              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale!.languageCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              home: SafeArea(
                child: Splash(),
              ),
            ));
      },
    );
  }
}
