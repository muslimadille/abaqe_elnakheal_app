import 'dart:io';
import 'package:abaqe_elnakheal_app/modules/splash_screen/spalsh_screen.dart';
import 'package:abaqe_elnakheal_app/providers/cart_provider.dart';
import 'package:abaqe_elnakheal_app/providers/common_provider_model.dart';
import 'package:abaqe_elnakheal_app/providers/home_provider.dart';
import 'package:abaqe_elnakheal_app/providers/login_provider.dart';
import 'package:abaqe_elnakheal_app/providers/my_orders_provider.dart';
import 'package:abaqe_elnakheal_app/providers/notifications_provider.dart';
import 'package:abaqe_elnakheal_app/providers/rate_rovider.dart';
import 'package:abaqe_elnakheal_app/providers/regions_provider.dart';
import 'package:abaqe_elnakheal_app/providers/registeration_provider.dart';
import 'package:abaqe_elnakheal_app/providers/search_provider.dart';
import 'package:abaqe_elnakheal_app/providers/utils_provider.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/constants.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import 'modules/main_tabs_screen/main_tabs_screen.dart';


typedef dynamic OnItemClickListener();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global =  MyHttpOverrides();//handel ssl shackoff error CERTIFICATE_VERIFY_FAILED
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
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
      ChangeNotifierProvider<NotificationsProvider>(create: (ctx) => NotificationsProvider(),),
    ],
    child:EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
        path: 'assets/strings', // <-- change the path of the translation files
        fallbackLocale: const Locale('ar', 'EG'),
        child:  MyApp()
    ),
  ));
}
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
    new AndroidInitializationSettings('ic_launcher');
    var initialzationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
    InitializationSettings(android: initialzationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Colors.blue,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: "@mipmap/ic_launcher",
              ),
              iOS: IOSNotificationDetails(

              )
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null) {
        MyUtils.navigate(Constants.tabScreenContext!, MainTabsScreen(selectedTab: 3,));
      }
    });

    getToken();
  }

  getToken() async {
    Constants.DEVICE_TOKEN = (await FirebaseMessaging.instance.getToken())!;
  }
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
        child:  SplashScreen() ,
    ));
  }


}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

