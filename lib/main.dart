import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    show
        GlobalCupertinoLocalizations,
        GlobalMaterialLocalizations,
        GlobalWidgetsLocalizations;
import 'package:tecblog/assets/color.dart';
import 'package:tecblog/screenpage/writeblogsign.dart';
import 'package:tecblog/splashscreen.dart';

// ignore: unused_import
import 'gen/assets.gen.dart';

final GlobalKey<ScaffoldMessengerState> messengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() {

  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      scaffoldMessengerKey: messengerKey,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('fa')],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
           elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return const Color.fromARGB(255, 0, 0, 0);
                  }
                  return MyColor.ColorLoading;
                }),
                minimumSize: WidgetStateProperty.all(Size(200, 50)),
                shape: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(150),
                    );
                  }
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  );
                }),
                elevation: WidgetStateProperty.all(0),
              ),
      ),
           inputDecorationTheme: InputDecorationThemeData(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
           )
      ),
      home: Writinganarticle()
      
    );
  }
}