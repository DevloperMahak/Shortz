import 'dart:async';
<<<<<<< HEAD
import 'dart:io';
=======
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703

import 'package:bubbly/languages/languages_keys.dart';
import 'package:bubbly/service/ads_service.dart';
import 'package:bubbly/utils/assert_image.dart';
import 'package:bubbly/utils/const_res.dart';
import 'package:bubbly/utils/font_res.dart';
import 'package:bubbly/utils/key_res.dart';
import 'package:bubbly/utils/my_loading/my_loading.dart';
import 'package:bubbly/utils/session_manager.dart';
import 'package:bubbly/utils/theme.dart';
import 'package:bubbly/view/chat_screen/chat_screen.dart';
import 'package:bubbly/view/main/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import 'api/api_service.dart';

<<<<<<< HEAD
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

SessionManager sessionManager = SessionManager();
String selectedLanguage = byDefaultLanguage;

void main() async {
  HttpOverrides.global = MyHttpOverrides();
=======
SessionManager sessionManager = SessionManager();
String selectedLanguage = byDefaultLanguage;

Future<void> main() async {
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  await FlutterDownloader.initialize(ignoreSsl: true);
  await sessionManager.initPref();
<<<<<<< HEAD
  // await FlutterBranchSdk.init(enableLogging: true, disableTracking: false);
  await FlutterBranchSdk.init(
      enableLogging: true, branchAttributionLevel: BranchAttributionLevel.FULL);
  FlutterBranchSdk.setConsumerProtectionAttributionLevel(
      BranchAttributionLevel.FULL);
  selectedLanguage =
      sessionManager.giveString(KeyRes.languageCode) ?? byDefaultLanguage;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
=======
  await FlutterBranchSdk.init(enableLogging: true, disableTracking: false);
  selectedLanguage = sessionManager.giveString(KeyRes.languageCode) ?? byDefaultLanguage;
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
<<<<<<< HEAD
=======
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyLoading>(
      create: (context) => MyLoading(),
      child: Consumer<MyLoading>(
        builder: (context, MyLoading myLoading, child) {
          SystemChrome.setSystemUIOverlayStyle(
<<<<<<< HEAD
            myLoading.isDark
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark,
=======
            myLoading.isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
          );
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return ScrollConfiguration(
                behavior: MyBehavior(),
                child: child!,
              );
            },
            translations: LanguagesKeys(),
            locale: Locale(selectedLanguage),
            fallbackLocale: const Locale(byDefaultLanguage),
<<<<<<< HEAD
            theme: myLoading.isDark ? darkTheme() : lightTheme(),
=======
            theme: myLoading.isDark ? darkTheme(context) : lightTheme(context),
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
            home: MyBubblyApp(),
          );
        },
      ),
    );
  }
}

class MyBubblyApp extends StatefulWidget {
  @override
  _MyBubblyAppState createState() => _MyBubblyAppState();
}

class _MyBubblyAppState extends State<MyBubblyApp> {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  SessionManager _sessionManager = SessionManager();
<<<<<<< HEAD
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
=======
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703

  @override
  void initState() {
    consentForm();
    _getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, MyLoading myLoading, child) => Scaffold(
        body: Stack(
          children: [
            Center(
              child: Image(
                width: 225,
<<<<<<< HEAD
                image: AssetImage(myLoading.isDark
                    ? icLogoHorizontal
                    : icLogoHorizontalLight),
=======
                image: AssetImage(myLoading.isDark ? icLogoHorizontal : icLogoHorizontalLight),
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Text(
                  companyName.toUpperCase(),
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: FontRes.fNSfUiLight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void consentForm() async {
    AdsService.requestConsentInfoUpdate();
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        _saveTokenUpdate();
      },
    );
  }

  void _saveTokenUpdate() async {
    flutterLocalNotificationsPlugin
<<<<<<< HEAD
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
=======
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
        ?.requestPermissions();

    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'bubbly', // id
        'Notification', // title
        playSound: true,
        enableLights: true,
        enableVibration: true,
        importance: Importance.max);

    FirebaseMessaging.onMessage.listen((message) {
<<<<<<< HEAD
      var initializationSettingsAndroid =
          const AndroidInitializationSettings('@mipmap/ic_launcher');

      var initializationSettingsIOS = const DarwinInitializationSettings();

      var initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);
=======
      var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');

      var initializationSettingsIOS = const DarwinInitializationSettings();

      var initializationSettings =
          InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703

      flutterLocalNotificationsPlugin.initialize(initializationSettings);
      RemoteNotification? notification = message.notification;
      if (message.data['NotificationID'] == ChatScreen.notificationID) {
        return;
      }
      flutterLocalNotificationsPlugin.show(
        1,
        notification?.title,
        notification?.body,
        NotificationDetails(
<<<<<<< HEAD
          iOS: const DarwinNotificationDetails(
              presentSound: true, presentAlert: true, presentBadge: true),
=======
          iOS: const DarwinNotificationDetails(presentSound: true, presentAlert: true, presentBadge: true),
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
          ),
        ),
      );
    });

    await flutterLocalNotificationsPlugin
<<<<<<< HEAD
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
=======
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
        ?.createNotificationChannel(channel);
  }

  void _getUserData() async {
    String? token = await firebaseMessaging.getToken();

    await _sessionManager.initPref();

    _sessionManager.saveString(KeyRes.deviceToken, token);

<<<<<<< HEAD
    if (_sessionManager.getUser() != null &&
        _sessionManager.getUser()!.data != null) {
=======
    if (_sessionManager.getUser() != null && _sessionManager.getUser()!.data != null) {
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
      SessionManager.userId = _sessionManager.getUser()!.data!.userId ?? -1;
      SessionManager.accessToken = _sessionManager.getUser()?.data?.token ?? '';
    }
    await ApiService().fetchSettingsData();

<<<<<<< HEAD
    Provider.of<MyLoading>(context, listen: false)
        .setUser(_sessionManager.getUser());
    !ConstRes.isDialog
        ? SizedBox()
        : Provider.of<MyLoading>(context, listen: false)
            .setIsHomeDialogOpen(true);
    Provider.of<MyLoading>(context, listen: false).setSelectedItem(0);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
        (route) => false);
=======
    Provider.of<MyLoading>(context, listen: false).setUser(_sessionManager.getUser());
    !ConstRes.isDialog ? SizedBox() : Provider.of<MyLoading>(context, listen: false).setIsHomeDialogOpen(true);
    Provider.of<MyLoading>(context, listen: false).setSelectedItem(0);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainScreen()), (route) => false);
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
  }
}

// Overscroll color remove
class MyBehavior extends ScrollBehavior {
  @override
<<<<<<< HEAD
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
=======
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
    return child;
  }
}
