// import 'package:flutter/material.dart';
// import 'package:sandra_app/generated/locale_keys.g.dart';
// import 'package:sizer/sizer.dart';
// import 'package:sandra_app/screens/components/constants.dart';
// import 'constant.dart';
// import 'orderCard.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// // ignore: use_key_in_widget_constructors
// class OrderDetailBody extends StatefulWidget {
//   @override
//   _OrderDetailBodyState createState() => _OrderDetailBodyState();
// }
//
// class _OrderDetailBodyState extends State<OrderDetailBody> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       primary: true,
//       shrinkWrap: true,
//       padding: EdgeInsets.symmetric( horizontal: 3.w),
//       children: [
//         orderCardDetail(),
//         SizedBox(height: 2.h,),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   LocaleKeys.Items.tr(),
//                   style: headingStyle.copyWith(
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//                 SizedBox(width: 2.w,),
//                 Text(
//                   "(2)",
//                   style: headingStyle.copyWith(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: HexColor("#C9C9C9")),
//                 ),
//               ],
//             ),
//             Text(
//               LocaleKeys.Invoice.tr(),
//               style: headingStyle.copyWith(
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.bold,
//                   color: HexColor("#000000").withOpacity(0.5)),
//             ),
//           ],
//         ),
//         SizedBox(height: 2.h,),
//         ListView.separated(
//             primary: false,
//             shrinkWrap: true,
//             itemBuilder: (context, index) => productOrderDetail(),
//             separatorBuilder: (context, index) => spaceH(10),
//             itemCount: 5),
//         SizedBox(height: 3.h,),
//         Text(
//           LocaleKeys.Summary_Details.tr(),
//           style: headingStyle.copyWith(
//               fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//         SizedBox(height: 2.h,),
//         paymentDetail(),
//         SizedBox(height: 2.h,),
//         deliverTime(),
//         spaceH(15),
//         cancelOrderButton(press: () {}, title: LocaleKeys.Order_Cancel.tr()),
//         SizedBox(height: 2.h,),
//         deliverAddress(),
//         SizedBox(height: 2.h,),
//
//       ],
//     );
//   }
// }
