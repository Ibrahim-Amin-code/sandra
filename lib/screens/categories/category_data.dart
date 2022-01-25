import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandra_app/screens/home/home_component/home_component.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/home/home_cubit/states.dart';
import 'package:sandra_app/screens/see_all/see_all_screen.dart';
import 'package:sizer/sizer.dart';

buildCategoryInHomeScreen() => BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {},
  builder: (context, state) {
    return ConditionalBuilder(
      condition: state is! CategoriesLoadingState,
      builder: (context) => SizedBox(
        height: 14.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          primary: false,
          shrinkWrap: false,
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              HomeCubit.get(context).getProducts(
                  id: HomeCubit.get(context).categories[index]['id'].toString());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SeeAllScreen(
                            // brandId: '',
                            // id: HomeCubit.get(context).categories[index]['id'].toString(),
                          )));
            },
            child: buildCategoriesItems(
                pathImage: HomeCubit.get(context).categories[index]
                    ['icon'],
                context: context,
                title: HomeCubit.get(context).categories[index]['title']),
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: 1.w,
          ),
          itemCount: HomeCubit.get(context).categories.length,
        ),
      ),
      fallback: (context) => Center(
          child: CircularProgressIndicator(
        color: HexColor('ffcdd2'),
      )),
      // child:
    );
  },
);
