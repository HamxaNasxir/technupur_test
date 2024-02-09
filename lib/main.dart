import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:technupur/view_model/home_provider.dart';
import 'package:technupur/view_model/bottomNavProvider.dart';
import 'package:technupur/views/splash/splash.dart';

import 'network_service/dio_client.dart';
import 'utils/colors.dart';
import 'utils/constants.dart';
import 'views/bottomNavPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Dio dio = Dio();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => BottomNavProvider()),
      ChangeNotifierProvider(create: (context) => HomeProvider()),
      Provider.value(value: ApiService(AppConstants.baseUrl, dio),)
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'technupur',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          dialogBackgroundColor: whiteColor,
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(textTheme).copyWith(
            displaySmall: GoogleFonts.lato(textStyle: textTheme.bodySmall, color: blackColor),
            bodyMedium: GoogleFonts.lato(textStyle: textTheme.bodyMedium, color: blackColor),
            bodyLarge: GoogleFonts.lato(textStyle: textTheme.bodyLarge, color: blackColor),
          ),
          dialogTheme: const DialogTheme(
            backgroundColor: whiteColor,
          ),
          cardColor: whiteColor),
      home: SplashPage(),
    );
  }
}
