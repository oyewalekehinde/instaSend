import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_send/app/presentations/screen/Login/login_screen.dart';
import 'package:insta_send/app/presentations/screen/Signup/signup_screen.dart';
import 'package:insta_send/core/components/rounded_button.dart';
import 'package:insta_send/core/utils/constants.dart';
import 'dart:math' as math;

import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.1),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                print("login");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            // Container(
            //   height: 250,
            //   width: 400,
            //   color: Colors.lightGreen,
            //   child: Stack(
            //     children: [
            //       Positioned(
            //         bottom: 50,
            //         left: 120,
            //         child: Transform.rotate(
            //           angle: -148,
            //           child: Container(
            //             height: 150,
            //             width: 80,
            //             color: Colors.red,
            //             child: Image.asset(
            //               "assets/images/1.jpg",
            //               fit: BoxFit.fitHeight,
            //             ),
            //           ),
            //         ),
            //       ),
            //       Positioned(
            //         bottom: 50,
            //         right: 120,
            //         child: Transform.rotate(
            //           angle: 170,
            //           child: Container(
            //             height: 150,
            //             width: 80,
            //             color: Colors.blue,
            //             child: Image.asset("assets/images/4.jpg",
            //                 fit: BoxFit.fitHeight),
            //           ),
            //         ),
            //       ),

            //       SizedBox(
            //         child: Align(
            //           alignment: Alignment.center,
            //           child: Padding(
            //               padding: const EdgeInsets.only(bottom: 10),
            //               child: CarouselSlider(
            //                 options: CarouselOptions(
            //                   height: 160.0,
            //                   viewportFraction: 1,
            //                   autoPlayAnimationDuration:
            //                       Duration(milliseconds: 8000),
            //                   autoPlayCurve: Curves.fastOutSlowIn,
            //                 ),
            //                 items: [
            //                   "assets/images/2.jpg",
            //                   "assets/images/1.jpg",
            //                   "assets/images/1.jpg"
            //                 ].map((i) {
            //                   return Builder(
            //                     builder: (BuildContext context) {
            //                       return GestureDetector(
            //                         onTap: () => print("i tapped it"),
            //                         child: Container(
            //                             //    width: MediaQuery.of(context).size.width,
            //                             margin: EdgeInsets.symmetric(
            //                                 horizontal: 5.0),
            //                             decoration:
            //                                 BoxDecoration(color: Colors.amber),
            //                             child: Image.asset(i,
            //                                 fit: BoxFit.fitHeight)),
            //                       );
            //                     },
            //                   );
            //                 }).toList(),
            //               )

            //               // Container(
            //               //   height: 160,
            //               //   width: 100,
            //               //   color: Colors.yellow,
            //               //   child: Image.asset("assets/images/2.jpg",
            //               //       fit: BoxFit.fitHeight),
            //               // ),
            //               ),
            //         ),
            //       ),
            //       // Positioned(
            //       //   bottom: 55,
            //       //   child: Container(
            //       //     height: 150,
            //       //     width: 80,
            //       //     color: Colors.yellow,
            //       //   ),
            //       // )
            //     ],
            //   ),
            // ),
            // Draggable(
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     child: PageView(
            //       children: [
            //         Container(
            //           height: 150,
            //           width: 80,
            //           color: Colors.blue,
            //           child: Image.asset("assets/images/1.jpg",
            //               fit: BoxFit.fitHeight),
            //         ),
            //         Container(
            //           height: 150,
            //           width: 80,
            //           color: Colors.blue,
            //           child: Image.asset("assets/images/2.jpg",
            //               fit: BoxFit.fitHeight),
            //         ),
            //       ],
            //     ),
            //   ),
            //   feedback: Container(
            //     height: 40,
            //     width: 40,
            //     color: Colors.red,
            //   ),
            // ),
            // Container(
            //   height: 200,
            //   width: 200,
            //   child: Swiper(
            //     itemBuilder: (BuildContext context, int index) {
            //       return new Container(
            //         height: 150,
            //         width: 80,
            //         color: Colors.blue,
            //         child: Image.asset("assets/images/2.jpg",
            //             fit: BoxFit.fitHeight),
            //       );
            //     },
            //     layout: SwiperLayout.TINDER,
            //     viewportFraction: 0,
            //     // customLayoutOption:
            //     //     new CustomLayoutOption(startIndex: -1, stateCount: 3)
            //     //         .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
            //     //   new Offset(-370.0, -40.0),
            //     //   new Offset(0.0, 0.0),
            //     //   new Offset(180.0, -40.0)
            //     // ]),
            //     itemCount: 10,
            //     itemWidth: 300.0,
            //     itemHeight: 400.0,
            //   ),
            // ),
            SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
