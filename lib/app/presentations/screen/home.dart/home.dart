import 'package:flutter/material.dart';
import 'package:insta_send/app/data/models/create_account_model.dart';

class HomeScreen extends StatelessWidget {
  final CreateAccountModel userModel;
  HomeScreen(this.userModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(userModel.toString()),
      ),
    );
  }
}
