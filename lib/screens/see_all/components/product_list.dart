// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/layout/cubit/cubit.dart';
import 'package:sandra_app/screens/layout/cubit/states.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: use_key_in_widget_constructors
class ProductListItem extends StatefulWidget {
  final String image;
  final String id;
  final String name;
  final String price;

  ProductListItem(
      {Key? key,
      required this.image,
      required this.id,
      required this.name,
      required this.price})
      : super(key: key);

  _ProductListItemState createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.5.h),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 35.w,
              height: 17.h,
              child: customCachedNetworkImage(
                  url: widget.image, context: context, fit: BoxFit.contain)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: headingStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: HexColor("#515C6F")),
              ),
              spaceH(1.h),
              Row(
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
                      color: HexColor("#FFBE03"),
                      size: 10,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "( 4.5 )",
                    style: headingStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: HexColor("#C9C9C9")),
                  ),
                ],
              ),
              spaceH(1.5.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${LocaleKeys.Price.tr()}:  ' + widget.price + ' \$ ',
                    style: headingStyle.copyWith(
                        color: HexColor("#4CB8BA"),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              spaceH(1.5.h),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      var whatsappUrl =
                          "https://api.whatsapp.com/send?phone=+201150769418";
                      await canLaunch(whatsappUrl) != null
                          ? launch(whatsappUrl)
                          : print(
                              "open WhatsApp app link or do a snackbar withnotification that there is no WhatsApp installed");
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      padding: EdgeInsets.symmetric(horizontal: 10),
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
                  SizedBox(
                    width: 22.w,
                  ),
                  BlocConsumer<AppCubit, AppStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          if (AppCubit.get(context)
                                  .isfavourite[widget.id.toString()] ==
                              true) {
                            AppCubit.get(context).deletaFromDB(
                                id: int.parse("${widget.id.toString()}"));
                          } else {
                            AppCubit.get(context).inserttoDatabase(
                                productImage: widget.image.toString(),
                                productId: widget.id.toString(),
                                productPrice: widget.price.toString(),
                                productName: widget.name.toString());
                          }
                        },
                        child: (AppCubit.get(context)
                                    .isfavourite[widget.id.toString()] ==
                                true)
                            ? Icon(
                                Icons.favorite,
                                color: HexColor("#E3319D"),
                                size: 25,
                              )
                            : Icon(
                                Icons.favorite_outline,
                                color: HexColor("#E3319D"),
                                size: 25,
                              ),
                      );
                    },
                    // child:
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
