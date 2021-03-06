// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/screens/categories/categories_screen.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/home/home_screen.dart';
import 'package:sandra_app/screens/more/more_screen.dart';
import 'package:sandra_app/screens/offers/offers_screen.dart';
import 'package:easy_localization/easy_localization.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LayoutScreen extends StatefulWidget {
  final int index;
  const LayoutScreen({Key? key, required this.index}) : super(key: key);

  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    CategoriesScreen(),
    OffersScreen(),
    HomeScreen(),
    MoreScreen(),
  ];

  getscreen() {
    if (widget.index != null) {
      setState(() {
        currentIndex = widget.index;
      });
    } else {
      setState(() {
        currentIndex = 0;
      });
    }
  }

  @override
  void initState() {
    this.getscreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: HexColor('FFFFFFFF'),
          body: screens[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/categories.png")),
                label: LocaleKeys.Categories.tr(),
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/offers.png")),
                  label: LocaleKeys.Offers.tr()),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/home.png")),
                  label: LocaleKeys.Home.tr()),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/more.png")),
                  label: LocaleKeys.More.tr()),
            ],
            backgroundColor: HexColor('ffcdd2'),
            elevation: 1,
            selectedItemColor: HexColor('FFFFFFFF'),
            unselectedItemColor: HexColor('#8A000000'),
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      },
    );
  }
}
