import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/home/home_cubit/states.dart';
import 'package:sandra_app/screens/see_all/see_all_screen.dart';

import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class AllBrands extends StatelessWidget {
  // const AllBrands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F5F6F8'),
      appBar:AppBar(
        titleSpacing: 5,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.Brands.tr(),style: TextStyle(
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
        listener: (context,state){},
        builder: (context,state){
          return
            ConditionalBuilder(
              condition: state is! HomeLoadingState,
              builder: (context)=> GridView.count(
                physics: BouncingScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 2.5.w,
                crossAxisSpacing: 3.h,
                childAspectRatio: 0.8,
                primary: true,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                children: List.generate(HomeCubit.get(context).data.length,
                      (index) => buildBrands(
                    id: HomeCubit.get(context).data[index]['id'].toString(),
                    context: context,
                    title: HomeCubit.get(context).data[index]['name'],
                    pathImage: HomeCubit.get(context).data[index]['logo']),),
              ),
              fallback: (context)=>  Center(child: CircularProgressIndicator(
                color: HexColor('ffcdd2'),
              )),
              // child:
            );
        },
      ),
    );
  }
  Widget buildBrands({
    required String pathImage,
    required String title,
    required String id,
    context
  })=> InkWell(
     onTap: (){
       HomeCubit.get(context).getProducts(
         brandId: id,
         id: '',
       );
       Navigator.push(context, MaterialPageRoute(
           builder: (context)=>
               SeeAllScreen(),
       ));
     },
    child: Container(
      width: 120,
      child: Stack(
        children: [
          Container(
            child: customCachedNetworkImage(url: pathImage, context: context, fit: BoxFit.cover),
          ),
          Container(
            width: double.infinity,
            height: 20,
            margin: EdgeInsets.only(top: 20.h),
            decoration: BoxDecoration(
              color: HexColor('ffcdd2'),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  color: HexColor('#FFFFFF'),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );

}
