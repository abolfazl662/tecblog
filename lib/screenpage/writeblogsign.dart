import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tecblog/assets/color.dart';
import 'package:tecblog/assets/string.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:flutter_validators/flutter_validators.dart';
// ignore: unused_import
import 'package:tecblog/main.dart';
import 'package:tecblog/screenpage/slectcats.dart';

class Writinganarticle extends StatelessWidget {
  const Writinganarticle({super.key});

  @override
  Widget build(BuildContext context) {

    var siZe = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: Assets.images.tecbot.provider(),
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: 30),
            Text.rich(
              TextSpan(text: MyStrings.WriteBlog),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Container(
                        height: siZe.height / 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "لطفا ایمیلت رو وارد کن",
                                style: TextStyle(fontSize: 16),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  50,
                                  30,
                                  50,
                                  60,
                                ),
                                child: TextField(
                                  
                                  onChanged: (value) {
                                    // ignore: prefer_interpolation_to_compose_strings, avoid_print
                                    print(value+"   is email ?  "+ isEmail(value).toString() );
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: "techblog@gmail.com",
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(
                                            context,
                                          ).viewInsets.bottom,
                                        ),
                                        child: Container(
                                          height: siZe.height / 2,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              topRight: Radius.circular(50),
                                            ),
                                          ),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "کد فعال سازی رو وارد کن ",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                        50,
                                                        30,
                                                        50,
                                                        60,
                                                      ),
                                                  child: TextField(
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      hintText: "*****",
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(
                                                      context,
                                                    ).pushReplacement(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            SelectCats(),
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                    "ادامه",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  "ادامه",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              // ignore: sort_child_properties_last
              child: Text(
                "بزن بریم ",
                style: TextStyle(color: MyColor.ColorBackgrand),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
