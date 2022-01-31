import 'package:flutter/material.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'see_all_body.dart';
import 'components/compoenet.dart';

// ignore: use_key_in_widget_constructors
class SeeAllScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F5F6F8"),
      appBar:buildSearchCardInSeeAllScreen(context),
      body: AllproductBody(),
    );
  }
}
