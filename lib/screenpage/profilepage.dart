// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tecblog/assets/color.dart';
import 'package:tecblog/assets/home.dart';
import 'package:tecblog/gen/assets.gen.dart';

class BasicProfilePage extends StatelessWidget {
   BasicProfilePage({
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
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
 

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
            key: _key,
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              title: HomeAppBar(size: size,scaffoldkey: _key, ),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 220),
                        child: Center(
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 60),
                                    child: Image(image: Assets.images.profile.provider(),width: 150,height: 150,)
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ImageIcon(Assets.images.medad.provider(),size: 25,color: MyColor.ColorTitle,),
                                        SizedBox(width: 15,),
                                        Text("ویرایش عکس پروفایل",style: TextStyle(color: MyColor.ColorTitle),)
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 50,),
                                  Text("محمد علیزاده",style: TextStyle(fontSize: 20),),
                                  SizedBox(height: 10,),
                                  Text("fuck@gmail.com",style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 30,),
                                  Divader(),
                                  TextButton(onPressed: () {
                                    
                                  }, child: Text("مقالات مورد علاقه من",style: TextStyle(fontSize: 15),)),
                                  Divader(),
                                   TextButton(onPressed: () {
                                    
                                  }, child: Text("پادکست های مورد علاقه من",style: TextStyle(fontSize: 15),)),
                                  Divader(),
                                   TextButton(onPressed: () {
                                    
                                  }, child: Text("خروج از حساب کاربری",style: TextStyle(fontSize: 15),)),
                                ],
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                NavgationBar(size: size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Divader extends StatelessWidget {
  const Divader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
       endIndent: 70,
       indent: 70,
      color: MyColor.DivaderColor,
    );
  }
}