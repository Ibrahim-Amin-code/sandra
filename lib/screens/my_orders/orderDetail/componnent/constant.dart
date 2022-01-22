// import 'package:flutter/material.dart';
// import 'package:sandra_app/generated/locale_keys.g.dart';
// import 'package:sandra_app/screens/components/constants.dart';
// import 'package:sizer/sizer.dart';
// import 'package:easy_localization/easy_localization.dart';
//
//
//
// deliverTime() {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5), color: Colors.white),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Text(LocaleKeys.Delivery_Time.tr(),
//             style: headingStyle.copyWith(
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w700,
//                 color: HexColor("#333333"))),
//         SizedBox(height: 2.h,),
//         Text("3 - 5 working days",
//             style: headingStyle.copyWith(
//                 fontSize: 10.sp,
//                 fontWeight: FontWeight.w700,
//                 color: HexColor("#4CB8BA"))),
//       ],
//     ),
//   );
// }
//
// //////////////////////////////////////////////////////////////////////////////////////////////
//
// cancelOrderButton({required String title, required VoidCallback press}) {
//   return InkWell(
//     onTap: press,
//     child: Container(
//       height: 7.h,
//       padding:  EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           gradient: LinearGradient(
//               colors: [HexColor("#FF9000"), HexColor("#FFBE03")])),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(title,
//               style: headingStyle.copyWith(
//                   fontSize: 11.sp,
//                   fontWeight: FontWeight.w500,
//                   color: HexColor("#333333"))),
//
//           Container(
//             height: 70,
//             // width: 50,
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: LinearGradient(
//                     colors: [HexColor("#FF9000"), HexColor("#FFBE03")])),
//             child: Icon(
//               Icons.keyboard_arrow_right,
//               color: HexColor('#FFBE03'),
//               size: 15.sp,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// //////////////////////////////////////////////////////////////////////////////////////////
//
// deliverAddress() {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5), color: Colors.white),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Text("Shipping Address",
//             style: headingStyle.copyWith(
//                 fontSize: 13.sp,
//                 fontWeight: FontWeight.w700,
//                 color: HexColor("#4CB8BA"))),
//         SizedBox(height: 2.h,),
//         Text("ASHRAF ELMESHHARY",
//             style: headingStyle.copyWith(
//                 fontSize: 13.sp,
//                 fontWeight: FontWeight.w700,
//                 color: HexColor("#515C6F"))),
//         spaceH(10),
//         Text("Saudi Arabia",
//             style: headingStyle.copyWith(
//                 fontSize: 11.sp,
//                 fontWeight: FontWeight.w700,
//                 color: HexColor("#515C6F").withOpacity(0.5))),
//         spaceH(10),
//         Text("Riyadh",
//             style: headingStyle.copyWith(
//                 fontSize: 13.sp,
//                 fontWeight: FontWeight.w700,
//                 color: HexColor("#4CB8BA"))),
//       ],
//     ),
//   );
// }
