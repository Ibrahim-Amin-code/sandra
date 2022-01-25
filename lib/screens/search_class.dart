import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/models/search_model.dart';
import 'package:sandra_app/network/cache/cache_helper.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/layout/cubit/cubit.dart';
import 'package:sandra_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:sandra_app/screens/product_detail/product_detail_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'components/constants.dart';
import 'layout/cubit/states.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductsSearch extends SearchDelegate {
  ProductsSearch()
      : super(
      searchFieldLabel: LocaleKeys.Search.tr(),
      searchFieldStyle: TextStyle(
           fontSize: 18, fontFamily: 'Cairo'));

  getSearchProduct({required String keyword}) async{
   try{
     String lang = await CacheHelper.getData(key: 'lang')?? 'ar';
     var response = await http.get(Uri.parse("https://findfamily.net/eshop/api/buyers/products/search?name=$keyword&lang=$lang"));
     searchModel = SearchModel.fromJson(json.decode(response.body));
     return searchModel;
   }catch(error){
     print("erooooooooooooor" + error.toString());
   }
 } 
  
  
  
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  SearchModel searchModel = SearchModel();


  @override
  Widget buildResults(BuildContext context) {
    return query.isEmpty
        ? Container()
        : FutureBuilder(
        future: getSearchProduct(keyword: query.toString()),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return GridView.count(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 2.5.w,
                crossAxisSpacing: 2.h,
                childAspectRatio: 1 / 1.60,
                children: List.generate(
                  searchModel.data!.length,
                      (index) =>
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>ProductDetailsScreen(
                                // id: productId
                              )));
                          //HomeCubit.get(context).products[index]['id'].toString()
                          HomeCubit.get(context).getProductDetails(id:  searchModel.data![index].id.toString(),);

                        },
                        child: Container(
                          padding: EdgeInsets.only(right: 10,left: 10,top: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: HexColor('FFFFFFFF'),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 15,
                                    color: HexColor('1F000000')
                                )
                              ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height:17.h,
                                // color: ,
                                child: customCachedNetworkImage(
                                    url: searchModel.data![index].coverImg.toString(), context: context, fit: BoxFit.contain),
                              ),
                              Text(searchModel.data![index].name.toString(),
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
                                      color: HexColor('FFFFC107'),
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
                                    Text('price '+ searchModel.data![index].price.toString(),
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
                                            if (AppCubit.get(context).isfavourite[searchModel.data![index].id.toString()] == true)
                                            {
                                              AppCubit.get(context).deletaFromDB(
                                                  id: int.parse("${searchModel.data![index].id.toString()}"));
                                            } else {
                                              AppCubit.get(context).inserttoDatabase(
                                                  productImage: searchModel.data![index].coverImg.toString(),
                                                  productId: searchModel.data![index].id.toString(),
                                                  productPrice: searchModel.data![index].price.toString(),
                                                  productName: searchModel.data![index].name.toString());
                                            }},
                                          child:
                                          (AppCubit.get(context).isfavourite[searchModel.data![index].id.toString()] ==true) ?
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
                                        color: HexColor('FF4CAF50'),
                                        child: Row(
                                          children: [
                                            Image.asset('assets/images/1216841.png',height: 25,width: 20,color: HexColor('FFFFFFFF'),),
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
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );

          }
        },
    );
  }

//   Widget buildSearchProduct({
//   required String image,
//     required context,
//   required String price,
//   required String name,
//   // required String image,
// })=> Card(
//     child: Row(
//       children: [
//         Container(
//             height: 24.h,
//             width: 40.w,
//             child: customCachedNetworkImage(url: image, context: context, fit: BoxFit.contain)),
//           SizedBox(width: 5,),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               name,
//               style: TextStyle(
//                   color: HexColor('#515C6F'),
//                   fontFamily: 'OpenSans',
//                   fontWeight: FontWeight.w600,
//                   fontSize: 13.sp),
//             ),
//             SizedBox(height: 5,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                  'SAR  ' + price + ' ',
//                   style: TextStyle(
//                       color: HexColor('#4CB8BA'),
//                       fontFamily: 'OpenSans',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 12.sp),
//                 ),
//               ],
//             ),
//
//           ],
//         )
//       ],
//     ),
//   );


  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? Container()
        : FutureBuilder(
      future: getSearchProduct(keyword: query.toString()),
      builder: (context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return GridView.count(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 2.5.w,
              crossAxisSpacing: 2.h,
              childAspectRatio: 1 / 1.60,
              children: List.generate(
                searchModel.data!.length,
                    (index) =>
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>ProductDetailsScreen(
                              // id: productId
                            )));
                        //HomeCubit.get(context).products[index]['id'].toString()
                        HomeCubit.get(context).getProductDetails(id:  searchModel.data![index].id.toString(),);

                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 10,left: 10,top: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: HexColor('FFFFFFFF'),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 15,
                                  color: HexColor('1F000000')
                              )
                            ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height:17.h,
                              // color: ,
                              child: customCachedNetworkImage(
                                  url: searchModel.data![index].coverImg.toString(), context: context, fit: BoxFit.contain),
                            ),
                            Text(searchModel.data![index].name.toString(),
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
                                    color: HexColor('FFFFC107'),
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
                                  Text('price '+ searchModel.data![index].price.toString(),
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
                                          if (AppCubit.get(context).isfavourite[searchModel.data![index].id.toString()] == true)
                                          {
                                            AppCubit.get(context).deletaFromDB(
                                                id: int.parse("${searchModel.data![index].id.toString()}"));
                                          } else {
                                            AppCubit.get(context).inserttoDatabase(
                                                productImage: searchModel.data![index].coverImg.toString(),
                                                productId: searchModel.data![index].id.toString(),
                                                productPrice: searchModel.data![index].price.toString(),
                                                productName: searchModel.data![index].name.toString());
                                          }},
                                        child:
                                        (AppCubit.get(context).isfavourite[searchModel.data![index].id.toString()] ==true) ?
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
                                      color: HexColor('FF4CAF50'),
                                      child: Row(
                                        children: [
                                          Image.asset('assets/images/1216841.png',height: 25,width: 20,color: HexColor('FFFFFFFF'),),
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
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );

        }
      },
    );
  }
}
