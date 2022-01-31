
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/network/cache/cache_helper.dart';
import 'package:sandra_app/screens/categories/categories_component/component.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/home/home_cubit/states.dart';
import 'package:sandra_app/screens/splash/splashScreen.dart';
import 'package:sizer/sizer.dart';


class LanguageScreen extends StatefulWidget {


  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}


class _LanguageScreenState extends State<LanguageScreen> {

  // bool value = false;
  // bool value2 = false;
  @override
  Widget build(BuildContext context) {

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
      body: BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder:  (context,state){
          return ListView(
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
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child:  CheckboxListTile(
                          activeColor: HexColor('ffcdd2'),
                    title: Text('اللغة العربية',style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: HexColor('#515C6F'),
                    fontFamily: 'OpenSans',
                  ),),
                  value: HomeCubit.get(context).isLang,
                  onChanged: (value){
                    HomeCubit.get(context).changeAppLang();
                    setState(() {
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (context)=> Splash()), (route) => false);
                      context.locale = Locale("ar");
                      CacheHelper.saveData(key: 'lang', value: "ar");
                    });
                  },
                ),
              ),

              SizedBox(height: 5,),
              myDivider(height: 2),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child:  CheckboxListTile(
                  activeColor: HexColor('ffcdd2'),
                  title: Text('English Language',style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: HexColor('#515C6F'),
                    fontFamily: 'OpenSans',
                  ),),
                  value: HomeCubit.get(context).isLang2,
                  onChanged: (value){
                    HomeCubit.get(context).changeAppLang2();
                    setState(() {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Splash()), (route) => false);
                      context.locale = Locale("en");
                      CacheHelper.saveData(key: 'lang', value: "en");
                    });
                  },
                ),
              ),
              SizedBox(height: 5,),
              myDivider(height: 2),
            ],
          );
        },
        // child: ,
      ),
    );
  }
}
