import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_send/app/presentations/bloc/auth_bloc/auth_bloc.dart';
import 'package:insta_send/app/presentations/screen/home.dart/home.dart';
import 'package:insta_send/app/presentations/screen/sign_in/create_account.dart';
import 'package:insta_send/core/utils/size_config.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              // leading: IconButton(
              //   icon: Icon(
              //     Icons.arrow_back_ios,
              //     color: Colors.black,
              //     size: 14,
              //   ),
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              // ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 5,
                vertical: SizeConfig.heightMultiplier * 0.5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(SizeConfig.widthMultiplier * 7.5),
                  topLeft: Radius.circular(SizeConfig.widthMultiplier * 7.5),
                ),
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Already a User?\n\nLog in',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: SizeConfig.textSizeMultiplier * 5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _buildEmail(_email),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter password",
                            style: TextStyle(
                                color: Color(0xFF787676),
                                letterSpacing: 1.2,
                                fontSize: SizeConfig.textSizeMultiplier * 4,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 0.5),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black38, width: 0.5),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: _password,
                              obscureText: _isHidden,
                              textCapitalization: TextCapitalization.words,
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
                                    fontSize: SizeConfig.textSizeMultiplier * 4,
                                    fontWeight: FontWeight.w400),
                                hintText: "Enter password",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.heightMultiplier * 1.5,
                                    horizontal: SizeConfig.widthMultiplier * 3),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      style: BorderStyle.none,
                                      color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      style: BorderStyle.none,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 2),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 20,
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
                          // if (state is AuthLoading) {
                          //   return CircularProgressIndicator();
                          // } else {
                          return TextButton(
                            onPressed: () {
                              _authBloc
                                  .add(AuthSignIn(_email.text, _password.text));
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              minimumSize: Size(343, 64),
                              backgroundColor: Color(0xFF43A3FB),
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
                          //   }
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 7,
                      ),

                      // SizedBox(
                      //   height: SizeConfig.heightMultiplier * 3,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     SignInButton.mini(
                      //       buttonType: ButtonType.google,
                      //       onPressed: () {},
                      //     ),
                      //     SignInButton.mini(
                      //       buttonType: ButtonType.facebook,
                      //       onPressed: () {},
                      //     ),
                      //     SignInButton.mini(
                      //       buttonType: ButtonType.twitter,
                      //       onPressed: () {},
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CreateAccountScreen(),
                                  ),
                                  (route) => false);
                            },
                            child: Text('Sign Up'),
                            style: TextButton.styleFrom(
                              minimumSize: Size(44, 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildEmail(TextEditingController _email) {
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
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black38, width: 0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextFormField(
          controller: _email,
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
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(style: BorderStyle.none, color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(style: BorderStyle.none, color: Colors.white),
            ),
          ),
        ),
      ),
      SizedBox(height: SizeConfig.heightMultiplier * 2),
    ],
  );
}
