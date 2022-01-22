
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/screens/Review/review.dart';
import 'package:sandra_app/screens/Review/write%20review/write_review.dart';
import 'package:sandra_app/screens/cart/cart.dart';
import 'package:sandra_app/screens/home/home_component/home_component.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/layout/cubit/cubit.dart';
import 'package:sandra_app/screens/layout/cubit/states.dart';
import 'package:sizer/sizer.dart';
import 'package:sandra_app/screens/menu_screens/wish_list/wish_list_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildAddToCartAndWishListContainer({
  required String title,
  required Color color,
  required Widget widget,
}) => Container(
      height: 5.h,
      width: 50.w,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,

          // gradient: LinearGradient(
          //     colors: [HexColor('#FF9000'), HexColor('#FFBE03')]),
          // HexColor('E3319D')
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans',
              fontSize: 11.sp,
            ),
          ),
          Spacer(),
          widget,
          // Image.asset('assets/images/1216841.png',height: 25,width: 25,color: Colors.green.shade900,),
        ],
      ),
    );

Widget buildAddToWishListRow({context,required String id,}) => Row(
      children: [
        InkWell(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>WriteReviewScreen()),),
          child: Text(
            ' ${LocaleKeys.Write_Review.tr()}',
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.black54,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Spacer(),

        BlocConsumer<AppCubit,AppStates>(
          listener: (context,state){},
          builder: (context,state){
            return InkWell(
                onTap: (){
                  if (AppCubit.get(context).isfavourite[HomeCubit.get(context).productDetailsModel.data.id.toString()] == true)
                  {
                    AppCubit.get(context).deletaFromDB(
                        id: int.parse("${HomeCubit.get(context).productDetailsModel.data.id.toString()}"));
                  } else {
                    AppCubit.get(context)
                        .inserttoDatabase(
                        productImage: HomeCubit.get(context).productDetailsModel.data.coverImg.toString(),
                        productId: HomeCubit.get(context).productDetailsModel.data.id.toString(),
                        productPrice: HomeCubit.get(context).productDetailsModel.data.price.toString(),
                        productName: HomeCubit.get(context).productDetailsModel.data.name.toString());
                  }},

                child:
                (AppCubit.get(context).isfavourite[HomeCubit.get(context).productDetailsModel.data.id.toString()] ==true) ?
                buildAddToCartAndWishListContainer(
                    widget: Container(),
                    //REMOVE
                    title: LocaleKeys.REMOVE.tr(),color: HexColor('E3319D')) :
                buildAddToCartAndWishListContainer(
                    widget: Container(),
                    title:  LocaleKeys.ADD_WISH.tr(),color: HexColor('E3319D'))

            );
          },
          // child: ,
        ),
      ],
    );

Widget buildAddToCartRow({context, required String price,required String id,}) => Row(
      children: [
        // Text(
        //   price,
        //   style: TextStyle(
        //     fontSize: 11.sp,
        //     color: HexColor('#4CB8BA'),
        //     fontFamily: 'OpenSans',
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
        // SizedBox(
        //   width: 3.w,
        // ),
        // Text(
        //   '|',
        //   style: TextStyle(
        //     fontSize: 14,
        //     color: HexColor('#C9C9C9'),
        //     fontFamily: 'OpenSans',
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
        // SizedBox(
        //   width: 2.w,
        // ),
        // Text(
        //   'SAR 300',
        //   style: TextStyle(
        //     color: HexColor('#C9C9C9'),
        //     fontFamily: 'OpenSans',
        //     fontWeight: FontWeight.w600,
        //     fontSize: 11.sp,
        //     decoration: TextDecoration.lineThrough,
        //     decorationStyle: TextDecorationStyle.double,
        //     decorationColor: HexColor('C9C9C9'),
        //   ),
        // ),
        Row(
          children: [
            Text(
              LocaleKeys.Availability.tr() +':',
              style: TextStyle(
                fontSize: 16,
                color: HexColor('#515C6F'),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              HomeCubit.get(context).productDetailsModel.data.quantity.toString(),
              style: TextStyle(
                fontSize: 16,
                color: HexColor('#4CB8BA'),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        Spacer(),
        InkWell(
            onTap: () async {
              var whatsappUrl = "https://api.whatsapp.com/send?phone=+201150769418";
              await canLaunch(whatsappUrl) != null
                  ? launch(whatsappUrl) :
              print("open WhatsApp app link or do a snackbar withnotification that there is no WhatsApp installed");
            },
            child: buildAddToCartAndWishListContainer(
              widget: Image.asset('assets/images/1216841.png',height: 25,width: 25,color: Colors.white,),
              title: LocaleKeys.Order.tr(),
              color: Colors.green
            )),
      ],
    );

Widget buildSeeAllButton() => Container(
      // margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: HexColor('E3319D'),
          // gradient: LinearGradient(
          //     colors: [HexColor('#FF9000'), HexColor('#FFBE03')]),
      ),
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 40.w),
            child: Text(
              LocaleKeys.See_All.tr(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'OpenSans',
                fontSize: 12.sp,
              ),
            ),
          ),
          Spacer(),
          CircleAvatar(
              radius: 13,
              backgroundColor: HexColor('#000000'),
              child: Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: HexColor('#FFBE03'),
                  size: 12,
                ),
              )),
        ],
      ),
    );

// Widget buildRatingBarRow(context) => Row(
//       children: [
//         RatingBar.builder(
//           initialRating: 3,
//           minRating: 1,
//           direction: Axis.horizontal,
//           allowHalfRating: true,
//           itemCount: 5,
//           itemSize: 23,
//           // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//           itemBuilder: (context, _) => Icon(
//             Icons.star,
//             color: Colors.amber,
//           ),
//           onRatingUpdate: (rating) {
//             print(rating);
//           },
//         ),
//         SizedBox(
//           width: 3.w,
//         ),
//         // InkWell(
//         //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewScreen()),),
//         //   child: Text(
//         //     '1 ${LocaleKeys.Review.tr()} ',
//         //     style: TextStyle(
//         //       fontSize: 10.sp,
//         //       color: HexColor('#C9C9C9'),
//         //       fontFamily: 'OpenSans',
//         //       fontWeight: FontWeight.w600,
//         //     ),
//         //   ),
//         // ),
//         // SizedBox(
//         //   width: 1.w,
//         // ),
//         // InkWell(
//         //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>WriteReviewScreen()),),
//         //   child: Text(
//         //     '| ${LocaleKeys.Write_Review.tr()}',
//         //     style: TextStyle(
//         //       fontSize: 10.sp,
//         //       color: HexColor('#C9C9C9'),
//         //       fontFamily: 'OpenSans',
//         //       fontWeight: FontWeight.w600,
//         //     ),
//         //   ),
//         // )
//       ],
//     );
