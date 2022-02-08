import 'package:abaqe_elnakheal_app/modules/splash_screen/spalsh_screen.dart';
import 'package:abaqe_elnakheal_app/providers/common_provider_model.dart';
import 'package:abaqe_elnakheal_app/providers/utils_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


typedef dynamic OnItemClickListener();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CommonProviderModel>(create: (ctx) => CommonProviderModel(),),
      ChangeNotifierProvider<UtilsProviderModel>(create: (ctx) => UtilsProviderModel(),),

    ],
    child:EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
        path: 'assets/strings', // <-- change the path of the translation files
        fallbackLocale: Locale('ar', 'EG'),
        child: MyApp()
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     context.setLocale(Locale('ar', 'EG'));
     EasyLocalization.of(context)!.setLocale(Locale('ar', 'EG'));
    UtilsProviderModel utilsProviderModel;
    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen: true);
    return utilsProviderModel.currentLocalName.isNotEmpty?MaterialApp(
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
    ):Container();
  }
}


