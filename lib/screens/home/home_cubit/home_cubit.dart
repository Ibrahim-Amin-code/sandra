import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:sandra_app/models/all_offers.dart';
import 'package:sandra_app/models/contact_model.dart';
import 'package:sandra_app/models/get_products_model.dart';
import 'package:sandra_app/models/product_detailes_model.dart';
import 'package:sandra_app/models/wish_list_model.dart';
import 'package:sandra_app/network/cache/cache_helper.dart';
import 'package:sandra_app/network/dio/dio_helper.dart';
import 'package:sandra_app/network/end_points.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/home/home_cubit/states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);


   List data=[];

  void getShops(){
    emit(HomeLoadingState());
    DioHelper.getData(
      url: GetShops,
    ).then((value) {
      data.clear();
      data.addAll(value.data['data']);
      // print(data[0]['id'].)
      emit(HomeSuccessState());
    }).catchError((error) {
      emit(HomeErrorState(error.toString()));
      print(error.toString());
    });
  }


  List categories=[];

  void getCategories()async {
   String lang = await CacheHelper.getData(key: 'lang')?? 'ar';
    emit(CategoriesLoadingState());
    DioHelper.getData(
      url: GetCategories,
      query: {
        'lang':lang,
      }
    ).then((value) {
      categories.clear();
      categories.addAll(value.data['data']);
      // print('------------------------------------------------+' +lang.toString());
      emit(CategoriesSuccessState());
    }).catchError((error) {
      emit(CategoriesErrorState(error.toString()));
      print(error.toString());
    });
  }


  // dynamic getProductsModel;

  List products = [];

  void getProducts({
     String? id,
     String? brandId,
    // required String lang,
}) async{
    String lang = await CacheHelper.getData(key: 'lang')??'ar';
    emit(ProductsLoadingState());
    DioHelper.getData(
        url: GetProducts,
        query: {
        'categoryId': '$id',
        'shopId': '$brandId',
        'lang': lang,
        }
    ).then((value){
      products.clear();
      products.addAll(value.data['data']);
      print('--------------------------------------------------------------${value.data}');
      print(brandId.toString());
      emit(ProductsSuccessState());
    }).catchError((error) {
      emit(ProductsErrorState(error.toString()));
      print(error.toString());
    });
  }


  List allProducts=[];

  void getAllProducts() async{
    String lang = await CacheHelper.getData(key: 'lang')?? 'ar';
    emit(AllProductsLoadingState());
    DioHelper.getData(
        url: GetProducts,
        query: {
          'lang': lang,
          'categoryId':'',
          'shopId':'',
        }

    ).then((value){
      allProducts.clear();
      print('-ang.toString----------------------------------------------------------------------------------'+lang.toString());
      print('-value.datavalue.datavalue.datavalue.datavalue.datavalue.data-----------------${value.data}');
      allProducts.addAll(value.data['data']);

      emit(AllProductsSuccessState());
    }).catchError((error) {
      emit(AllProductsErrorState(error.toString()));
      print(error.toString());
    });
  }



  ContactModel contactModel =ContactModel();

  void contactInfo(){
    emit(ContactInfoLoadingState());
    DioHelper.getData(
        url: ContactInfo,
    ).then((value) {
      contactModel = ContactModel.fromJson(value.data);
      emit(ContactInfoSuccessState());
    }).catchError((error) {
      emit(ContactInfoErrorState(error.toString()));
      print(error.toString());
    });
  }

  List bannersData=[];

  void getBanners(){
    emit(GetBrandLoadingState());
    DioHelper.getData(
        url: GetBanners,
    ).then((value) {
      bannersData.clear();
      bannersData.addAll(value.data['data']);
      // print(value.data);
      emit(GetBrandSuccessState());
    }).catchError((error) {
      emit(GetBrandErrorState(error.toString()));
      print(error.toString());
    });
  }


  var contact;

  void contactUs({
  required String name,
  required String subject,
  required String phone,
  required String email,
  required String message,
})async {
    emit(ContactUsLoadingState());
    // String token = await CacheHelper.getData(key: 'token');
    DioHelper.postContactUsData(
        url: ContactUs,
        // token: 'Bearer $token',
        data: {
      'name':name,
      'subject':subject,
      'phone':phone,
      'email':email,
      'message':message,
        }).then((value) {
      contact = value.data;
          print('contact-------------------------------------------------'+value.data['msg']);
          emit(ContactUsSuccessState());
    }).catchError((error){
      emit(ContactUsErrorState(error.toString()));
      print(error.toString());
    });

  }



  OffersModel offersModel =OffersModel();

  void getAllOffers()async
  {
    emit(AllOffersLoadingState());
    String lang = await CacheHelper.getData(key: 'lang')?? 'ar';

    DioHelper.getData(
      url: AllOffers,
      query: {
        'lang':lang,
      }
    ).then((value) {
      offersModel = OffersModel.fromJson(value.data);
      // print('-allOffersModel------------------------------------------------${value.data}');
      emit(AllOffersSuccessState());
    }).catchError((error)
    {
      emit(AllOffersErrorState(error.toString()));
      print(error.toString());
    });
  }


   dynamic productDetailsModel;

  void getProductDetails({
    String? id,
  })async {
    emit(GetProductDetailsLoadingState());
    String lang = await CacheHelper.getData(key: 'lang')?? 'ar';
    DioHelper.getData(
      url: ProductDetails,
      query: {
        'productId':'$id',
        'lang':'$lang',
      }
    ).then((value) {
      productDetailsModel = ProductDetailsModel.fromJson(value.data);
      // print(value.data);
      print('id---------------------------------------------------------------${id}-');

      emit(GetProductDetailsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetProductDetailsErrorState(error.toString()));
    });
  }

}
