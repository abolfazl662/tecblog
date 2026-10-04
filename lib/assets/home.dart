import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tecblog/assets/Model/fakedata.dart';
import 'package:tecblog/assets/color.dart';
import 'package:tecblog/assets/string.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:tecblog/screenpage/profilepage.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double sizeAlign = size.width / 16;
    final double sizeTX = size.width / 6;
    final double sizePH = size.width / 30;
    return BasicPage(
      size: size,
      sizeAlign: sizeAlign,
      sizeTX: sizeTX,
      sizePH: sizePH,
    );
  }
}

class HomeAppBar extends StatelessWidget {
  
  final GlobalKey <ScaffoldState> scaffoldkey;

   const HomeAppBar({
    super.key,
    required this.size,
    required this.scaffoldkey
  });

  final Size size;
  
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height / 1000),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
             scaffoldkey.currentState?.openDrawer();
            },
            child: const Icon(Icons.menu, size: 35),
          ),
          Assets.images.splash.image(width: 120, height: 90),
          const Icon(Icons.search_sharp, size: 35),
        ],
      ),
    );
  }
}

class BasicPage extends StatefulWidget {
    const BasicPage({
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
  State<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
final GlobalKey <ScaffoldState> _key =GlobalKey();

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
            drawer: Drawer(
              backgroundColor: Colors.white,
              child: ListView(
                children: [
                  DrawerHeader(child: Image.asset(Assets.images.logos.path)),
                  ListTile(
                    title: Text("پروفایل کاربری"),
                    onTap: () {
                      
                    },
                  ),
                  Divider(
                    color: MyColor.DivaderColor,
                  )
                ],
              )
            ),
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              title: HomeAppBar(size: widget.size,scaffoldkey: _key,),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: Center(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: BanerHomePage(size: widget.size),
                              ),
                              DataOnBanerHomePage(),
                            ],
                          ),
                        ),
                      ),
                      ListHashTagHomePage(sizeAlign: widget.sizeAlign),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 30, 0),
                        child: Row(
                          children: [
                            ImageIcon(
                              Assets.images.medad.provider(),
                              color: MyColor.ColorTitle,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              MyStrings.ViewHotWrite,
                              style: TextStyle(
                                color: MyColor.ColorTitle,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListPostHotWriteHomePage(
                        size: widget.size,
                        sizeAlign: widget.sizeAlign,
                        sizeTX: widget.sizeTX,
                        sizePH: widget.sizePH,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 2, 30, 0),
                        child: Row(
                          children: [
                            ImageIcon(
                              Assets.images.voice.provider(),
                              color: MyColor.ColorTitle,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              MyStrings.ViewHotPodCast,
                              style: TextStyle(color: MyColor.ColorTitle),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 330,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: PosterPodCast.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  right: index == 0 ? widget.sizeAlign : 15,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 180,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            PosterPodCast[index].imageUrl,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        PosterPodCast[index].title,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                NavgationBar(size: widget.size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class NavgationBar extends StatelessWidget {
  const NavgationBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: size.height / 10,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: MyGayColor.BackGrandBottomNavication,
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25),
          child: Container(
            height: size.height / 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              gradient: LinearGradient(
                colors: MyGayColor.BottomNavication,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(),));
                  },
                  icon: ImageIcon(
                    Assets.images.home.provider(),
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    Assets.images.pencle.provider(),
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BasicProfilePage(
                          size: MediaQuery.of(context).size,
                          sizeAlign: (size.width / 16),
                          sizePH: size.width / 30,
                          sizeTX: size.width / 6,
                        ),
                      ),
                    );
                  },
                  icon: ImageIcon(
                    Assets.images.user.provider(),
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListPostHotWriteHomePage extends StatelessWidget {
  const ListPostHotWriteHomePage({
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
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: size.height / 3.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: BlogList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.only(
                  right: index == 0 ? sizeAlign : 15,
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: size.height / 4,
                          height: size.height / 5.3,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                  BlogList[index].imageUrl,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            foregroundDecoration:
                                BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(
                                        20,
                                      ),
                                  gradient: LinearGradient(
                                    colors: MyGayColor
                                        .PostRRGradiendColor,
                                    begin: AlignmentGeometry
                                        .topCenter,
                                    end: AlignmentGeometry
                                        .bottomCenter,
                                  ),
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            0,
                            135,
                            20,
                            0,
                          ),
                          child: Row(
                            children: [
                              Text(
                                BlogList[index].writer,
                                style: TextStyle(
                                  color: MyColor.TEXT,
                                ),
                              ),
                              // ignore: unrelated_type_equality_checks
                              SizedBox(
                                // ignore: unrelated_type_equality_checks
                                width:
                                    // ignore: unrelated_type_equality_checks
                                    index ==
                                        [0, 1, 2, 3, 4, 5, 6]
                                    ? sizeTX
                                    : 75,
                              ),
                              Text(
                                BlogList[index].views,
                                style: TextStyle(
                                  color: MyColor.TEXT,
                                ),
                              ),
                              // ignore: unrelated_type_equality_checks
                              SizedBox(
                                // ignore: unrelated_type_equality_checks
                                width:
                                    // ignore: unrelated_type_equality_checks
                                    index ==
                                        [0, 1, 2, 3, 4, 5, 6]
                                    ? sizePH
                                    : 6,
                              ),
                              Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.height / 4,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          BlogList[index].title,
                          textDirection: TextDirection.rtl,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ListHashTagHomePage extends StatelessWidget {
  const ListHashTagHomePage({
    super.key,
    required this.sizeAlign,
  });

  final double sizeAlign;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //اینجا نباید از width استفاده کرد
      //اگر استفاده کنی یکی میشه
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: TagList.length,
        itemBuilder: (context, index) {
          return Padding(
            // ignore: unrelated_type_equality_checks
            padding: EdgeInsets.only(
              left: index == 0 ? sizeAlign - 25 : 0,
              right: 30,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 0,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: MyGayColor.HashTagGradiendColor,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  30,
                  0,
                  30,
                  0,
                ),
                child: Row(
                  children: [
                    ImageIcon(
                      Assets.images.hashtag.provider(),
                      color: Colors.white,
                      size: 18,
                    ),
                    SizedBox(width: 10),
                    Text(
                      TagList[index].title,
                      style: TextStyle(
                        color: MyColor.ColorLightText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DataOnBanerHomePage extends StatelessWidget {
  const DataOnBanerHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 110,
      right: 0,
      left: 0,
      bottom: 0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,
            children: [
              // ignore: prefer_interpolation_to_compose_strings
              Text(
                FakeDataPoster["writer"] +
                    // ignore: prefer_interpolation_to_compose_strings
                    " - " +
                    FakeDataPoster["data"],
                style: TextStyle(
                  color: MyColor.ColorNamePoster,
                  fontSize: 13,
                ),
              ),
              Row(
                children: [
                  Text(
                    FakeDataPoster["view"],
                    style: TextStyle(
                      color: MyColor.ColorNamePoster,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    CupertinoIcons.eye_fill,
                    size: 20,
                    color: MyColor.ColorNamePoster,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              FakeDataPoster["title"],
              style: TextStyle(
                color: MyColor.ColorLightText,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BanerHomePage extends StatelessWidget {
  const BanerHomePage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 1.17,
      height: size.height / 4.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage(
            FakeDataPoster["image"],
          ),
        ),
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: MyGayColor.PosterCoverGradian,
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
        ),
      ),
    );
  }
}
