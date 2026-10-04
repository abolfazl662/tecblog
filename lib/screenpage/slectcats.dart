import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tecblog/assets/Model/fakedata.dart';
import 'package:tecblog/assets/color.dart';
import 'package:tecblog/assets/home.dart';
import 'package:tecblog/assets/string.dart';
import 'package:tecblog/gen/assets.gen.dart';

class SelectCats extends StatefulWidget {
  const SelectCats({super.key});

  @override
  State<SelectCats> createState() => _SelectCatsState();
}

class _SelectCatsState extends State<SelectCats> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var Size = MediaQuery.of(context).size;
    // ignore: unused_local_variable, non_constant_identifier_names
    double SizeAlign = Size.width / 16;
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
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: Assets.images.tecbot.provider(),
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  Text(
                    MyStrings.Welcom,
                    style: TextStyle(color: MyColor.ColorLoading),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(right: 50, left: 50),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "نام و نام خانوادگی",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    MyStrings.SelectFavaritCats,
                    style: TextStyle(color: MyColor.ColorLoading),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GridView.builder(
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: TagList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 20,
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.3,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                               if (!SelectTag.contains(TagList[index])) {
                                 SelectTag.add(TagList[index]);
                               } 
                              });
                            },
                            child: Container(
                              // ignore: sort_child_properties_last
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ImageIcon(
                                      Assets.images.hashtag.provider(),
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      TagList[index].title,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: MyGayColor.HashTagGradiendColor,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  Image(
                    image: Assets.images.arrow.provider(),
                    width: 70,
                    height: 70,
                  ),
                  SizedBox(height: 20),
                  //select tag
                  //select tag
                  SizedBox(
                    height: 110,
                    child: GridView.builder(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: SelectTag.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 20,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.2,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            // ignore: sort_child_properties_last
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        SelectTag.removeAt(index);
                                      });
                                    },
                                    child: Icon(
                                      CupertinoIcons.delete,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    SelectTag[index].title,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(200, 242, 242, 242),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Homescreen()),
                      );
                    },
                    child: Text("ادامه", style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
