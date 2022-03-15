// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/layout/cubit/cubit.dart';
import 'package:sandra_app/screens/layout/cubit/states.dart';
import 'package:sandra_app/screens/product_detail/product_detail_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildSearchCardInHomeScreen() => Container(
      height: 10.h,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            color: HexColor('#727C8E').withOpacity(0.2),
            borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        // height: 6.h,
        // width: 346,
        child: Row(
          children: [
            Image.asset('assets/images/Search.png'),
            SizedBox(
              width: 2.w,
            ),
            Text(
              LocaleKeys.Search.tr(),
              style: TextStyle(
                  color: HexColor('#515C6F').withOpacity(0.3),
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  fontFamily: 'OpenSans'),
            )
          ],
        ),
      ),
    );

Widget buildCategoriesItems(
        {required String pathImage, required String title, context}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      // height: 115,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 10.h,
                  width: 18.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // color: Colors.red
                  ),
                  child: customCachedNetworkImage(
                      url: pathImage, context: context, fit: BoxFit.contain)),
              Text(
                title,
                style: TextStyle(
                    color: HexColor('#515C6F'),
                    fontSize: 15,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );

Widget buildBrandsItem(
        {required String pathImage, required String title, context}) =>
    Container(
      width: 120,
      child: Stack(
        children: [
          Container(
            height: 45.h,
            child: customCachedNetworkImage(
                url: pathImage, context: context, fit: BoxFit.cover),
          ),
          Container(
            margin: EdgeInsets.only(top: 18.h),
            decoration: BoxDecoration(
              color: HexColor('ffcdd2'),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  color: HexColor('#FFFFFF'),
                ),
              ),
            ),
          )
        ],
      ),
    );

Widget buildTimeCardItem({
  required String timeUnm,
  required String timeOption,
}) =>
    Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          gradient: LinearGradient(
              colors: [HexColor('#FF9000'), HexColor('#FFBE03')])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            timeUnm,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: HexColor('#FFFFFF'),
              fontFamily: 'OpenSans',
              fontSize: 25,
            ),
          ),
          Text(
            timeOption,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: HexColor('#FFFFFF'),
              fontFamily: 'OpenSans',
              fontSize: 14,
            ),
          ),
        ],
      ),
    );

Widget buildNationalDayProductsItem({
  required String image,
  required String name,
  required String id,
  required String price,
  context,
}) =>
    Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
      ),
      width: 45.w,
      decoration: BoxDecoration(
          border: Border.all(color: HexColor('#E7EAF0').withOpacity(0.3)),
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 15, color: HexColor('#E7EAF0'))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 24.h,
            width: 40.w,
            child: customCachedNetworkImage(
                url: image, context: context, fit: BoxFit.contain),
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
            height: 1.4.h,
          ),
          Row(
            children: [
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 13.sp,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                width: 2.w,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SAR 270',
                style: TextStyle(
                    color: HexColor('#4CB8BA'),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp),
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
                  fontSize: 12.sp,
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.double,
                  decorationColor: HexColor('C9C9C9'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              BlocConsumer<AppCubit, AppStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      if (AppCubit.get(context).isfavourite[id.toString()] ==
                          true) {
                        AppCubit.get(context)
                            .deletaFromDB(id: int.parse(id.toString()));
                      } else {
                        AppCubit.get(context).inserttoDatabase(
                            productImage: image.toString(),
                            productId: id.toString(),
                            productPrice: price.toString(),
                            productName: name.toString());
                      }
                    },
                    child: (AppCubit.get(context).isfavourite[id.toString()] ==
                            true)
                        ? Icon(
                            Icons.favorite,
                            color: HexColor("#E3319D"),
                          )
                        : Icon(
                            Icons.favorite_outline,
                            color: HexColor("#E3319D"),
                          ),
                  );
                },
                // child:
              ),
              Spacer(),
              InkWell(
                onTap: () async {
                  var whatsappUrl =
                      "https://api.whatsapp.com/send?phone=+201022952483";
                  await canLaunch(whatsappUrl) != null
                      ? launch(whatsappUrl)
                      : print(
                          "open WhatsApp app link or do a snackbar withnotification that there is no WhatsApp installed");
                },
                child: Container(
                  width: 30.w,
                  height: 4.h,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.green,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/1216841.png',
                        width: 25,
                        height: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        LocaleKeys.Order.tr(),
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'OpenSans',
                            color: HexColor('#FFFFFF')),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

Widget NationalDayProductsItem({
  required String image,
  context,
}) =>
    InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(
                    // id: '',
                    )));
        HomeCubit.get(context).getProductDetails(id: '');
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
        ),
        width: 45.w,
        // height: 90.h,
        decoration: BoxDecoration(
            border: Border.all(color: HexColor('#E7EAF0').withOpacity(0.3)),
            borderRadius: BorderRadius.circular(3),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 15, color: HexColor('#E7EAF0'))]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, height: 24.h, width: 40.w, fit: BoxFit.contain),
            Text(
              'Acer Aspire E',
              style: TextStyle(
                  color: HexColor('#515C6F'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp),
            ),
            SizedBox(
              height: 1.4.h,
            ),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 13.sp,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(
                  width: 2.w,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SAR 270',
                  style: TextStyle(
                      color: HexColor('#4CB8BA'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp),
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
                    fontSize: 12.sp,
                    decoration: TextDecoration.lineThrough,
                    decorationStyle: TextDecorationStyle.double,
                    decorationColor: HexColor('C9C9C9'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.favorite_outline,
                  color: HexColor('E3319D'),
                ),
                Spacer(),
                InkWell(
                  onTap: () async {
                    var whatsappUrl =
                        "https://api.whatsapp.com/send?phone=+201022952483";
                    await canLaunch(whatsappUrl) != null
                        ? launch(whatsappUrl)
                        : print(
                            "open WhatsApp app link or do a snackbar withnotification that there is no WhatsApp installed");
                  },
                  child: Container(
                    width: 30.w,
                    height: 4.h,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    color: Colors.green,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/1216841.png',
                          height: 25,
                          width: 20,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          LocaleKeys.Order.tr(),
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'OpenSans',
                              color: HexColor('#FFFFFF')),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
