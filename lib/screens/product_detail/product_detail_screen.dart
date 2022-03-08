

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/home/home_component/home_component.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/home/home_cubit/states.dart';
import 'package:sandra_app/screens/product_detail/product_detail_component/product_detail_component.dart';
import 'package:sandra_app/screens/see_all/see_all_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}
class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    List <Widget>image=[
      Image.asset('assets/images/Image 40.png'),
    ];
    List<Color> colors = [HexColor('#000000'), HexColor('#B5994565'), HexColor('#727C8E'),HexColor('#ED5199'),HexColor('#515C6F'),HexColor('#FF8C69'),HexColor('#4CB8BA'),HexColor('#FF9000')];

    // var cubit = HomeCubit.get(context).productDetailsModel;
    // var cubit = HomeCubit.get(context).productDetailsModel;

    return Scaffold(
      backgroundColor: HexColor('#F5F6F8'),
      appBar:  AppBar(
        titleSpacing: 5,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.Product_Details.tr(),style: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
            fontSize: 17.sp,
            fontWeight: FontWeight.w600
        ),),

        leading: Padding(
          padding: const EdgeInsets.only(right: 10,left: 10),
          child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        ),
        backgroundColor: HexColor('#ffcdd2'),
      ),
      body: BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){
        },
        builder: (context,state){
          return ConditionalBuilder(
            condition: state is! GetProductDetailsLoadingState,
            builder: (context)=> ListView(
              padding: EdgeInsets.symmetric(horizontal: 3.w,),
              primary: true,
              shrinkWrap: true,
              children: [
                (HomeCubit.get(context).productDetailsModel.data.productImage.isNotEmpty)?
                CarouselSlider.builder(

                  itemCount: HomeCubit.get(context).productDetailsModel.data.productImage.length,
                  itemBuilder: (context,index,pageViewIndex){
                    return Container(
                      child: customCachedNetworkImage(
                          url: HomeCubit.get(context).productDetailsModel.data.productImage[index].image.toString(), context: context, fit: BoxFit.contain),
                    );
                  },
                  options: CarouselOptions(
                    height: 250,
                    initialPage: 0,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    aspectRatio: 3,
                  ),
                ): Container(),

                SizedBox(height: 3.h,),
                Text(HomeCubit.get(context).productDetailsModel.data.name.toString(),

                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: HexColor('#515C6F'),
                      fontFamily: 'OpenSan'
                  ),
                ),
                SizedBox(height: 1.h,),
                Text(
                  '${LocaleKeys.Price.tr()} :  '+'${HomeCubit.get(context).productDetailsModel.data.price.toString()} \$',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: HexColor('#4CB8BA'),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 1.h,),
                Row(
                  children: [
                    Text(
                      LocaleKeys.Brands.tr() + ':',
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
                      'Casio',
                      style: TextStyle(
                        fontSize: 16,
                        color: HexColor('#4CB8BA'),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 1.h,),
                Text(
                  LocaleKeys.Model_Number.tr() + ': ${HomeCubit.get(context).productDetailsModel.data.modalNumber.toString()}',
                  //quantity
                  style: TextStyle(
                    fontSize: 16,
                    color: HexColor('#515C6F'),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 1.h,),
                Text(
                  LocaleKeys.Department.tr() + ': ${HomeCubit.get(context).productDetailsModel.data.department.toString()}',
                  //quantity
                  style: TextStyle(
                    fontSize: 16,
                    color: HexColor('515C6F'),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 1.h,),

                buildAddToCartRow(
                    context: context,

                    price: HomeCubit.get(context).productDetailsModel.data.price.toString(),
                    id: HomeCubit.get(context).productDetailsModel.data.id.toString()),


                SizedBox(height: 2.h,),

                buildAddToWishListRow(context: context,id: HomeCubit.get(context).productDetailsModel.data.id.toString()),

                SizedBox(height: 4.h,),
                Text(LocaleKeys.Colors.tr(),
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    color: HexColor('#515C6F'),
                    fontSize: 12.sp,
                  ),
                ),
                // SizedBox(height: 2.h,),
                (HomeCubit.get(context).productDetailsModel.data.color.isNotEmpty)? Container(
                  height: 10.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) =>  Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor(HomeCubit.get(context).productDetailsModel.data.color[index].toString(),),
                      ),
                    ),
                    separatorBuilder: (context,index) => SizedBox(width: 15,),
                    itemCount: (HomeCubit.get(context).productDetailsModel.data.color.length),
                  ),) :  Container(
                  height: 10.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) =>  Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors[index],
                      ),
                    ),
                    separatorBuilder: (context,index) => SizedBox(width: 15,),
                    itemCount: colors.length,
                  ),),
                SizedBox(height: 1.h,),
                Text(LocaleKeys.Sizes.tr(),
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    color: HexColor('#515C6F'),
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(height: 1.h,),
                Container(
                  height: 5.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) =>  Container(
                      // height: 7.h,
                      width: 11.w,
                      child:Text(HomeCubit.get(context).productDetailsModel.data.size[index].toString()) ,

                    ),
                    separatorBuilder: (context,index) => SizedBox(width: 10,),
                    itemCount: (HomeCubit.get(context).productDetailsModel.data.size.length),
                  ),),
                  // SizedBox(height: 1.h,),
                Text('${LocaleKeys.Description.tr()} :',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    color: HexColor('#515C6F'),
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(height: 1.h,),
                Text(parseHtmlString(HomeCubit.get(context).productDetailsModel.data.description.toString(),),
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: HexColor('#515C6F'),
                  fontSize: 10.sp,
                ),
                ),
                // SizedBox(
                //     height: 45.h,
                //     child: ProductDescription(description: HomeCubit.get(context).productDetailsModel.data.description.toString(),)),
                SizedBox(height: 3.h,),
                Row(
                  children: [
                    Text(LocaleKeys.Similar_Products.tr(),style: TextStyle(color: HexColor('#515C6F'),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize: 12.sp
                    ),),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.arrow_back_ios,color: HexColor('#515C6F'),size: 15,),
                        Icon(Icons.arrow_forward_ios,color: HexColor('#515C6F'),size: 15,),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  height: 41.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      primary: true,
                      shrinkWrap: true,
                      itemBuilder: (context,index)=>buildNationalDayProductsItem(
                          image: 'assets/images/Image 32.png',context: context,name: '',id: '',price: ''),
                      separatorBuilder: (context,index)=> SizedBox(width: 2.w,),
                      itemCount: 5),
                ),
                SizedBox(height: 3.h,),
                InkWell(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SeeAllScreen(
                      )), (route) => false);
                    },
                    child: buildSeeAllButton()),
                SizedBox(height: 3.h,),
              ],
            ),
            fallback: (context)=> Center(child: CircularProgressIndicator()),
          );
        },
        // child: ,
      ),
    );
  }
}

