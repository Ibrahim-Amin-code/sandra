// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sandra_app/screens/cart/componnent/constant.dart';
// import 'package:sandra_app/screens/checkout/checkout_cubit/checkout_cubit.dart';
// import 'package:sandra_app/screens/checkout/checkout_cubit/states.dart';
// import 'package:sandra_app/screens/editAddress/editAddress.dart';
// import 'package:sizer/sizer.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:sandra_app/generated/locale_keys.g.dart';
// import 'package:sandra_app/screens/components/constants.dart';
//
//
// // ignore: use_key_in_widget_constructors
// class UserAddress extends StatefulWidget {
//   @override
//   _UserAddressState createState() => _UserAddressState();
// }
//
// class _UserAddressState extends State<UserAddress> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<CheckoutCubit,CheckoutState>(
//       listener: (context,state){},
//       builder: (context,state){
//         return SingleChildScrollView(
//           child: Column(
//             children: [
//               ListView.separated(
//                   primary: false,
//                   shrinkWrap: true,
//                   physics: const BouncingScrollPhysics(),
//                   itemBuilder: (context, index) =>
//                       addressCard(
//                           addressName: CheckoutCubit.get(context).addressesData[index]['address_name'],
//                           firstName:CheckoutCubit.get(context).addressesData[index]['first_name'],
//                           lastName:CheckoutCubit.get(context).addressesData[index]['last_name'],
//                           stateOrTerritory:CheckoutCubit.get(context).addressesData[index]['state_or_territory'],
//                           suburbOrTown:CheckoutCubit.get(context).addressesData[index]['suburb_or_town'],
//                       ),
//                   separatorBuilder: (context, index) => spaceH(10),
//                   itemCount: CheckoutCubit.get(context).addressesData.length),
//               spaceH(15),
//               placeOrderButton(
//                   context: context, title: LocaleKeys.PROCEED.tr(), press: () {})
//             ],
//           ),
//         );
//       },
//       // child: ,
//     );
//   }
//   addressCard({
//     required String suburbOrTown,
//     required String stateOrTerritory,
//     required String addressName,
//     required String firstName,
//     required String lastName,
// }) {
//     return Container(
//       padding:  EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//                 color: HexColor("#E7EAF0"),
//                 offset: const Offset(0, 3),
//                 spreadRadius: 3,
//                 blurRadius: 3)
//           ]),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 addressName,
//                 style: headingStyle.copyWith(
//                     color: HexColor("#4CB8BA"),
//                     fontSize: 13.sp,
//                     fontWeight: FontWeight.w600),
//               ),
//               Radio(
//                   activeColor: HexColor("#4CB8BA"),
//                   value: "",
//                   groupValue: "",
//                   onChanged: (value) {})
//             ],
//           ),
//           Text(firstName + lastName,
//             style: headingStyle.copyWith(
//                 color: HexColor("#515C6F"),
//                 fontSize: 13.sp,
//                 fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 0.5.h,),
//           Text(
//             suburbOrTown,
//             style: headingStyle.copyWith(
//                 color: HexColor("#515C6F").withOpacity(0.5),
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w400),
//           ),
//           SizedBox(height: 1.h,),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 stateOrTerritory,
//                 style: headingStyle.copyWith(
//                     color: HexColor("#4CB8BA"),
//                     fontSize: 12.sp,
//                     fontWeight: FontWeight.w600),
//               ),
//               Row(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => EditAddressScreen()));
//                     },
//                     child: Container(
//                       width: 15.w,
//                       height: 5.h,
//                       decoration: BoxDecoration(
//                           gradient: LinearGradient(colors: [
//                             HexColor("#FF9000"),
//                             HexColor("#FFBE03")
//                           ]),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: HexColor("#B5994565").withOpacity(0.2),
//                                 offset: const Offset(0, 3),
//                                 spreadRadius: 3,
//                                 blurRadius: 3)
//                           ],
//                           borderRadius: BorderRadius.circular(5)),
//                       child: Center(
//                         child: Text(LocaleKeys.EDIT.tr(),
//                             style: headingStyle.copyWith(
//                               color: HexColor("#272727"),
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                             )),
//                       ),
//                     ),
//                   ),
//                   spaceW(10),
//                   InkWell(
//                     onTap: () {},
//                     child: Container(
//                       width: 18.w,
//                       height: 5.h,
//                       decoration: BoxDecoration(
//                           color: HexColor("#2D2D2D"),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: HexColor("#B5994565").withOpacity(0.1),
//                                 offset: const Offset(0, 3),
//                                 spreadRadius: 3,
//                                 blurRadius: 3)
//                           ],
//                           borderRadius: BorderRadius.circular(5)),
//                       child: Center(
//                         child: Text(LocaleKeys.DELETE.tr(),
//                             style: headingStyle.copyWith(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                             )),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
