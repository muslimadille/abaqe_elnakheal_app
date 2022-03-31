import 'dart:io';
import 'package:abaqe_elnakheal_app/modules/splash_screen/spalsh_screen.dart';
import 'package:abaqe_elnakheal_app/providers/cart_provider.dart';
import 'package:abaqe_elnakheal_app/providers/common_provider_model.dart';
import 'package:abaqe_elnakheal_app/providers/home_provider.dart';
import 'package:abaqe_elnakheal_app/providers/login_provider.dart';
import 'package:abaqe_elnakheal_app/providers/my_orders_provider.dart';
import 'package:abaqe_elnakheal_app/providers/rate_rovider.dart';
import 'package:abaqe_elnakheal_app/providers/regions_provider.dart';
import 'package:abaqe_elnakheal_app/providers/registeration_provider.dart';
import 'package:abaqe_elnakheal_app/providers/search_provider.dart';
import 'package:abaqe_elnakheal_app/providers/utils_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


typedef dynamic OnItemClickListener();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global =  MyHttpOverrides();//handel ssl shackoff error CERTIFICATE_VERIFY_FAILED
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CommonProviderModel>(create: (ctx) => CommonProviderModel(),),
      ChangeNotifierProvider<UtilsProviderModel>(create: (ctx) => UtilsProviderModel(),),
      ChangeNotifierProvider<RegisterProvider>(create: (ctx) => RegisterProvider(),),
      ChangeNotifierProvider<LoginProvider>(create: (ctx) => LoginProvider(),),
      ChangeNotifierProvider<HomeProvider>(create: (ctx) => HomeProvider(),),
      ChangeNotifierProvider<SearchProvider>(create: (ctx) => SearchProvider(),),
      ChangeNotifierProvider<CartProvider>(create: (ctx) => CartProvider(),),
      ChangeNotifierProvider<RegionsProvider>(create: (ctx) => RegionsProvider(),),
      ChangeNotifierProvider<MyordersProvider>(create: (ctx) => MyordersProvider(),),
      ChangeNotifierProvider<RatesProvider>(create: (ctx) => RatesProvider(),),
    ],
    child:EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
        path: 'assets/strings', // <-- change the path of the translation files
        fallbackLocale: const Locale('ar', 'EG'),
        child: const MyApp()
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     context.setLocale(const Locale('ar', 'EG'));
     //EasyLocalization.of(context)!.setLocale(const Locale('ar', 'EG'));
    UtilsProviderModel utilsProviderModel;
    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen: true);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor:Colors.blue,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: utilsProviderModel.currentLocal,
      debugShowCheckedModeBanner: false,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarColor: Colors.black.withOpacity(0.7),
          ),
        child: const SplashScreen()) ,
    );
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

