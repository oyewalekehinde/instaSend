import 'package:flutter/material.dart';
import 'package:insta_send/app/data/models/create_account_model.dart';
import 'package:insta_send/core/utils/size_config.dart';

class HomeScreen extends StatelessWidget {
  final CreateAccountModel userModel;
  HomeScreen(this.userModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "Welcome ${userModel.firstName}, ${userModel.lastName}",
            style: TextStyle(
                fontSize: SizeConfig.textSizeMultiplier * 7,
                fontWeight: FontWeight.w400),
          ),
          Text(
            "\nEmail: ${userModel.emailAddress}",
            style: TextStyle(
                fontSize: SizeConfig.textSizeMultiplier * 5,
                fontWeight: FontWeight.w400),
          ),
          Text(
            "\nPhone Number: ${userModel.phoneNumber}",
            style: TextStyle(
                fontSize: SizeConfig.textSizeMultiplier * 5,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
