// import 'package:flutter/material.dart';
// import 'package:sandra_app/network/cache/cache_helper.dart';
// import 'package:sandra_app/screens/components/constants.dart';
// import 'package:sandra_app/screens/layout/layout_screen.dart';
// import 'body.dart';
// import 'package:sizer/sizer.dart';
//
// class AuthniticationScreen extends StatefulWidget {
//
//   static  String token =  '';
//
//
//   const AuthniticationScreen({Key? key}) : super(key: key);
//
//   @override
//   _AuthniticationScreenState createState() => _AuthniticationScreenState();
// }
//
// class _AuthniticationScreenState extends State<AuthniticationScreen> {
//
//   bool isLogin = false;
//
//   getScreen()async{
//     // setState(() {
//     AuthniticationScreen.token = await CacheHelper.getData(key: 'token') ?? "";
//     // });
//     if( AuthniticationScreen.token != ""){
//       setState(() {
//         print(AuthniticationScreen.token);
//         isLogin = true;
//       });
//     } else{
//       setState(() {
//         print(AuthniticationScreen.token);
//         isLogin = false;
//       });
//     }
//   }
//   @override
//   void initState() {
//     this.getScreen();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if(isLogin)
//      {
//        print(AuthniticationScreen.token);
//        return LayoutScreen(index: 0);
//      }else{
//       print(AuthniticationScreen.token);
//       return Authniticate();
//     }
//   }
// }
// class Authniticate extends StatelessWidget {
//   const Authniticate({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 5.h),
//       decoration: BoxDecoration(
//         // gradient: LinearGradient(
//         //     colors: [HexColor("#40A2A6"), HexColor("#4CB8BA")]),
//         color: HexColor('#ffcdd2')
//       ),
//       // ignore: prefer_const_constructors
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: const AuthniticationBody(),
//       ),
//     );
//   }
// }
