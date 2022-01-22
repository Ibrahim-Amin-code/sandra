import 'package:flutter/material.dart';
import 'package:sandra_app/screens/components/constants.dart';

import 'login_or_signup_body.dart';

class LoginOrSignupScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#ffcdd2'),
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      backgroundColor: HexColor('ffcdd2'),
      body: LoginOrSignupBody(),
    );
  }
}
