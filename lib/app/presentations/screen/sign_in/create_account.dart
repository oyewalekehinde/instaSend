import 'package:flutter/material.dart';
import 'package:insta_send/app/data/models/create_account_model.dart';
import 'package:insta_send/app/presentations/bloc/auth_bloc/auth_bloc.dart';
import 'package:insta_send/app/presentations/screen/sign_in/login.dart';
import 'package:insta_send/core/utils/size_config.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
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

  final AuthBloc _authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                        'Create account',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: SizeConfig.textSizeMultiplier * 5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                                hintText: "Choose a password",
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
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3,
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => TokenScreen()));
                          _authBloc.add(AuthCreate(CreateAccountModel(
                              emailAddress: _email.text,
                              firstName: _firstName.text,
                              lastName: _lastName.text,
                              password: _password.text,
                              phoneNumber: _phone)));
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          minimumSize: Size(343, 64),
                          backgroundColor: Color(0xFF43A3FB),
                        ),
                        child: Text(
                          'Create account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.textSizeMultiplier * 5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 3,
                      ),
                      // Divider(
                      //   height: 5,
                      //   thickness: 3,
                      // ),
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
                          Text('Already have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: Text('Log In'),
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
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38, width: 0.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextFormField(
            controller: _firstName,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontSize: SizeConfig.textSizeMultiplier * 4,
                  fontWeight: FontWeight.w400),
              hintText: "first name",
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
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38, width: 0.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextFormField(
            controller: _lastName,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontSize: SizeConfig.textSizeMultiplier * 4,
                  fontWeight: FontWeight.w400),
              hintText: "last name",
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
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38, width: 0.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: InternationalPhoneNumberInput(
            inputDecoration: InputDecoration(
              hintStyle: TextStyle(
                  fontSize: SizeConfig.textSizeMultiplier * 4,
                  fontWeight: FontWeight.w400),
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(style: BorderStyle.none, color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(style: BorderStyle.none, color: Colors.white),
              ),
            ),
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
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2),
      ],
    );
  }
}
