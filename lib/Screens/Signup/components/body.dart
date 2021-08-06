import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_send/Screens/Login/login_screen.dart';
import 'package:insta_send/Screens/Signup/components/background.dart';
import 'package:insta_send/Screens/Signup/components/or_divider.dart';
import 'package:insta_send/Screens/Signup/components/social_icon.dart';
import 'package:insta_send/app/data/models/create_account_model.dart';
import 'package:insta_send/app/presentations/bloc/auth_bloc/auth_bloc.dart';
import 'package:insta_send/app/presentations/screen/home.dart/home.dart';
import 'package:insta_send/components/already_have_an_account_acheck.dart';
import 'package:insta_send/components/rounded_button.dart';
import 'package:insta_send/components/rounded_input_field.dart';
import 'package:insta_send/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_send/constants.dart';
import 'package:insta_send/core/utils/functions.dart';
import 'package:insta_send/core/utils/size_config.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isHidden = true;
  var _firstName = TextEditingController();
  var _lastName = TextEditingController();
  var _email = TextEditingController();
  late String _phone;
  var _password = TextEditingController();
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  double x = 0;
  double y = 0;
  double z = 0;
  final AuthBloc _authBloc = AuthBloc();

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Transform(
            //   transform: Matrix4(
            //     1,
            //     0,
            //     0,
            //     0,
            //     0,
            //     cos(x),
            //     sin(x),
            //     0,
            //     0,
            //     -sin(x),
            //     cos(x),
            //     0,
            //     0,
            //     0,
            //     0,
            //     1,
            //   ),
            //   alignment: FractionalOffset.center,
            //   child: GestureDetector(
            //     onPanUpdate: (details) {
            //       setState(() {
            //         y = y - details.delta.dx / 100;
            //         x = x + details.delta.dy / 100;
            //       });
            //     },
            //     child: Container(
            //       color: Colors.red,
            //       height: 200.0,
            //       width: 200.0,
            //     ),
            //   ),
            // ),
            // Text(
            //   "SIGNUP",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            Form(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 5,
                      vertical: SizeConfig.heightMultiplier * 0.5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight:
                            Radius.circular(SizeConfig.widthMultiplier * 7.5),
                        topLeft:
                            Radius.circular(SizeConfig.widthMultiplier * 7.5),
                      ),
                    ),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   'Create account',
                            //   style: TextStyle(
                            //     color: Colors.blue,
                            //     fontSize: SizeConfig.textSizeMultiplier * 5,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            SizedBox(
                              height: SizeConfig.widthMultiplier * 7.5,
                            ),
                            _buildFirstName(),
                            _buildLastName(),
                            _buildEmail(),
                            _buildPhoneNumber(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Create password",
                                  style: TextStyle(
                                      color: Color(0xFF787676),
                                      letterSpacing: 1.2,
                                      fontSize:
                                          SizeConfig.textSizeMultiplier * 4,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                    height: SizeConfig.heightMultiplier * 0.5),
                                TextFormField(
                                  controller: _password,
                                  obscureText: _isHidden,
                                  autofillHints: [AutofillHints.password],
                                  validator: passwordValidator,
                                  decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                        onTap: _togglePasswordView,
                                        child: Icon(
                                          _isHidden
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                      ),
                                      hintStyle: TextStyle(
                                          fontSize:
                                              SizeConfig.textSizeMultiplier * 4,
                                          fontWeight: FontWeight.w400),
                                      hintText: "Choose a password",
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.heightMultiplier * 1.5,
                                          horizontal:
                                              SizeConfig.widthMultiplier * 3),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              width: 0.5,
                                              color: Colors.black38)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              width: 0.5,
                                              style: BorderStyle.solid)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              width: 0.5,
                                              color: Colors.black38))),
                                ),
                                SizedBox(
                                    height: SizeConfig.heightMultiplier * 2),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 3,
                        ),
                        Column(
                          children: [
                            BlocConsumer<AuthBloc, AuthState>(
                              bloc: _authBloc,
                              listener: (context, state) {
                                print(state);
                                if (state is AuthFailed) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Error"),
                                          content: Text(state.message),
                                          actions: [
                                            TextButton(
                                              child: Text("Ok"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        );
                                      });
                                }
                                if (state is AuthCreated) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreen(state.result)));
                                }
                              },
                              builder: (context, state) {
                                if (state is AuthLoading) {
                                  return CircularProgressIndicator();
                                } else {
                                  return TextButton(
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      if (Form.of(context)!.validate()) {
                                        _authBloc.add(AuthCreate(
                                            CreateAccountModel(
                                                emailAddress: _email.text,
                                                firstName: _firstName.text,
                                                lastName: _lastName.text,
                                                password: _password.text,
                                                phoneNumber: _phone)));
                                      } else {
                                        print("show snackbars");
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      minimumSize: Size(343, 64),
                                      backgroundColor: kPrimaryColor,
                                    ),
                                    child: Text(
                                      'SIGN UP',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            SizeConfig.textSizeMultiplier * 5,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }
                              },
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 3,
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 3,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an Account ? ",
                  style: TextStyle(color: kPrimaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),

            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFirstName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "First Name",
          style: TextStyle(
              color: Color(0xFF787676),
              letterSpacing: 1.2,
              fontSize: SizeConfig.textSizeMultiplier * 4,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 0.5),
        TextFormField(
          controller: _firstName,
          validator: emptyStringValidator,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontSize: SizeConfig.textSizeMultiplier * 4,
                  fontWeight: FontWeight.w400),
              hintText: "first name",
              contentPadding: EdgeInsets.symmetric(
                  vertical: SizeConfig.heightMultiplier * 1.5,
                  horizontal: SizeConfig.widthMultiplier * 3),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 0.5, color: Colors.black38)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 0.5, style: BorderStyle.solid)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 0.5, color: Colors.black38))),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2),
      ],
    );
  }

  Widget _buildLastName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Last Name",
          style: TextStyle(
              color: Color(0xFF787676),
              letterSpacing: 1.2,
              fontSize: SizeConfig.textSizeMultiplier * 4,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 0.5),
        TextFormField(
          controller: _lastName,
          validator: emptyStringValidator,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontSize: SizeConfig.textSizeMultiplier * 4,
                  fontWeight: FontWeight.w400),
              hintText: "last name",
              contentPadding: EdgeInsets.symmetric(
                  vertical: SizeConfig.heightMultiplier * 1.5,
                  horizontal: SizeConfig.widthMultiplier * 3),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 0.5, color: Colors.black38)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 0.5, style: BorderStyle.solid)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 0.5, color: Colors.black38))),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2),
      ],
    );
  }

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(
              color: Color(0xFF787676),
              letterSpacing: 1.2,
              fontSize: SizeConfig.textSizeMultiplier * 4,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 0.5),
        TextFormField(
          controller: _email,
          validator: emailValidator,
          autofillHints: [AutofillHints.email],
          keyboardType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontSize: SizeConfig.textSizeMultiplier * 4,
                  fontWeight: FontWeight.w400),
              hintText: "john@email.com",
              contentPadding: EdgeInsets.symmetric(
                  vertical: SizeConfig.heightMultiplier * 1.5,
                  horizontal: SizeConfig.widthMultiplier * 3),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 0.5, color: Colors.black38)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 0.5, style: BorderStyle.solid)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 0.5, color: Colors.black38))),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2),
      ],
    );
  }

  Widget _buildPhoneNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone Number",
          style: TextStyle(
              color: Color(0xFF787676),
              letterSpacing: 1.2,
              fontSize: SizeConfig.textSizeMultiplier * 4,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 0.5),
        InternationalPhoneNumberInput(
          validator: phoneValidator,
          inputDecoration: InputDecoration(
              hintStyle: TextStyle(
                  fontSize: SizeConfig.textSizeMultiplier * 4,
                  fontWeight: FontWeight.w400),
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 0.5, color: Colors.black38)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 0.5, style: BorderStyle.solid)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 0.5, color: Colors.black38))),
          onInputChanged: (PhoneNumber number) {
            _phone = number.phoneNumber!;
          },
          initialValue: PhoneNumber(dialCode: "+234", isoCode: "NG"),
          selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.DIALOG,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: TextStyle(color: Colors.black),
          keyboardType: TextInputType.numberWithOptions(signed: true),
          inputBorder: OutlineInputBorder(),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2),
      ],
    );
  }
}
