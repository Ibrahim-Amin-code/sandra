import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/network/cache/cache_helper.dart';
import 'package:sandra_app/screens/home/home_component/home_component.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/home/home_cubit/states.dart';
import 'package:sandra_app/screens/product_detail/product_detail_screen.dart';
import 'package:sandra_app/screens/see_all/sell_all_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

buildNewProductsDataInHomeScreen()=> BlocConsumer<HomeCubit,HomeState>(
  listener: (context,state){},
  builder: (context,state){
    return ConditionalBuilder(
      condition: state is! AllProductsLoadingState,
      builder: (context) =>
      Column(
        children: [

          (HomeCubit.get(context).allProducts.isNotEmpty)?

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              children: [
                Text(LocaleKeys.New_Products.tr(),style: TextStyle(color: HexColor('#515C6F'),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    fontSize: 12.sp
                ),),
                Spacer(),
                InkWell(
                  onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SeeAllScreen(

                  )));
                      HomeCubit.get(context).getAllProducts();
                      },
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios,color: HexColor('#515C6F'),size: 15,),
                      Icon(Icons.arrow_forward_ios,color: HexColor('#515C6F'),size: 15,),
                    ],
                  ),
                ),
              ],
            ),
          ) : Container(),

          SizedBox(height: 2.h,),

          (HomeCubit.get(context).allProducts.isNotEmpty)?

           Container(
            height: MediaQuery.of(context).size.height*0.42,
            child: ListView.separated(
                shrinkWrap: true,
                primary: true,
                padding: EdgeInsets.symmetric(horizontal: 2.w,),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)=>InkWell(
                  onTap: ()async{
                    // CacheHelper.saveData(
                    //     key: 'productId',
                    //     value: HomeCubit.get(context).allProducts[index]['id'].toString());
                    // final String productId = await CacheHelper.getData(key: 'productId');
                    // print('productId=========================================${productId}');

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>ProductDetailsScreen(
                            // id: HomeCubit.get(context).allProducts[index]['id'].toString()
                        )));
                    HomeCubit.get(context).getProductDetails(id: HomeCubit.get(context).allProducts[index]['id'].toString());
                    },
                  child: buildNationalDayProductsItem(
                    id: HomeCubit.get(context).allProducts[index]['id'].toString(),
                      price: HomeCubit.get(context).allProducts[index]['price'].toString(),
                      name: HomeCubit.get(context).allProducts[index]['name'].toString(),
                      image: HomeCubit.get(context).allProducts[index]['cover_img'].toString(),
                      context: context),
                ),
                separatorBuilder:(context,index)=>SizedBox(width: 2.w,),
                itemCount:HomeCubit.get(context).allProducts.length),
          ) : Container(),
        ],
      ),

      fallback: (context) =>Center(child: CircularProgressIndicator(
        color: HexColor('ffcdd2'),
      )),

    );
  },
  // child: ,
);