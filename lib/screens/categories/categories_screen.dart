import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/home/home_cubit/states.dart';
import 'package:sandra_app/screens/see_all/see_all_screen.dart';
import 'categories_component/component.dart';
import 'package:sizer/sizer.dart';

import 'category_search_class.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        titleSpacing: 5,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.Categories.tr(),style: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
            fontSize: 17.sp,
            fontWeight: FontWeight.w600
        ),),
        leading: Padding(
          padding: const EdgeInsets.only(right: 10,left: 10),
          child: Image.asset('assets/images/categories.png',color: Colors.white,),
        ),
        backgroundColor: HexColor('#ffcdd2'),
      ),
      body: BlocConsumer<HomeCubit,HomeState>(
         listener: (context,state){},
        builder: (context,state){
           return ListView(
             padding: EdgeInsets.symmetric(vertical: 3.h,),
             children: [
               InkWell(
                   onTap: (){
                     showSearch(context: context, delegate: CategorySearch());
                   },
                   child: buildSearchCardInCategoriesScreen()),
               SizedBox(height: 3.h,),
               Container(
                 height: MediaQuery.of(context).size.height,
                 width: 305,
                 child: ConditionalBuilder(
                    condition: state is! CategoriesLoadingState,
                   builder: (context)=>ListView.separated(
                       itemBuilder: (context,index)=>InkWell(
                         onTap:(){
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
                         child: buildCategoriesCard(
                             title: HomeCubit.get(context).categories[index]['title'].toString()),
                       ),
                       separatorBuilder: (context,index)=> Column(
                         children: [
                           SizedBox(height: 25,),
                           myDivider(height: 2),
                           SizedBox(height: 25,),
                         ],
                       ),
                       itemCount: HomeCubit.get(context).categories.length),
                   fallback: (context)=>Center(
                     child: CircularProgressIndicator(
                       color: HexColor('ffcdd2'),
                     ),
                   ),
                   // child: ,
                 ),
               ),
             ],
           );
        },
      ),
    );
  }
}
