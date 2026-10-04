// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicProfilePage extends StatelessWidget {
  const BasicProfilePage({
    super.key,
    required this.size,
    required this.sizeAlign,
    required this.sizeTX,
    required this.sizePH,
  });

  final Size size;
  final double sizeAlign;
  final double sizeTX;
  final double sizePH;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 900),
                    child: Center(
                      child: Stack(
                        children: [],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}