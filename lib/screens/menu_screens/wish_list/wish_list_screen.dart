import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/components/default_button.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/layout/cubit/cubit.dart';
import 'package:sandra_app/screens/layout/cubit/states.dart';
import 'package:sandra_app/screens/layout/layout_screen.dart';
import 'package:sandra_app/screens/product_detail/product_detail_screen.dart';
import 'package:sizer/sizer.dart';
import 'component/wish_list_component.dart';
import 'package:easy_localization/easy_localization.dart';

class WishListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        titleSpacing: 5,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.Wish_List.tr(),style: TextStyle(
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


      body: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
            children: [
              (AppCubit.get(context).favourites.isNotEmpty)?
              GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 1.h,
                  crossAxisSpacing: 1.5.w,
                  childAspectRatio: 1 / 1.55,
                  children:
                  List.generate(
                      AppCubit.get(context).favourites.length,
                    (index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                        // id: AppCubit.get(context).favourites[index]['productId'].toString()
                                    )
                                ));
                            HomeCubit.get(context).getProductDetails(id: AppCubit.get(context).favourites[index]['productId'].toString());

                          },
                          child: SizedBox(
                            height: 41.h,
                              child: buildWishListProductsItem(
                                id: AppCubit.get(context).favourites[index]['productId'].toString(),
                                context: context,
                                name: AppCubit.get(context).favourites[index]['productName'].toString(),
                                image:AppCubit.get(context).favourites[index]['productImage'].toString(),
                                price:AppCubit.get(context).favourites[index]['productPrice'].toString(),
                              ),
                            ),
                          )),

              ) : Column(
                children: [
                  SizedBox(height: 50,),
                  Container(
                      width: 250,
                      height: 350,
                      child: Image.asset('assets/images/vector1.png',fit: BoxFit.contain,)),
                      SizedBox(height: 20,),
                      SizedBox(
                          width: double.infinity,
                          child: DefaultButton(text: LocaleKeys.ADD_WISH.tr(), press: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LayoutScreen(index: 2)));
                          }))
                ],
              ),
              SizedBox(height: 2.h,),
            ],

          );
        },
        // child: ,
      ),
    );
  }
}
