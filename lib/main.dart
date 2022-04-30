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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';


typedef dynamic OnItemClickListener();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  print(message.data);
  flutterLocalNotificationsPlugin.show(
      message.data.hashCode,
      message.data['title'],
      message.data['body'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
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

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global =  MyHttpOverrides();//handel ssl shackoff error CERTIFICATE_VERIFY_FAILED
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
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


class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? token;
  List subscribed = [];
  List topics = [
    'Samsung',
    'Apple',
    'Huawei',
    'Nokia',
    'Sony',
    'HTC',
    'Lenovo'
  ];
  @override
  void initState() {
    super.initState();
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
                icon: android.smallIcon,
              ),
            ));
      }
    });
    getToken();
    getTopics();
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
  getToken() async {
    token = await FirebaseMessaging.instance.getToken();
    setState(() {
      token = token;
    });
    print(token);
  }

  getTopics() async {
    await FirebaseFirestore.instance
        .collection('topics')
        .get()
        .then((value) => value.docs.forEach((element) {
      if (token == element.id) {
        subscribed = element.data().keys.toList();
      }
    }));

    setState(() {
      subscribed = subscribed;
    });
  }

}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

