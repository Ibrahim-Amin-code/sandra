import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sizer/sizer.dart';


reviewContent() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              color: HexColor("#0000000A"),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 3))
        ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              itemSize: 15,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              unratedColor: HexColor("#C9C9C9"),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: HexColor("#4CB8BA"),
                size: 10,
              ),
              onRatingUpdate: (rating) {},
            ),
            Text(
              "June 10, 2020",
              style: headingStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: HexColor("#2D2D2D")),
            )
          ],
        ),
        spaceH(15),
        Text(
          "Ashraf Almashhari",
          textAlign: TextAlign.end,
          style: headingStyle.copyWith(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: HexColor("#4CB8BA")),
        ),
        spaceH(10),
        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting",
          textAlign: TextAlign.start,
          style: headingStyle.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: HexColor("#95989A")),
        ),
        spaceH(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "0 People found this review helpful",
              style: headingStyle.copyWith(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: HexColor("#2D2D2D")),
            ),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.thumb_up,
                color: HexColor("#707070"),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
