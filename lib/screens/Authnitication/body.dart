// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sandra_app/generated/locale_keys.g.dart';
// import 'package:sandra_app/network/cache/cache_helper.dart';
// import 'package:sandra_app/screens/Authnitication/sign_in/signIn_form.dart';
// import 'package:sandra_app/screens/Authnitication/sign_up/signup.dart';
// import 'package:sandra_app/screens/components/constants.dart';
// import 'package:sandra_app/screens/layout/layout_screen.dart';
// import 'package:sizer/sizer.dart';
// import 'package:easy_localization/easy_localization.dart';
//
//
//
// class AuthniticationBody extends StatefulWidget {
//   const AuthniticationBody({Key? key}) : super(key: key);
//
//   @override
//   _AuthniticationBodyState createState() => _AuthniticationBodyState();
// }
//
// class _AuthniticationBodyState extends State<AuthniticationBody> {
//   late PageController pageController;
//   List<String> contText = [
//     "SIGN IN",
//     "SIGN UP",
//   ];
//
//   bool isTapped = true;
//   int currentIndex = 0;
//   List<Widget> screens = [const SignInForm(), const SignupForm()];
//   @override
//   void initState() {
//     pageController = PageController(initialPage: currentIndex);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       primary: true,
//       shrinkWrap: true,
//       // padding: EdgeInsets.symmetric(vertical: 5.h),
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Center(child: Image.asset('assets/images/sandra_logo.png',height: 90,width: double.infinity,fit: BoxFit.cover,),),
//             SizedBox(height: 8.h,),
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(5)),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Center(
//                       child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(
//                         contText.length, (index) => buildDot(index: index)),
//                   )),
//                   const Divider(),
//                   SizedBox(
//                     height: 40.h,
//                     child: PageView.builder(
//                         itemCount: contText.length,
//                         controller: pageController,
//                         onPageChanged: (index) {
//                           setState(() {
//                             currentIndex = index;
//                           });
//                         },
//                         itemBuilder: (context, index) {
//                           return screens[index];
//                         }),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 3.h,),
//             Center(
//               child: Text(
//                 LocaleKeys.Don_have_an_account.tr(),
//                 style: headingStyle.copyWith(
//                   color: Colors.black,
//                   fontSize: 12.sp,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//             SizedBox(height: 2.h,),
//             Center(
//               child: Text(
//                 LocaleKeys.Signup_big_lable.tr(),
//                 style: headingStyle.copyWith(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//             SizedBox(height: 1.h,),
//             const Divider(
//               color: Colors.black,
//             ),
//             SizedBox(height: 2.h,),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 5.w,),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const LayoutScreen(index: 0)));
//                     },
//                     child: Text(
//                       LocaleKeys.Skip.tr(),
//                       style: headingStyle.copyWith(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 19),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         // ignore: deprecated_member_use
//                         context.locale = Locale("en");
//                         CacheHelper.saveData(key: 'lang', value: 'en');
//                       });
//                     },
//                     child: Text(
//                       "English ( us )",
//                       style: headingStyle.copyWith(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 18),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         // ignore: deprecated_member_use
//                         context.locale = Locale("ar");
//                         CacheHelper.saveData(key: 'lang', value: 'ar');
//                       });
//                     },
//                     child: Text(
//                       "عربي",
//                       style: headingStyle.copyWith(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 20),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 1.h,),
//
//           ],
//         ),
//       ],
//     );
//   }
//
//   AnimatedContainer buildDot({required int index}) {
//     return AnimatedContainer(
//       duration: kAnimationDuration,
//       margin: const EdgeInsets.only(right: 5),
//       height: 40,
//       width: currentIndex == index ? 100 : 100,
//       decoration: BoxDecoration(
//           color: currentIndex == index ? HexColor('E3319D') : Colors.white),
//       child: InkWell(
//           onTap: () {
//             pageController.animateToPage(index,
//                 duration: const Duration(microseconds: 500),
//                 curve: Curves.fastOutSlowIn);
//           },
//           child: Center(
//             child: Text(
//               contText[index],
//               style: headingStyle.copyWith(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 12.sp,
//                   color: (currentIndex == index) ? Colors.white : Colors.black),
//             ),
//           )),
//     );
//   }
// }
