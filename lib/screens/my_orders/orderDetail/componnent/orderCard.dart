// import 'package:flutter/material.dart';
// import 'package:sandra_app/generated/locale_keys.g.dart';
// import 'package:sandra_app/screens/components/constants.dart';
// import 'package:sizer/sizer.dart';
// import 'package:easy_localization/easy_localization.dart';
//
//
// orderCardDetail() {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5), color: Colors.white),
//     child: Column(
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(LocaleKeys.Order.tr(),
//                 style: headingStyle.copyWith(
//                     fontSize: 13.sp,
//                     fontWeight: FontWeight.w400,
//                     color: HexColor("#333333"))),
//             Text(
//               "# 202000609",
//               style: headingStyle.copyWith(
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w400,
//                   color: HexColor("#4CB8BA")),
//             ),
//           ],
//         ),
//         SizedBox(height: 1.5.h,),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(LocaleKeys.Total_Amount.tr(),
//                 style: headingStyle.copyWith(
//                     fontSize: 13.sp,
//                     fontWeight: FontWeight.w400,
//                     color: HexColor("#333333"))),
//             Text(
//               "SAR 3442.45",
//               style: headingStyle.copyWith(
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w400,
//                   color: HexColor("#4CB8BA")),
//             ),
//           ],
//         ),
//         SizedBox(height: 1.5.h,),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(LocaleKeys.Items.tr(),
//                 style: headingStyle.copyWith(
//                     fontSize: 13.sp,
//                     fontWeight: FontWeight.w400,
//                     color: HexColor("#333333"))),
//             Text(
//               "10",
//               style: headingStyle.copyWith(
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w400,
//                   color: HexColor("#4CB8BA")),
//             ),
//           ],
//         ),
//         SizedBox(height: 1.5.h,),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(LocaleKeys.Order_Status.tr(),
//                 style: headingStyle.copyWith(
//                     fontSize: 13.sp,
//                     fontWeight: FontWeight.w400,
//                     color: HexColor("#333333"))),
//             Text(
//               "Order Placed",
//               style: headingStyle.copyWith(
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w400,
//                   color: HexColor("#4CB8BA")),
//             ),
//           ],
//         ),
//         SizedBox(height: 1.5.h,),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(LocaleKeys.Date.tr(),
//                 style: headingStyle.copyWith(
//                     fontSize: 13.sp,
//                     fontWeight: FontWeight.w400,
//                     color: HexColor("#333333"))),
//             Text(
//               "9 June 2022",
//               style: headingStyle.copyWith(
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w400,
//                   color: HexColor("#4CB8BA")),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// /////////////////////////////////////////////////////////////////////////////////////////////
//
// productOrderDetail() {
//   return Container(
//     padding:  EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
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
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         SizedBox(
//           // width: 100,
//           height: 13.h,
//           child: Image.asset(
//             "assets/images/Image 36.png",
//             fit: BoxFit.contain,
//           ),
//         ),
//         SizedBox(width: 3.w,),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               "Blue Striped toped",
//               style: headingStyle.copyWith(
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w600,
//                   color: HexColor("#333333")),
//             ),
//             SizedBox(height: 1.5.h,),
//             Text(
//               "SAR 399.78",
//               style: headingStyle.copyWith(
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w600,
//                   color: HexColor("#4CB8BA")),
//             ),
//             SizedBox(height: 1.5.h,),
//             Text(
//               "Qty: 3",
//               style: headingStyle.copyWith(
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black.withOpacity(0.5)),
//             ),
//           ],
//         )
//       ],
//     ),
//   );
// }
//
// ///////////////////////////////////////////////////////////////////////////////////////
//
// paymentDetail() {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5), color: Colors.white),
//     child: Column(
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(LocaleKeys.Sub_Total.tr(),
//                 style: headingStyle.copyWith(
//                     fontSize: 10.sp,
//                     fontWeight: FontWeight.w700,
//                     color: HexColor("#333333"))),
//             Text(
//               "SAR 355.00",
//               style: headingStyle.copyWith(
//                   fontSize: 10.sp,
//                   fontWeight: FontWeight.w700,
//                   color: HexColor("#333333")),
//             ),
//           ],
//         ),
//         SizedBox(height: 1.h,),
//
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(LocaleKeys.Total_Tax.tr(),
//                 style: headingStyle.copyWith(
//                     fontSize: 10.sp,
//                     fontWeight: FontWeight.w700,
//                     color: HexColor("#333333"))),
//             Text(
//               "SAR 30.00",
//               style: headingStyle.copyWith(
//                   fontSize: 10.sp,
//                   fontWeight: FontWeight.w700,
//                   color: HexColor("#333333")),
//             ),
//           ],
//         ),
//         SizedBox(height: 1.h,),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(LocaleKeys.Shipping.tr(),
//                 style: headingStyle.copyWith(
//                     fontSize: 10.sp,
//                     fontWeight: FontWeight.w700,
//                     color: HexColor("#333333"))),
//             Text(
//               "SAR 15.00",
//               style: headingStyle.copyWith(
//                   fontSize: 10.sp,
//                   fontWeight: FontWeight.w700,
//                   color: HexColor("#333333")),
//             ),
//           ],
//         ),
//         SizedBox(height: 1.h,),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(LocaleKeys.COD_Charge.tr(),
//                 style: headingStyle.copyWith(
//                     fontSize: 10.sp,
//                     fontWeight: FontWeight.w700,
//                     color: HexColor("#333333"))),
//             Text(
//               "SAR 10.00",
//               style: headingStyle.copyWith(
//                   fontSize: 10.sp,
//                   fontWeight: FontWeight.w700,
//                   color: HexColor("#333333")),
//             ),
//           ],
//         ),
//         SizedBox(height: 1.h,),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(LocaleKeys.Amount_Paid.tr(),
//                 style: headingStyle.copyWith(
//                     fontSize: 10.sp,
//                     fontWeight: FontWeight.w700,
//                     color: HexColor("#4CB8BA"))),
//             Text(
//               "SAR 355.00",
//               style: headingStyle.copyWith(
//                   fontSize: 10.sp,
//                   fontWeight: FontWeight.w700,
//                   color: HexColor("#4CB8BA")),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
