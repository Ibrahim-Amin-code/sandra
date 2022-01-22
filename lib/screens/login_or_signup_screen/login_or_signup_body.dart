import 'package:flutter/material.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/network/cache/cache_helper.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/layout/layout_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginOrSignupBody extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    bool isLogin = false;
    CacheHelper.saveData(key: 'isLogin', value: false);




    return Column(
      children: [
        Image.asset('assets/images/logoo.png',),
        Padding(
          padding: const EdgeInsets.only(top: 110),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LocaleKeys.Welcome_Sandra.tr(),
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,

                ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 1),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: defaultButton(
                    text: LocaleKeys.Login_As_Guest.tr(),
                    width: 250,
                    isUpperCase: true,
                    function: (){
                      CacheHelper.saveData(key: 'isLogin', value: true);
                      Navigator.push(context,  MaterialPageRoute(builder: (context)=> LayoutScreen(index: 0)));
                    },
                    background: HexColor('E3319D'),

                    // background: Colors.transparent,
                    radius: 20,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: defaultButton(
                    text: LocaleKeys.Login_As_Buyer.tr(),
                    width: 250,
                    background: HexColor('E3319D'),
                    isUpperCase: true,
                    function: (){
                      // Navigator.push(context,  MaterialPageRoute(builder: (context)=> SignUpScreen()));
                    },
                    // background: Colors.transparent,
                    radius: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }


  Widget defaultButton({
    required double width,
    double? height,
    Color? background,
    bool isUpperCase = true,
    double radius = 0,
    required VoidCallback function,
    required String text,
  }) =>
      MaterialButton(
        minWidth: width,
        height: height,
        color: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        onPressed: function,
        child: Text(text,style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: "Cairo"
        ),),
      );


}


