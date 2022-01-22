// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:sandra_app/screens/cart/componnent/constant.dart';
// import 'package:sandra_app/screens/my_orders/orderSuccess/orderSuccess.dart';
// import 'package:sizer/sizer.dart';
// import 'package:sandra_app/generated/locale_keys.g.dart';
// import 'package:sandra_app/screens/components/constants.dart';
//
// // ignore: use_key_in_widget_constructors
// class PaymentScreen extends StatefulWidget {
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       primary: true,
//       shrinkWrap: true,
//       padding:  EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
//       children: [
//         paymentTypeSelection(),
//         spaceH(6.h),
//         placeOrderButton(
//             context: context,
//             title: LocaleKeys.CONTINUE_PAYMENT.tr(),
//             press: () => Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => OrderSuccessScreen())))
//       ],
//     );
//   }
//
//   paymentTypeSelection() {
//     return Container(
//       padding:  EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(5),
//         boxShadow: [
//           BoxShadow(
//               offset: const Offset(0, 3),
//               spreadRadius: 3,
//               blurRadius: 3,
//               color: HexColor("#5858581F").withOpacity(0.1))
//         ],
//       ),
//       child: Column(
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.asset("assets/images/Forma 1 copy 11.png"),
//               spaceW(10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     LocaleKeys.Cash.tr(),
//                     style: headingStyle.copyWith(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 11.sp,
//                         color: HexColor("#2D2C2C")),
//                   ),
//                   spaceH(7),
//                   Text(
//                     "SAR 12 will be added on COD",
//                     style: headingStyle.copyWith(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 9.sp,
//                         color: HexColor("#6A737C").withOpacity(0.6)),
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               Radio(value: "value", groupValue: "", onChanged: (value) {})
//             ],
//           ),
//           spaceH(10),
//           Divider(
//             thickness: 1,
//             color: HexColor("#E3E1E1"),
//           ),
//           spaceH(10),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.asset("assets/images/Forma 1 copy 12.png"),
//               spaceW(10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     LocaleKeys.Visa.tr(),
//                     style: headingStyle.copyWith(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 11.sp,
//                         color: HexColor("#2D2C2C")),
//                   ),
//                   spaceH(5),
//                   Text(
//                     ".... ...... ...... 567",
//                     style: headingStyle.copyWith(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 9.sp,
//                         color: HexColor("#6A737C").withOpacity(0.6)),
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               Radio(value: "value", groupValue: "", onChanged: (value) {})
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
