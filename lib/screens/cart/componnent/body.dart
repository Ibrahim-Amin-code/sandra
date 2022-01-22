// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sandra_app/screens/checkout/checkout.dart';
// import 'package:sandra_app/screens/components/constants.dart';
// import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
// import 'package:sandra_app/screens/home/home_cubit/states.dart';
// import 'package:sandra_app/screens/menu_screens/profile/profile_component/profile_component.dart';
// import 'constant.dart';
// import 'package:sizer/sizer.dart';
//
//
// // ignore: use_key_in_widget_constructors
// class CartBody extends StatefulWidget {
//   @override
//   _CartBodyState createState() => _CartBodyState();
// }
//
// class _CartBodyState extends State<CartBody> {
//   int count = 1;
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocConsumer<HomeCubit,HomeState>(
//       listener: (context,state){},
//       builder: (context,state){
//         return ListView(
//           primary: true,
//           shrinkWrap: true,
//           padding:  EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
//           children: [
//             ConditionalBuilder(
//                 condition: state is! GetCartLoadingState,
//                 builder: (context) => ListView.separated(
//                     primary: false,
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) =>  cartItemCard(
//                       image: HomeCubit.get(context).cart[index]['cover_img'].toString(),
//                       name: HomeCubit.get(context).cart[index]['name'].toString(),
//                       price: HomeCubit.get(context).cart[index]['price'].toString(),
//                     ),
//                     separatorBuilder: (context, index) => SizedBox(height: 2.h,),
//                     itemCount: HomeCubit.get(context).cart.length),
//                 fallback: (context)=> Center(child: CircularProgressIndicator()),
//             ),
//
//             spaceH(20),
//             optionCard(),
//             spaceH(20),
//             placeOrderButton(
//                 context: context,
//                 title: "PLACE THIS ORDER SR 1100.00",
//                 press: () => Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => CheckoutScren())))
//           ],
//         );
//       },
//       // child: ,
//     );
//   }
//
//   cartItemCard({
//     required String image,
//     required String name,
//     required dynamic price,
// }){
//     return Container(
//       padding:  EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
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
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//               width: 30.w,
//               height: 16.h,
//               child: customCachedNetworkImage(url: image, context: context, fit: BoxFit.contain),),
//           SizedBox(width: 1.w,),
//           Padding(
//             padding: EdgeInsets.only(top: 2.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               // mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   name,
//                   style: headingStyle.copyWith(
//                       fontSize: 13.sp,
//                       fontWeight: FontWeight.w600,
//                       color: HexColor("#515C6F")),
//                 ),
//                 Text(
//                   "SAR  $price",
//                   style: headingStyle.copyWith(
//                       fontSize: 11.sp,
//                       fontWeight: FontWeight.w600,
//                       color: HexColor("#4CB8BA")),
//                 ),
//                 SizedBox(height: 2.h,),
//                 Row(
//                   children: [
//                     InkWell(
//                         onTap: () {
//                           setState(() {
//                             count--;
//                           });
//
//                           if (count == 1) {
//                             setState(() {
//                               count = 1;
//                             });
//                           }
//                         },
//                         child: Container(
//                           width: 8.w,
//                           height: 4.h,
//                           padding: const EdgeInsets.only(bottom: 50),
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle, color: HexColor("#5A5A5A")),
//                           child: Icon(
//                             Icons.minimize,
//                             color: Colors.white,
//                             size: 20,
//                           ),
//                         )),
//                     SizedBox(width: 3.w,),
//                     Text(
//                       "$count",
//                       style: headingStyle.copyWith(
//                           fontSize: 13.sp,
//                           fontWeight: FontWeight.w600,
//                           color: HexColor("#515C6F")),
//                     ),
//                     SizedBox(width: 3.w,),
//                     InkWell(
//                         onTap: () {
//                           setState(() {
//                             count++;
//                           });
//                         },
//                         child: Container(
//                           width: 8.w,
//                           height: 4.h,
//                           // padding: const EdgeInsets.only(bottom: 30),
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle, color: HexColor("#5A5A5A")),
//                           child: Icon(
//                             Icons.add,
//                             color: Colors.white,
//                             size: 20,
//                           ),
//                         )),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
//             child: InkWell(
//               onTap: () {},
//               child: const Icon(Icons.clear, color: Colors.black,),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//
//
//
//   Widget countRow()=> Row(
//     children: [
//       InkWell(
//           onTap: () {
//             setState(() {
//               count--;
//             });
//
//             if (count == 1) {
//               setState(() {
//                 count = 1;
//               });
//             }
//           },
//           child: Container(
//             width: 8.w,
//             height: 4.h,
//             padding: const EdgeInsets.only(bottom: 50),
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle, color: HexColor("#5A5A5A")),
//             child: Icon(
//               Icons.minimize,
//               color: Colors.white,
//               size: 20,
//             ),
//           )),
//       SizedBox(width: 3.w,),
//       Text(
//         "$count",
//         style: headingStyle.copyWith(
//             fontSize: 13.sp,
//             fontWeight: FontWeight.w600,
//             color: HexColor("#515C6F")),
//       ),
//       SizedBox(width: 3.w,),
//       InkWell(
//           onTap: () {
//             setState(() {
//               count++;
//             });
//           },
//           child: Container(
//             width: 8.w,
//             height: 4.h,
//             // padding: const EdgeInsets.only(bottom: 30),
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle, color: HexColor("#5A5A5A")),
//             child: Icon(
//               Icons.add,
//               color: Colors.white,
//               size: 20,
//             ),
//           )),
//     ],
//   );
// }
//
//
