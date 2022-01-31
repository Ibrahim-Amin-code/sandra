import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/layout/cubit/cubit.dart';
import 'package:sandra_app/screens/layout/cubit/states.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';


Widget buildWishListProductsItem({
  required String image,
  required String price,
  required String name,
  required String id,
  required context,
}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 15, color: Colors.black12)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height:18.h,
            child: customCachedNetworkImage(url: image, context: context, fit: BoxFit.contain),
          ),
          Text(
            name,
            style: TextStyle(
                color: HexColor('#515C6F'),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
                fontSize: 13.sp),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                width: 1.4.w,
              ),
              Text(
                '(4.5)',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: HexColor('#C9C9C9'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding:  EdgeInsets.only(right: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'price '+price,
                  style: TextStyle(
                      color: HexColor('#4CB8BA'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
                Text(
                  '|',
                  style: TextStyle(
                    color: HexColor('#C9C9C9'),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'SAR 300',
                  style: TextStyle(
                    color: HexColor('#C9C9C9'),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough,
                    decorationStyle: TextDecorationStyle.double,
                    decorationColor: HexColor('C9C9C9'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(right: 1.w,left: 1.w),
            child: Row(
              children: [
                BlocConsumer<AppCubit,AppStates>(
                  listener:(context,state){},
                  builder: (context,state){
                    return InkWell(
                      onTap: (){
                        if (AppCubit.get(context).isfavourite[id.toString()] == true)
                        {
                          AppCubit.get(context).deletaFromDB(
                              id: int.parse(id.toString()));
                        } else {
                          AppCubit.get(context)
                              .inserttoDatabase(
                              productImage: image.toString(),
                              productId: id.toString(),
                              productPrice: price.toString(),
                              productName: name.toString());
                        }},
                      child:
                      (AppCubit.get(context).isfavourite[id.toString()] ==true) ?
                      Icon(
                        Icons.favorite,
                        color: HexColor("#E3319D"),
                      ) : Icon(
                        Icons.favorite_outline,
                        color: HexColor("#E3319D"),
                      ),
                    );
                  },
                  // child:
                ),
                Spacer(),
                InkWell(
                  onTap: ()async{
                    var whatsappUrl = "https://api.whatsapp.com/send?phone=+201150769418";
                    await canLaunch(
                        whatsappUrl) != null
                        ? launch(whatsappUrl) :
                    print("open WhatsApp app link or do a snackbar withnotification that there is no WhatsApp installed");
                  },
                  child: Container(
                    width: 29.w,
                    height: 4.h,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.green,
                    child: Row(
                      children: [
                        Image.asset('assets/images/1216841.png',height: 25,width: 20,color: Colors.white,),
                        SizedBox(width: 15,),
                        Text(LocaleKeys.Order.tr(),
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'OpenSans',
                              color: HexColor('#FFFFFF')
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 5,),
        ],
      ),
    );
