import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/network/cache/cache_helper.dart';
import 'package:sandra_app/screens/components/default_button.dart';
import 'package:sandra_app/screens/home/home_component/home_component.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/home/home_cubit/states.dart';
import 'package:sandra_app/screens/layout/cubit/cubit.dart';
import 'package:sandra_app/screens/layout/cubit/states.dart';
import 'package:sandra_app/screens/layout/layout_screen.dart';
import 'package:sandra_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:sandra_app/screens/product_detail/product_detail_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'component/compoenet.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
class SeeAllScreen extends StatefulWidget {
   // String? id;
   // String? brandId;
   // SeeAllScreen({this.id,this.brandId});
  @override
  _SeeAllScreenState createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // endDrawer:  buildEndDrawer(),
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: buildSearchCardInSeeAllScreen(context),
      body:  BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder: (context,state){
          return ConditionalBuilder(
            condition: state is! ProductsLoadingState,
            builder: (context)=> ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w,),
                  height: 7.h,
                  color: HexColor('#212224'),
                  child: Row(
                    children: [
                      Image.asset('assets/images/Group 202.png'),
                      SizedBox(width: 4.w,),
                      Image.asset('assets/images/Group 203.png'),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.9,
                  child:(HomeCubit.get(context).products.isNotEmpty)? GridView.count(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 2.5.w,
                      crossAxisSpacing: 2.h,
                      childAspectRatio: 1 / 1.60,
                      children: List.generate(
                          HomeCubit.get(context).products.length,
                              (index) =>
                              InkWell(
                                onTap: (){
                                 //  CacheHelper.saveData(
                                 //      key: 'productId',
                                 //      value: HomeCubit.get(context).products[index]['id'].toString());
                                 // final String productId = await CacheHelper.getData(key: 'productId');
                                 //  print('productId=========================================${productId}');

                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context)=>ProductDetailsScreen(
                                          // id: productId
                                      )));
                                  //HomeCubit.get(context).products[index]['id'].toString()
                                  HomeCubit.get(context).getProductDetails(id:  HomeCubit.get(context).products[index]['id'].toString(),);

                                },
                                child: Container(
                                  padding: EdgeInsets.only(right: 10,left: 10,top: 15),
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
                                        child: customCachedNetworkImage(url: HomeCubit.get(context).products[index]['cover_img'].toString(), context: context, fit: BoxFit.contain),
                                      ),
                                      Text(HomeCubit.get(context).products[index]['name'].toString(),
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
                                            Text('price '+ HomeCubit.get(context).products[index]['price'].toString(),
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
                                            BlocConsumer<AppCubit,AppStates>(
                                              listener:(context,state){},
                                              builder: (context,state){
                                                return InkWell(
                                                  onTap: (){
                                                    if (AppCubit.get(context).isfavourite[HomeCubit.get(context).products[index]['id'].toString()] == true)
                                                    {
                                                      AppCubit.get(context).deletaFromDB(
                                                          id: int.parse("${HomeCubit.get(context).products[index]['id'].toString()}"));
                                                    } else {
                                                      AppCubit.get(context)
                                                          .inserttoDatabase(
                                                          productImage: HomeCubit.get(context).products[index]['cover_img'].toString(),
                                                          productId: HomeCubit.get(context).products[index]['id'].toString(),
                                                          productPrice: HomeCubit.get(context).products[index]['price'].toString(),
                                                          productName: HomeCubit.get(context).products[index]['name'].toString());
                                                    }},
                                                  child:
                                                  (AppCubit.get(context).isfavourite[HomeCubit.get(context).products[index]['id'].toString()] ==true) ?
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
                                      SizedBox(height: 1.h,),
                                    ],
                                  ),
                                ),
                              ),
                      )
                  ) :Column(
                    children: [
                      SizedBox(height: 50,),
                      Container(
                          width: 350,
                          height: 350,
                          child: Image.asset('assets/images/Vector.png',fit: BoxFit.contain,)),
                      SizedBox(height: 10,),
                      Text(LocaleKeys.No_Products_Here.tr(),
                      style: TextStyle(
                        color: HexColor('E3319D'),
                        fontSize: 15,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold
                      ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            fallback:(context)=>  Center(
              child: CircularProgressIndicator(
                color: HexColor('ffcdd2'),
              ),
            ),
            // child: ,
          );
        },

      ),
    );
  }
}

