import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/network/cache/cache_helper.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/home/home_cubit/states.dart';
import 'package:sandra_app/screens/product_detail/product_detail_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:sandra_app/screens/home/home_component/home_component.dart';
import 'package:easy_localization/easy_localization.dart';

import 'component/component.dart';

class OffersScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 5,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.Offers.tr(),style: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
            fontSize: 17.sp,
            fontWeight: FontWeight.w600
        ),),
        leading: Padding(
          padding: const EdgeInsets.only(right: 10,left: 10),
          child: Image.asset('assets/images/offers.png',color: Colors.white,),
        ),
        backgroundColor: HexColor('#ffcdd2'),
      ),
      body: BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder: (context,state){
          return ConditionalBuilder(
            condition: state is! AllOffersLoadingState,
            builder:  (context)=>ListView(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              physics: BouncingScrollPhysics(),
              primary: true,
              shrinkWrap : true,
              // padding: EdgeInsets.symmetric(vertical: 10,),
              children: [
                ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>ProductDetailsScreen(
                                // id: productId
                            )));
                        HomeCubit.get(context).getProductDetails(id:  HomeCubit.get(context).offersModel.data![index].id.toString(),);

                      },
                      child: buildOffersCard(
                        image: HomeCubit.get(context).offersModel.data![index].offer!.image.toString(),
                        context: context,
                      ),
                    ) ,
                    separatorBuilder: (context, index) =>SizedBox(height: 10,),
                    itemCount:HomeCubit.get(context).offersModel.data!.length),
              ],
            ),
            fallback: (context)=>Center(child: CircularProgressIndicator(
              color: HexColor('ffcdd2'),
            )),
            // child:
          );
        },
      ),
    );
  }
}






