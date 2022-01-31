import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/home/home_component/home_component.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/home/home_cubit/states.dart';
import 'package:sandra_app/screens/see_all/see_all_screen.dart';
import 'package:sizer/sizer.dart';

buildBrandDataInHomeScreen()=> BlocConsumer<HomeCubit,HomeState>(
  listener: (context,state){},
  builder: (context,state){
    return ConditionalBuilder(
      condition: state is! HomeLoadingState,
      builder: (context)=> SizedBox(
        height: 21.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          primary: false,
          shrinkWrap: false,
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          itemBuilder: (context,index)=>
              InkWell(
            onTap: (){
              HomeCubit.get(context).getProducts(
                  id: '',
                  brandId: HomeCubit.get(context).data[index]['id'].toString());

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SeeAllScreen()));
            },
                child: buildBrandsItem(
                context: context,
                title: HomeCubit.get(context).data[index]['name'],
                pathImage: HomeCubit.get(context).data[index]['logo']),
          ),
          separatorBuilder: (context,index)=>SizedBox(width: 1.w,),
          itemCount: HomeCubit.get(context).data.length,
        ),
      ),
      fallback: (context)=>  Center(child: CircularProgressIndicator(
        color: HexColor('ffcdd2'),
      )),
    );
  },
);