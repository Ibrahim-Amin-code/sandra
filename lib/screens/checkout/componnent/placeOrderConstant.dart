// import 'package:flutter/material.dart';
// import 'package:sandra_app/generated/locale_keys.g.dart';
// import 'package:sandra_app/screens/components/constants.dart';
// import 'package:sizer/sizer.dart';
//
// import 'package:sandra_app/screens/editAddress/editAddress.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// addressCard(context) {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//               color: HexColor("#E7EAF0"),
//               offset: const Offset(0, 3),
//               spreadRadius: 3,
//               blurRadius: 3)
//         ]),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Shopping Address",
//               style: headingStyle.copyWith(
//                   color: HexColor("#4CB8BA"),
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w700),
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => EditAddressScreen()));
//               },
//               child: Container(
//                   padding:
//                        EdgeInsets.symmetric(vertical: 1.1.h, horizontal: 3.w),
//                   decoration: BoxDecoration(
//                       color: Colors.black,
//                       boxShadow: [
//                         BoxShadow(
//                             offset: const Offset(0, 3),
//                             color: HexColor("#4CB8BA").withOpacity(0.2),
//                             spreadRadius: 3,
//                             blurRadius: 3),
//                       ],
//                       borderRadius: BorderRadius.circular(5)),
//                   child: Center(
//                       child: Text(
//                     LocaleKeys.EDIT.tr(),
//                     style: headingStyle.copyWith(
//                         color: Colors.white,
//                         fontSize: 17,
//                         fontWeight: FontWeight.w500),
//                   ))),
//             ),
//           ],
//         ),
//         Text(
//           "ASHRAf ALMASHHARI",
//           style: headingStyle.copyWith(
//               color: HexColor("#515C6F"),
//               fontSize: 13.sp,
//               fontWeight: FontWeight.w700),
//         ),
//         SizedBox(height: 0.5.h,),
//         Text(
//           "Saudi Arabya",
//           style: headingStyle.copyWith(
//               color: HexColor("#515C6F").withOpacity(0.5),
//               fontSize: 11.sp,
//               fontWeight: FontWeight.w400),
//         ),
//         SizedBox(height: 0.5.h,),
//         Text(
//           "Riyadh",
//           style: headingStyle.copyWith(
//               color: HexColor("#4CB8BA"),
//               fontSize: 12.sp,
//               fontWeight: FontWeight.w600),
//         ),
//       ],
//     ),
//   );
// }
//
// ///////////////////////////////////////////////////////////////////////////////////////
//
// orderItemCard() {
//   return Container(
//       padding:  EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(5),
//           boxShadow: [
//             BoxShadow(
//                 color: HexColor("#E7EAF0"),
//                 offset: const Offset(0, 3),
//                 spreadRadius: 3,
//                 blurRadius: 3)
//           ]),
//       child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//                 // width: 40.w,
//                 height: 12.h,
//                 child: Image.asset(
//
//                   "assets/images/Image 37.png",
//                   fit: BoxFit.contain,
//                   // color: Colors.red,
//                 )),
//               SizedBox(width: 2.w,),
//             Padding(
//               padding:  EdgeInsets.only(top: 1.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "Acer Aspire E",
//                     style: headingStyle.copyWith(
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w600,
//                         color: HexColor("#515C6F")),
//                   ),
//                   Text(
//                     "SAR 550.00",
//                     style: headingStyle.copyWith(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w600,
//                         color: HexColor("#4CB8BA")),
//                   ),
//                   Text(
//                     "Qty: 3",
//                     style: headingStyle.copyWith(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w600,
//                         color: HexColor("#4CB8BA")),
//                   ),
//                 ],
//               ),
//             ),
//           ]));
// }
// //////////////////////////////////////////////////////////////////////////////////////
//
// paymentDetail() {
//   return Container(
//     padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(5),
//       boxShadow: [
//         BoxShadow(
//           color: HexColor("#E7EAF0"),
//           offset: const Offset(0, 3),
//           spreadRadius: 3,
//           blurRadius: 3,
//         )
//       ],
//     ),
//     child: Column(
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               LocaleKeys.Payment_Summary.tr(),
//               style: headingStyle.copyWith(
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w600,
//                   color: HexColor("#333333")),
//             ),
//             InkWell(
//               onTap: () {},
//               child: Text(
//                 LocaleKeys.EDIT.tr(),
//                 style: headingStyle.copyWith(
//                     fontSize: 11.sp,
//                     fontWeight: FontWeight.w600,
//                     color: HexColor("#4CB8BA")),
//               ),
//             ),
//           ],
//         ),
//         spaceH(10),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               LocaleKeys.Order_Total.tr(),
//               style: headingStyle.copyWith(
//                   fontSize: 10.sp,
//                   fontWeight: FontWeight.w600,
//                   color: HexColor("#333333")),
//             ),
//             InkWell(
//               onTap: () {},
//               child: Text(
//                 "SAR 11.00",
//                 style: headingStyle.copyWith(
//                     fontSize: 9.5.sp,
//                     fontWeight: FontWeight.w600,
//                     color: HexColor("#333333")),
//               ),
//             ),
//           ],
//         ),
//         spaceH(10),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               LocaleKeys.COD_Charge.tr(),
//               style: headingStyle.copyWith(
//                   fontSize: 10.sp,
//                   fontWeight: FontWeight.w600,
//                   color: HexColor("#333333")),
//             ),
//             InkWell(
//               onTap: () {},
//               child: Text(
//                 "Free",
//                 style: headingStyle.copyWith(
//                     fontSize: 9.5.sp,
//                     fontWeight: FontWeight.w600,
//                     color: HexColor("#4CB8BA")),
//               ),
//             ),
//           ],
//         ),
//         spaceH(10),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               LocaleKeys.Total_Amount.tr(),
//               style: headingStyle.copyWith(
//                   fontSize: 10.sp,
//                   fontWeight: FontWeight.w700,
//                   color: HexColor("#4CB8BA")),
//             ),
//             InkWell(
//               onTap: () {},
//               child: Text(
//                 "SAR - 599.99",
//                 style: headingStyle.copyWith(
//                     fontSize: 9.5.sp,
//                     fontWeight: FontWeight.w700,
//                     color: HexColor("#4CB8BA")),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
