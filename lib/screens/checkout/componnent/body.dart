// import 'package:flutter/material.dart';
// import 'package:sandra_app/screens/checkout/address/address.dart';
// import 'package:sandra_app/screens/components/constants.dart';
//
// import '../payment.dart';
// import '../placeOrder.dart';
// import 'package:sizer/sizer.dart';
//
// // ignore: use_key_in_widget_constructors
// class CheckoutBody extends StatefulWidget {
//   @override
//   _CheckoutBodyState createState() => _CheckoutBodyState();
// }
//
// class _CheckoutBodyState extends State<CheckoutBody>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     _tabController = TabController(length: 3, vsync: this);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       primary: true,
//       shrinkWrap: true,
//       children: [
//         Container(
//             width: MediaQuery.of(context).size.width,
//             height: 7.h,
//             color: Colors.black,
//             child: TabBar(
//               controller: _tabController,
//               unselectedLabelColor: Colors.black,
//               labelColor: Colors.white,
//               indicator: BoxDecoration(
//                 borderRadius: BorderRadius.circular(1),
//                 gradient: LinearGradient(
//                     colors: [HexColor("#FF9000"), HexColor("#FFBE03")]),
//               ),
//               tabs: [
//                 Image.asset(
//                   "assets/images/location.png",
//                 ),
//                 Image.asset(
//                   "assets/images/Giftbox-Hands-Purchase-Buy-Commerce.png",
//
//                 ),
//                 Image.asset(
//                   "assets/images/credit-card.png",
//                   color: HexColor("#E7EAF0"),
//                 ),
//               ],
//             )),
//         // ignore: prefer_const_constructors
//         SizedBox(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: TabBarView(
//                 controller: _tabController,
//                 children: [AddressScreen(), PlaceOrder(), PaymentScreen()])),
//       ],
//     );
//   }
// }
