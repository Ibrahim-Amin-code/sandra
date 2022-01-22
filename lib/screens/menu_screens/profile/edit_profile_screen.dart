// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sandra_app/generated/locale_keys.g.dart';
// import 'package:sandra_app/screens/categories/categories_component/component.dart';
// import 'package:sandra_app/screens/home/home_component/home_component.dart';
// import 'package:sandra_app/screens/menu_screens/profile/profile_component/profile_component.dart';
//
// import 'get_profile_cubit/cubit.dart';
// import 'get_profile_cubit/states.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:sizer/sizer.dart';
//
// class EditProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => GetProfileCubit()..getProfile(),
//       child: BlocConsumer<GetProfileCubit, GetProfileStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Scaffold(
//             backgroundColor: HexColor('#F5F6F8'),
//             //&& GetProfileCubit.get(context).data['status'] != false state is! GetProfiledLoadingState
//             appBar: PreferredSize(
//                 preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height*0.7),
//                 child: Container(
//                   padding:  EdgeInsets.only(top: 8.h,left: 5.w,bottom: 2.h,right: 5.w),
//                   child: Row(
//                     children: [
//                       InkWell(
//                           onTap: ()=>Navigator.pop(context),
//                           child: Icon(Icons.arrow_back_ios,color: HexColor('#4CB8BA'),size: 25,)),
//                       SizedBox(width: 2.w,),
//                       Text(LocaleKeys.MyProfile.tr(),style: TextStyle(
//                           fontFamily: 'OpenSans',
//                           color: HexColor('#515C6F'),
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.w600
//                       ),),
//
//                     ],
//                   ),)),
//             body: ConditionalBuilder(
//               condition:  state is! GetProfiledLoadingState && GetProfileCubit.get(context).data['status'] != false,
//               fallback: (context) => Center(child: CircularProgressIndicator()),
//               builder: (context) =>ListView(
//                 padding: EdgeInsets.symmetric(horizontal: 5.w),
//                 children: [
//                   Container(
//                     height: 220,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         customCachedNetworkImage(
//                           context: context,
//                           fit: BoxFit.contain,
//                           url: GetProfileCubit.get(context).data['data']['photo'],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           LocaleKeys.Choose_Photo.tr(),
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                             fontFamily: 'OpenSans',
//                             color: HexColor('#333333'),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   myDivider(height: 1),
//                   buildEditProfileCard(
//                     title: GetProfileCubit.get(context).data['data']['name'],
//                     pathImage: 'assets/images/user2.png',
//                   ),
//                   myDivider(height: 1),
//                   buildEditProfileCard(
//                     title: GetProfileCubit.get(context).data['data']['email'],
//                     pathImage: 'assets/images/email.png',
//                   ),
//                   myDivider(height: 1),
//                   buildEditProfileCard(
//                     title: GetProfileCubit.get(context).data['data']['mobile'],
//                     pathImage: 'assets/images/mobile.png',
//                   ),
//                   myDivider(height: 1),
//                   (GetProfileCubit.get(context).data['data']['gender'] != null) ? Container(
//                           padding: EdgeInsets.only(left: 30),
//                           height: 70,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Icon(
//                                 Icons.lock_outlined,
//                                 color: HexColor('#4CB8BA'),
//                               ),
//                               SizedBox(
//                                 width: 30,
//                               ),
//                               Text(
//                                 'Gender -  ' + GetProfileCubit.get(context).data['data']['gender'],
//                                 style: TextStyle(
//                                   color: HexColor('#333333'),
//                                   fontFamily: 'OpenSans',
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       : Container(),
//                   myDivider(height: 1),
//                   (GetProfileCubit.get(context).data['data']['dateOfBirth'] != null) ? buildEditProfileCard(
//                           title: GetProfileCubit.get(context).data['data']['dateOfBirth'],
//                           pathImage: 'assets/images/calendar.png',
//                         )
//                       : Container(),
//                   myDivider(height: 1),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   InkWell(
//                     onTap: () =>
//                         buildEditProfileBottomSheet(
//                           context: context,
//                           name: GetProfileCubit.get(context).data['data']['name'],
//                           mobile:GetProfileCubit.get(context).data['data']['mobile'],
//                         ),
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 100),
//                       height: 45,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(3),
//                           gradient: LinearGradient(colors: [
//                             HexColor('#FF9000'),
//                             HexColor('#FFBE03')
//                           ])),
//                       child: Center(
//                         child: Text(
//                           LocaleKeys.Next.tr(),
//                           style: TextStyle(
//                             color: HexColor('#272727'),
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16,
//                             fontFamily: 'OpenSans',
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
