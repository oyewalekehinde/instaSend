import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_send/app/presentations/bloc/auth_bloc/auth_bloc.dart';
import 'package:insta_send/app/presentations/screen/Signup/signup_screen.dart';
import 'package:insta_send/app/presentations/screen/home/home.dart';
import 'package:insta_send/core/components/rounded_input_field.dart';
import 'package:insta_send/core/components/rounded_password_field.dart';
import 'package:insta_send/core/utils/constants.dart';

import 'package:insta_send/core/utils/functions.dart';
import 'package:insta_send/core/utils/size_config.dart';

import 'background.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isHidden = true;
  var _email = TextEditingController();
  var _password = TextEditingController();
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  final AuthBloc _authBloc = AuthBloc();

  @override
  void dispose() {
    _authBloc.close();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                textfield: TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  validator: emailValidator,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        fontSize: SizeConfig.textSizeMultiplier * 4,
                        fontWeight: FontWeight.w400),
                    hintText: "Your Email",
                    contentPadding: EdgeInsets.symmetric(
                        vertical: SizeConfig.heightMultiplier * 1.5,
                        horizontal: SizeConfig.widthMultiplier * 3),
                    border: InputBorder.none,
                    fillColor: kPrimaryLightColor,
                    filled: true,
                  ),
                ),
              ),
              RoundedPasswordField(
                textfield: TextFormField(
                  controller: _password,
                  obscureText: _isHidden,
                  validator: passwordValidator,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    fillColor: kPrimaryLightColor,
                    filled: true,
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        //
                        _isHidden ? Icons.visibility_off : Icons.visibility,
                        color: kPrimaryColor,
                      ),
                    ),
                    hintStyle: TextStyle(
                        fontSize: SizeConfig.textSizeMultiplier * 4,
                        fontWeight: FontWeight.w400),
                    hintText: "Password",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: SizeConfig.heightMultiplier * 1.5,
                        horizontal: SizeConfig.widthMultiplier * 3),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                            builder: (context) => HomeScreen(state.result)));
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
                          _authBloc
                              .add(AuthSignIn(_email.text, _password.text));
                        } else {
                          print("show snackbar");
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
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.textSizeMultiplier * 5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don’t have an Account ? ",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
