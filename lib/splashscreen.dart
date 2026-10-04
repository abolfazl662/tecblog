import 'package:flutter/material.dart';
import 'package:tecblog/assets/home.dart';
import 'package:tecblog/gen/assets.gen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    // Clear image cache to force reloading updated asset
    imageCache.clear();
    imageCache.clearLiveImages();
    Future.delayed(Duration(seconds: 4)).then((value) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homescreen(),));
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.splash.image(
              width: 200,
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}