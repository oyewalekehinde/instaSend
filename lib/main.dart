import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_send/core/utils/size_config.dart';

import 'app/presentations/screen/sign_in/create_account.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig()..init(constraints);
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CreateAccountScreen(),
      );
    });
  }
}
