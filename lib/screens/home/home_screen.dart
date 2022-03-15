import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/screens/all_brands/all_brands_screen.dart';
import 'package:sandra_app/screens/all_brands/brand_data.dart';
import 'package:sandra_app/screens/categories/category_data.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/home/home_component/home_component.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/home/home_cubit/states.dart';
import 'package:sandra_app/screens/layout/layout_screen.dart';
import 'package:sandra_app/screens/new_products/new_products.dart';
import 'package:sandra_app/screens/offers/offer_data.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import '../search_class.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFFFFF'),
      appBar: AppBar(
        titleSpacing: 5,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'SANDRA',
          style: TextStyle(
              fontFamily: 'OpenSans',
              color: Colors.white,
              fontSize: 17.sp,
              fontWeight: FontWeight.w600),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Image.asset(
            'assets/images/Menu.png',
            color: Colors.white,
          ),
        ),
        backgroundColor: HexColor('#ffcdd2'),
      ),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        physics: BouncingScrollPhysics(),
        children: [
          InkWell(
              onTap: () {
                showSearch(context: context, delegate: ProductsSearch());
              },
              child: buildSearchCardInHomeScreen()),
          SizedBox(
            height: 3.h,
          ),
          buildCategoryInHomeScreen(),
          SizedBox(
            height: 20,
          ),
          CarouselSlider.builder(
            itemCount: 1,
            itemBuilder: (context, index, pageViewIndex) {
              return Image.asset(
                'assets/images/Image 29.png',
                fit: BoxFit.cover,
              );
            },
            options: CarouselOptions(
              height: 150,
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
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              children: [
                Text(
                  LocaleKeys.Offers.tr(),
                  style: TextStyle(
                      color: HexColor('#515C6F'),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'OpenSans',
                      fontSize: 16),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LayoutScreen(index: 1)));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: HexColor('#515C6F'),
                        size: 15,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: HexColor('#515C6F'),
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          buildOffersInHomeScreen(),
          SizedBox(
            height: 4.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              children: [
                Text(
                  LocaleKeys.Brands.tr(),
                  style: TextStyle(
                      color: HexColor('#515C6F'),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'OpenSans',
                      fontSize: 16),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AllBrands()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: HexColor('#515C6F'),
                        size: 15,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: HexColor('#515C6F'),
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          buildBrandDataInHomeScreen(),
          SizedBox(
            height: 4.h,
          ),
          buildNewProductsDataInHomeScreen(),
          SizedBox(
            height: 4.h,
          ),
          BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ConditionalBuilder(
                condition: state is! GetBrandLoadingState,
                builder: (context) {
                  return (HomeCubit.get(context).bannersData.isNotEmpty)
                      ? CarouselSlider.builder(
                          itemCount: HomeCubit.get(context).bannersData.length,
                          itemBuilder: (context, index, pageViewIndex) {
                            return Container(
                              child: customCachedNetworkImage(
                                  url: HomeCubit.get(context).bannersData[index]
                                      ['banner'],
                                  context: context,
                                  fit: BoxFit.cover),
                            );
                          },
                          options: CarouselOptions(
                            height: 130,
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
                        )
                      : Container();
                },
                fallback: (context) => Center(
                  child: CircularProgressIndicator(
                    color: HexColor('#ffcdd2'),
                  ),
                ),
                // child:
              );
            },
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
