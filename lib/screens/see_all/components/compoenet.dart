import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/layout/layout_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../search_class.dart';
import 'package:easy_localization/easy_localization.dart';


PreferredSizeWidget buildSearchCardInSeeAllScreen(context)=> PreferredSize(
  preferredSize: Size(MediaQuery.of(context).size.width, 80),
  child: Container(
    color: HexColor('ffcdd2'),

    // color: HexColor("#F5F6F8"),
    padding: EdgeInsets.only(top: 7.h,bottom: 2.h,left: 3.w,right: 3.w),
    child: Row(
      children: [
        // ignore: prefer_const_constructors
        InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LayoutScreen(index: 2)), (route) => false);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 27,
          ),
        ),
        SizedBox(width: 15,),
        InkWell(
          onTap: (){
            showSearch(context: context, delegate: ProductsSearch());
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 6.h,
            width: 75.w,
            child: Row(
              children: [
                Image.asset('assets/images/Search.png'),
                SizedBox(width: 2.w,),
                Text(LocaleKeys.Search.tr(),style: TextStyle(
                    color: HexColor('#515C6F').withOpacity(0.3),
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    fontFamily: 'OpenSans'
                ),)
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);


Widget buildSeeAllProductsItem({
  required String image,
  required String price,
  required String name,
  required String id,
  required context,

}) => Container(
  padding: EdgeInsets.only(right: 10,left: 10,top: 15),
  // width: 150,
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            blurRadius: 15,
            color: Colors.black12
        )
      ]
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height:17.h,
        // color: ,
        child: customCachedNetworkImage(url: image, context: context, fit: BoxFit.contain),
      ),
      Text(name,
        style: TextStyle(
            color: HexColor('#515C6F'),
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
            fontSize: 14.sp
        ),
      ),
      SizedBox(height: 1.0.h,),
      Row(
        children: [
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 20,
            // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          SizedBox(width: 5,),
          Text('(4.5)',style: TextStyle(
            fontSize: 14,
            color: HexColor('#C9C9C9'),
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
          ),)
        ],
      ),
      SizedBox(height: 0.8.h,),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('price '+price,
              style: TextStyle(
                  color: HexColor('#4CB8BA'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 11.sp
              ),
            ),
            Text('|',
              style: TextStyle(
                color: HexColor('#C9C9C9'),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
                fontSize: 14,

              ),
            ),
            Text('SAR 300',
              style: TextStyle(
                color: HexColor('#C9C9C9'),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
                fontSize: 11.sp,
                decoration:TextDecoration.lineThrough,
                decorationStyle: TextDecorationStyle.double,
                decorationColor: HexColor('C9C9C9'),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 1.2.h,),
      Padding(
        padding: EdgeInsets.only(right: 1.w,left: 1.w),
        child: Row(
          children: [
            InkWell(
                 onTap: (){
                   // HomeCubit.get(context).addToWishList(id: id);
                 },
                child: Icon(Icons.favorite_outline,color:HexColor('E3319D'),)),
            Spacer(),
            InkWell(
              onTap: ()async {
                var whatsappUrl = "https://api.whatsapp.com/send?phone=+201150769418";
                await canLaunch(whatsappUrl) != null
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
      SizedBox(height: 1.h,),
    ],
  ),
);