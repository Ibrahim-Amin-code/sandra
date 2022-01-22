// import 'package:flutter/material.dart';
// import 'package:sandra_app/screens/my_orders/orderDetail/componnent/constant.dart';
// import 'package:sizer/sizer.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:sandra_app/generated/locale_keys.g.dart';
// import 'package:sandra_app/screens/components/constants.dart';
//
// import 'componnent/placeOrderConstant.dart';
//
// // ignore: use_key_in_widget_constructors
// class PlaceOrder extends StatefulWidget {
//   @override
//   _PlaceOrderState createState() => _PlaceOrderState();
// }
//
// class _PlaceOrderState extends State<PlaceOrder> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:  EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             addressCard(context),
//             spaceH(15),
//             Text(
//               LocaleKeys.Your_Orders.tr() + '(10)',
//               style: headingStyle.copyWith(
//                   color: Colors.black,
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.bold),
//             ),
//             spaceH(15),
//             ListView.separated(
//                 primary: false,
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) => orderItemCard(),
//                 separatorBuilder: (context, index) => spaceH(10),
//                 itemCount: 5),
//             spaceH(15),
//             paymentDetail(),
//             spaceH(15),
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: deliverTime(),
//             ),
//             spaceH(15),
//             cancelOrderButton(title: "ORDER NOW", press: () {}),
//             SizedBox(height: 10,)
//           ],
//         ),
//       ),
//     );
//   }
// }
