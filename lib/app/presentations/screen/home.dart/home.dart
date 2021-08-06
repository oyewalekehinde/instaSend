import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:insta_send/app/data/models/create_account_model.dart';
import 'package:insta_send/core/utils/animation/fade_animation.dart';
import 'package:insta_send/core/utils/size_config.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class HomeScreen extends StatefulWidget {
  final CreateAccountModel userModel;
  HomeScreen(this.userModel);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController;

  ///The controller of sliding up panel
  SlidingUpPanelController panelController = SlidingUpPanelController();
  int _current_1 = 0;
  int _current_2 = 0;
  bool widgetVisible = true;
  final imageList = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/4.jpg",
  ];
  final List<Color> colorPanel = [
    Color(0xFF51bd87),
    Color(0xFFc0c738),
    Color(0xFFc738c0)
  ];
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.expand();
      } else if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.anchor();
      } else {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            // onTap: (index) {
            //   setState(() {
            //     _currentIndex = index;
            //   });
            // },
            // currentIndex:
            //     _currentIndex, // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.wallet_giftcard), label: ""),
            ],
          ),
          body: Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
              colors: [
                Color(0xFF050404),
                Color(0xFFFFFFFF),
              ],
              stops: [0.35, 0.6],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            )),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bankly",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.textSizeMultiplier * 10,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 30,
                          ),
                          child: Icon(
                            Icons.qr_code_2_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'What are you looking for?',
                          hintStyle: TextStyle(
                              fontFamily: 'CerebriSans-Medium',
                              color: Color(0xFF9A9A9A),
                              fontSize: SizeConfig.textSizeMultiplier * 4),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 30,
                          ),
                          suffixIcon: Icon(
                            Icons.clear,
                            color: Colors.black,
                            size: 30,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 0.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color(0xFFB3B3B3).withOpacity(0.16),
                                width: 1),
                          ),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                    Container(
                      height: SizeConfig.heightMultiplier * 55,
                      width: SizeConfig.widthMultiplier * 98,
                      // color: Colors.lightGreen,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: SizeConfig.heightMultiplier * 7,
                            left: SizeConfig.widthMultiplier * 10,
                            child: Visibility(
                              visible: widgetVisible,
                              child: Transform.rotate(
                                angle: -148,
                                child: Container(
                                  height: SizeConfig.heightMultiplier * 40,
                                  width: SizeConfig.widthMultiplier * 45,
                                  child: Image.asset(
                                    imageList[_current_1],
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: SizeConfig.heightMultiplier * 7,
                            right: SizeConfig.widthMultiplier * 10,
                            child: Visibility(
                              visible: widgetVisible,
                              child: Transform.rotate(
                                angle: 170,
                                child: Container(
                                  height: SizeConfig.heightMultiplier * 40,
                                  width: SizeConfig.widthMultiplier * 45,
                                  child: Image.asset(imageList[_current_2],
                                      fit: BoxFit.fitHeight),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          Random random = new Random();
                                          int min = 0, max = index + 1;
                                          var num =
                                              min + random.nextInt(max - min);
                                          _current_1 = num;
                                          _current_2 = index;
                                        });
                                      },
                                      height: SizeConfig.heightMultiplier * 45,
                                      viewportFraction: 1,
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 8000),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                    ),
                                    items: [
                                      "assets/images/2.jpg",
                                      "assets/images/4.jpg",
                                      "assets/images/1.jpg"
                                    ].map((i) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return GestureDetector(
                                            onTap: () {
                                              print("i tapped him");
                                              setState(() {
                                                widgetVisible = false;
                                              });
                                              panelController.anchor();
                                            },
                                            child: Container(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      45,
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      55,
                                              //    width: MediaQuery.of(context).size.width,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              child: Image.asset(i,
                                                  fit: BoxFit.fitHeight),
                                            ),
                                          );
                                        },
                                      );
                                    }).toList(),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "All magazines",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.textSizeMultiplier * 5,
                              fontWeight: FontWeight.bold),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 12,
                          child: Icon(Icons.arrow_forward_ios_rounded,
                              color: Colors.white, size: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: SizeConfig.widthMultiplier * 30,
                          height: 100,
                          child: Image.asset(imageList[0], fit: BoxFit.fill),
                        ),
                        Container(
                          width: SizeConfig.widthMultiplier * 30,
                          height: 100,
                          child: Image.asset(imageList[1], fit: BoxFit.fill),
                        ),
                        Container(
                          width: SizeConfig.widthMultiplier * 30,
                          height: 100,
                          child: Image.asset(imageList[2], fit: BoxFit.fill),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SlidingUpPanelWidget(
          child: Container(
            padding: EdgeInsets.only(right: 15, left: 15, bottom: 10),
            decoration: ShapeDecoration(
              color: colorPanel[_current_2],
              shadows: [
                BoxShadow(
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                    color: const Color(0x11000000))
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            widgetVisible = true;
                          });
                          panelController.hide();
                        },
                        icon: Icon(Icons.cancel_outlined))
                  ],
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "0${_current_2 + 1}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.textSizeMultiplier * 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        lorem(paragraphs: 8, words: 200),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.textSizeMultiplier * 4,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          panelStatus: SlidingUpPanelStatus.hidden,
          controlHeight: 50.0,
          anchor: 0.3,
          panelController: panelController,
          onTap: () {
            print(panelController.status);

            // ///Customize the processing logic
            // if (SlidingUpPanelStatus.expanded == panelController.status) {
            //   panelController.collapse();
            // } else {
            //   panelController.expand();
            // }
          },
          dragCancel: () {
            print("cancel");
          },

          //Pass a onTap callback to customize the processing logic when user click control bar.
          //   enableOnTap: true, //Enable the onTap callback for control bar.
        ),
      ],
    );
  }
}
