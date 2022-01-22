import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandra_app/models/search_model.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/home/home_cubit/states.dart';
import 'package:sandra_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:sandra_app/screens/product_detail/product_detail_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'components/constants.dart';

class ProductsSearch extends SearchDelegate {
  ProductsSearch()
      : super(
      searchFieldLabel: 'Search ',
      searchFieldStyle: TextStyle(
           fontSize: 18, fontFamily: 'Cairo'));

  getSearchProduct({required String keyword}) async{
   try{
     var response = await http.get(Uri.parse("https://findfamily.net/eshop/api/buyers/products/search?name=$keyword"));
     searchModel = SearchModel.fromJson(json.decode(response.body));
     return searchModel;
   }catch(error){
     print("erooooooooooooor" + error.toString());
   }
 } 
  
  
  
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  SearchModel searchModel = SearchModel();


  @override
  Widget buildResults(BuildContext context) {
    return query.isEmpty
        ? Container()
        : FutureBuilder(
        future: getSearchProduct(keyword: query.toString()),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                primary: true,
                shrinkWrap: true,
                itemCount: searchModel.data!.length,
                itemBuilder: (context, index) =>
                    InkWell(
                      onTap: (){
                        HomeCubit.get(context).getProductDetails(id: searchModel.data![index].id.toString(),);
                      },
    // onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailsScreen(// id: searchModel.data![index].id.toString(),))),
                      child: buildSearchProduct(
                        context: context,
                        price:searchModel.data![index].price.toString(),
                        image:searchModel.data![index].coverImg.toString(),
                        name:searchModel.data![index].name.toString(),
                      ),
                    ));
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );

          }
        },
    );
  }

  Widget buildSearchProduct({
  required String image,
    required context,
  required String price,
  required String name,
  // required String image,
})=> Card(
    child: Row(
      children: [
        Container(
            height: 24.h,
            width: 40.w,
            child: customCachedNetworkImage(url: image, context: context, fit: BoxFit.contain)),
          SizedBox(width: 5,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  color: HexColor('#515C6F'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp),
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                 'SAR  ' + price + ' ',
                  style: TextStyle(
                      color: HexColor('#4CB8BA'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp),
                ),
                Text(

                  '|   ',
                  style: TextStyle(
                    color: HexColor('#C9C9C9'),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'SAR 300',
                  style: TextStyle(
                    color: HexColor('#C9C9C9'),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    decoration: TextDecoration.lineThrough,
                    decorationStyle: TextDecorationStyle.double,
                    decorationColor: HexColor('C9C9C9'),
                  ),
                ),
              ],
            ),

          ],
        )
      ],
    ),
  );


  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? Container()
        : FutureBuilder(
      future: getSearchProduct(keyword: query.toString()),
      builder: (context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return ListView.builder(
              primary: true,
              shrinkWrap: true,
              itemCount: searchModel.data!.length,
              itemBuilder: (context, index) =>
                  InkWell(
                    onTap: (){
                      HomeCubit.get(context).getProductDetails(id: searchModel.data![index].id.toString(),);

                      // HomeCubit.get(context).getProductDetails(id:  HomeCubit.get(context).products[index]['id'].toString(),);
                    },
           // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailsScreen(id: searchModel.data![index].id.toString(),))),

                    child: buildSearchProduct(
                      context: context,
                      price:searchModel.data![index].price.toString(),
                      image:searchModel.data![index].coverImg.toString(),
                      name:searchModel.data![index].name.toString(),
                    ),
                  ));
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );

        }
      },
    );
  }
}
