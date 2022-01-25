import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandra_app/screens/home/home_component/home_component.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/home/home_cubit/states.dart';
import 'package:sandra_app/screens/product_detail/product_detail_screen.dart';
import 'package:sizer/sizer.dart';

import 'component/component.dart';

buildOffersInHomeScreen()=>BlocConsumer<HomeCubit,HomeState>(
  listener: (context,state){},
  builder: (context,state){
    return ConditionalBuilder(
      condition: state is! AllOffersLoadingState,
      builder: (context)=> SizedBox(
          height: 20.h,
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              shrinkWrap: false,
              primary: false,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)=>InkWell(
                   onTap:  (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>ProductDetailsScreen(
                          // id: HomeCubit.get(context).offersModel.data![index].id.toString(),
                      )));
                  HomeCubit.get(context).getProductDetails(id: HomeCubit.get(context).offersModel.data![index].id.toString(),);
                   },
                child: buildOffersCardRow(
                  context: context,
                  image:  HomeCubit.get(context).offersModel.data![index].coverImg.toString(),
                  price: HomeCubit.get(context).offersModel.data![index].price.toString(),
                  newPrice: HomeCubit.get(context).offersModel.data![index].offer!.price.toString()
                 ),
              ),
              separatorBuilder: (context,index)=>SizedBox(width: 4.w,),
              itemCount: HomeCubit.get(context).offersModel.data!.length)),
      fallback: (context)=> Center(child: CircularProgressIndicator(
        color: HexColor('ffcdd2'),
      )),
      // child: ,
    );
  },
);