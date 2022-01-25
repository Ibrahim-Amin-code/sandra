
import 'dart:convert';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/network/cache/cache_helper.dart';
import 'package:sandra_app/screens/see_all/see_all_screen.dart';
import 'package:sizer/sizer.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:sandra_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:easy_localization/easy_localization.dart';
class CategorySearch extends SearchDelegate {
  CategorySearch()
      : super(
      searchFieldLabel: LocaleKeys.Search.tr(),
      searchFieldStyle: TextStyle(
           fontSize: 18, fontFamily: 'Cairo'));

  List searchCategory = [];

  getSearchCategory({required String keyword}) async{
   try{
     String lang = await CacheHelper.getData(key: 'lang')?? 'ar';
     var response = await http.get(Uri.parse("https://findfamily.net/eshop/api/buyers/categotries?lang=$lang&CategoryTitle=$keyword"));
     var data;
     data = jsonDecode(response.body);
     searchCategory.clear();
     searchCategory.addAll(data['data']);
     return searchCategory;
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


  @override
  Widget buildResults(BuildContext context) {
    return query.isEmpty
        ? Container()
        : FutureBuilder(
        future: getSearchCategory(keyword: query.toString()),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                primary: true,
                shrinkWrap: true,
                itemCount: searchCategory.length,
                itemBuilder: (context, index) =>
                    InkWell(
                      onTap: (){
                        HomeCubit.get(context).getProducts(
                            id: searchCategory[index]['id'].toString());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeeAllScreen()));
                        HomeCubit.get(context).getProductDetails(id: searchCategory[index]['id'].toString(),);
                      },
                      child:  buildCategoriesSearch(
                          pathImage:searchCategory[index]
                          ['icon'],
                          context: context,
                          title: searchCategory[index]['title']),
                    ));
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );

          }
        },
    );
  }


  Widget buildCategoriesSearch({
    required String pathImage,
    required String title,
    context
  })=>Container(
    padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
    // height: 115,
    child: Row(
     children: [
        Container(
            height: 10.h,
            width: 18.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: Colors.red
            ),
            child: customCachedNetworkImage(url: pathImage, context: context, fit: BoxFit.contain)
        ),
          SizedBox(
            width: 30,
          ),
        Text(title,style: TextStyle(
            color: HexColor('515C6F'),
            fontSize: 15,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600
        ),),
      ],
    ),
  );


  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? Container()
        : FutureBuilder(
      future: getSearchCategory(keyword: query.toString()),
      builder: (context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return ListView.builder(
              primary: true,
              shrinkWrap: true,
              itemCount: searchCategory.length,
              itemBuilder: (context, index) =>
                  InkWell(
                    onTap: (){
                      HomeCubit.get(context).getProducts(
                          id: searchCategory[index]['id'].toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SeeAllScreen()));
                      HomeCubit.get(context).getProductDetails(id: searchCategory[index]['id'].toString(),);
                    },
                    child: buildCategoriesSearch(
                        pathImage:searchCategory[index]
                        ['icon'],
                        context: context,
                        title: searchCategory[index]['title']),
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

