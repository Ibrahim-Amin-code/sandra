import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sizer/sizer.dart';

Widget buildOffersCard({
  required String image,
  context,
})=>  Column(
   crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
        Container(
        height: 150,
      child:
      customCachedNetworkImage(url: image,context: context, fit: BoxFit.cover,),

    ),
  ],
);










Widget buildOffersCardRow({
  required String image,
  required String newPrice,
  required String price,
  context,
})=>  Container(
  height: 22.h,
  decoration: BoxDecoration(
    color:HexColor('FFFFFFFF'),
  ),
  width: 140,
  child: Stack(
    children: [
      Container(
        height: 20.h,
        child: customCachedNetworkImage(url: image, context: context, fit: BoxFit.cover),
      ),
      Container(
        // height: 22.h,
        // width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Text(' ${price} \$',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: HexColor('FF000000'),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    fontSize: 11.sp,
                    color: HexColor('E3319D'),
                  ),
                  ),
                  Spacer(),
                  Text(' ${newPrice} \$',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      fontSize: 11.sp,
                      color: HexColor('E3319D'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);