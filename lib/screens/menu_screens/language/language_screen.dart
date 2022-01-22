
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/network/cache/cache_helper.dart';
import 'package:sandra_app/screens/categories/categories_component/component.dart';
import 'package:sandra_app/screens/home/home_component/home_component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sandra_app/screens/splash/splashScreen.dart';
import 'package:sizer/sizer.dart';


class LanguageScreen extends StatefulWidget {


  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  @override
  Widget build(BuildContext context) {

    int value = 0;

     return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        titleSpacing: 5,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.Select_Language.tr(),style: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
            fontSize: 17.sp,
            fontWeight: FontWeight.w600
        ),),
        leading: Padding(
          padding: const EdgeInsets.only(right: 10,left: 10),
          child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        ),
        backgroundColor: HexColor('#ffcdd2'),
      ),
      body: ListView(
        children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 20),
              child: Text(LocaleKeys.Preferred_Language.tr(),style: TextStyle(
              fontSize: 19,
              color: HexColor('#515C6F'),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold
          ),),
            ),
            SizedBox(
            height: 50,
          ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 20),
              child: Text(LocaleKeys.your_language.tr(),style: TextStyle(
                fontSize: 19,
                color: HexColor('#515C6F'),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold
          ),),
            ),
            SizedBox(
            height: 20,
            ),
            myDivider(height: 2),

            Padding(
              padding: const EdgeInsets.only(left: 40,top: 15),
              child: RadioListTile(
                value: 1,
                groupValue: value,
                onChanged: (val) {
                  setState((){
                    value = 1;
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Splash()), (route) => false);
                    context.locale = Locale("ar");
                    CacheHelper.saveData(key: 'lang', value: "ar");
                  });
                },
                title: Text('اللغة العربية',style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: HexColor('#515C6F'),
                  fontFamily: 'OpenSans',
                ),),
              ),
            ),
            SizedBox(height: 5,),
            myDivider(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 40,top: 15),
              child: RadioListTile(
                value: 2,
                groupValue: value,
                onChanged: (val) {
                  setState((){
                  value = 2;
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Splash()), (route) => false);
                  context.locale = Locale("en");
                  CacheHelper.saveData(key: 'lang', value: "en");
                  });
                },
                title: Text('English Language',style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: HexColor('#515C6F'),
                  fontFamily: 'OpenSans',
                ),),
              ),
            ),
            SizedBox(height: 5,),
            myDivider(height: 2),
        ],
      ),
    );
  }
}
