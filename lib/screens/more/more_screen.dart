import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/network/cache/cache_helper.dart';
import 'package:sandra_app/screens/Authnitication/auth.dart';
import 'package:sandra_app/screens/all_brands/all_brands_screen.dart';
import 'package:sandra_app/screens/categories/categories_component/component.dart';
import 'package:sandra_app/screens/home/home_component/home_component.dart';
import 'package:sandra_app/screens/layout/layout_screen.dart';
import 'package:sandra_app/screens/menu_screens/about_us/about_us_screen.dart';
import 'package:sandra_app/screens/menu_screens/contact_us/contact_us_screen.dart';
import 'package:sandra_app/screens/menu_screens/deals/deals_screen.dart';
import 'package:sandra_app/screens/menu_screens/language/language_screen.dart';
import 'package:sandra_app/screens/menu_screens/privacy_policy/privacy_screen.dart';
import 'package:sandra_app/screens/menu_screens/profile/edit_profile_screen.dart';
import 'package:sandra_app/screens/menu_screens/resetPassword/resetPass.dart';
import 'package:sandra_app/screens/menu_screens/terms_and_condition/terms_and_condition_screen.dart';
import 'package:sandra_app/screens/menu_screens/wish_list/wish_list_screen.dart';
import 'package:share/share.dart';
import 'more_component/more_component.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class MoreScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         titleSpacing: 5,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.Menu.tr(),style: TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600
              ),),
        leading: Padding(
          padding: const EdgeInsets.only(right: 10,left: 10),
          child: Icon(Icons.arrow_back_ios, color: Colors.white,size: 25,),
        ),
        backgroundColor: HexColor('#ffcdd2'),
       ),



      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AllBrands()));
              },
              child: buildMenuCardItem(title: LocaleKeys.Brands.tr(),imageIcon: 'assets/images/brand.png',)),
          myDivider(height: 1),
          InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LayoutScreen(index: 1)));
                },
              child: buildMenuCardItem(title: LocaleKeys.Offers.tr(),imageIcon: 'assets/images/offers.png')
          ),
          myDivider(height: 1),

          // InkWell(
          //     onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>DealsScreen())),
          //     child: buildMenuCardItem(title: LocaleKeys.Deals.tr(),imageIcon: 'assets/images/Deal.png')),
          // myDivider(height: 1),

          InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>WishListScreen())),
              child: buildMenuCardItem(title: LocaleKeys.Wish_List.tr(),imageIcon: 'assets/images/wishlist.png')),
          myDivider(height: 1),

          InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactUsScreen())),
              child: buildMenuCardItem(title: LocaleKeys.Contact_Us.tr(),imageIcon: 'assets/images/Contact.png')),
          myDivider(height: 1),

          InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUsScreen())),
              child: buildMenuCardItem(title: LocaleKeys.About_Us.tr(),imageIcon: 'assets/images/about.png')),
          myDivider(height: 1),

          InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyScreen())),
              child: buildMenuCardItem(title: LocaleKeys.Privacy_Policy.tr(),imageIcon: 'assets/images/about.png')),
          myDivider(height: 1),
          InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsAndConditionsScreen())),
              child: buildMenuCardItem(title: LocaleKeys.Terms_And_Conditions.tr(),imageIcon: 'assets/images/about.png')),
          myDivider(height: 1),

          InkWell(
              onTap: (){
                Share.share('check out my website https://example.com', subject: 'Look what I made!');
                print('shaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaare');
              },
              child: buildMenuCardItem(title: LocaleKeys.Share.tr(),imageIcon: 'assets/images/share.png')),
          // myDivider(height: 1),
          //
          // InkWell(
          //     onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen())),
          //     child: buildMenuCardItem(title: LocaleKeys.MyProfile.tr(),imageIcon: 'assets/images/Profile.png')),
          // myDivider(height: 1),
          // InkWell(
          //     onTap: ()=> Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) =>
          //             const ResetPasswordScreen())),
          //     child: Padding(
          //       padding: EdgeInsets.only(right: 4.w,left: 3.2.w),
          //       child: Container(
          //         height: 10.h,
          //         // color: Colors.black12,
          //         child: Row(
          //           children: [
          //             Icon(Icons.lock_outlined,color: HexColor('#4CB8BA'),size: 25,),
          //             SizedBox(width: 3.w,),
          //             Text(LocaleKeys.Change_Password.tr(),style: TextStyle(
          //               color: HexColor('#171717'),
          //               fontSize: 13.sp,
          //               fontFamily: 'OpenSans',
          //               fontWeight: FontWeight.w600,
          //             ),),
          //             Spacer(),
          //             CircleAvatar(
          //               child: Icon(Icons.arrow_forward_ios,color: HexColor('#FFBE03'),size: 12,),
          //               radius: 13,
          //               backgroundColor:HexColor('#2D2D2D') ,
          //             ),
          //           ],
          //         ),
          //       ),
          //     )),
          //
          myDivider(height: 1),
          InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> LanguageScreen())),
              child: buildMenuCardItem(title: LocaleKeys.Select_Language.tr(),imageIcon: 'assets/images/language.png')),
          myDivider(height: 1),

          // buildMenuCardItem(title: LocaleKeys.Notifications.tr(),imageIcon: 'assets/images/notification.png'),
          // myDivider(height: 1),

          // InkWell(
          //   onTap: (){
          //     CacheHelper.clearData();
          //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> AuthniticationScreen()), (route) => false);
          //   },
          //   child: Container(
          //     padding: EdgeInsets.only(left: 20,right: 20),
          //     height: 70,
          //     child: Row(
          //       children: [
          //         Image.asset('assets/images/logout.png'),
          //         SizedBox(width: 10,),
          //         Text(LocaleKeys.LOG_OUT.tr(),style: TextStyle(
          //           color: HexColor('#171717'),
          //           fontSize: 15,
          //           fontFamily: 'OpenSans',
          //           fontWeight: FontWeight.w600,
          //         ),),
          //       ],
          //     ),
          //   ),
          // ),
          // myDivider(height: 1),

        ],
      ),
    );
  }
}
