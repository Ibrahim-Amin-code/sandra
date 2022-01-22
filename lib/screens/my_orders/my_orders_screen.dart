// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sandra_app/generated/locale_keys.g.dart';
// import 'package:sandra_app/screens/home/home_component/home_component.dart';
// import 'package:sizer/sizer.dart';
//
// import 'my_order_component/component.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// class MyOrdersScreen extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: HexColor('#F5F6F8'),
//
//       appBar: PreferredSize(
//           preferredSize: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height*0.4),
//           child: Container(
//             // color: Colors.orange,
//             padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.04,),
//             child: Padding(
//               padding: EdgeInsets.only(top: 4.h,bottom: 3.h),
//               child: Row(
//                 children: [
//                   Icon(Icons.arrow_back_ios,color: HexColor('#4CB8BA'),size: 26,),
//                   SizedBox(width: 3.w,),
//                   Text(LocaleKeys.My_Orders.tr(),style: TextStyle(
//                       fontFamily: 'OpenSans',
//                       color: HexColor('#515C6F'),
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.bold
//                   ),),
//                 ],
//               ),
//             ),)),
//       body: ListView.separated(
//         itemBuilder: (context,index)=>buildMyOrderCardItem(context),
//         separatorBuilder: (context,index)=> SizedBox(height: 3.h,),
//         itemCount: 5,
//         padding: EdgeInsets.symmetric(horizontal: 3.w,),
//         physics: BouncingScrollPhysics(),
//       ),
//     );
//   }
// }
