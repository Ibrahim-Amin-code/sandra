import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandra_app/models/login_model.dart';
import 'package:sandra_app/screens/categories/categories_screen.dart';
import 'package:sandra_app/screens/home/home_screen.dart';
import 'package:sandra_app/screens/layout/cubit/states.dart';
import 'package:sandra_app/screens/more/more_screen.dart';
import 'package:sandra_app/screens/my_orders/my_orders_screen.dart';
import 'package:sandra_app/screens/offers/offers_screen.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    CategoriesScreen(),
    OffersScreen(),
    HomeScreen(),
    MoreScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }


  late Database database;
  List<Map> favourites = [];
  Map<String, bool> isfavourite = {};

  void createDb() {
    openDatabase('favourite.db', version: 1, onCreate: (database, version) {
      database
          .execute(
    'CREATE TABLE favourite (id INTEGER PRIMARY KEY , productName TEXT,productImage TEXT,productPrice TEXT, productId TEXT)')
          .then((value) {})
          .catchError((error) {});
    }, onOpen: (database) {
      getfromDataBase(database);
    }).then((value) {
      database = value;
      emit(CreatedatabaseState());
    });
  }
/////////////////////////////////////////////////////////////////////////

  getfromDataBase(database) {
    emit(LoadingDatafromDatabase());
    database.rawQuery('SELECT * FROM favourite').then((value) {
      favourites = value;
      emit(GetdatabaseState());
    });
  }
////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////

  deletaFromDB({required int id}) {
    database.rawDelete('DELETE FROM favourite WHERE productId = ?', ['$id']).then(
            (value) {
              print('--------------------------------itemDELETTTTTTTTTTTTTTTTTTTTTT');
          getfromDataBase(database);
          isfavourite["$id"] = false;
          emit(DeletedatabaseState());
        }).catchError((error) {});
  }

////////////////////////////////////////////////////////////////////////////////////////////

  void inserttoDatabase({
    required String productImage,
    required String productId,
    required String productPrice,
    required String productName,
    //productName TEXT,productImage TEXT,productPrice TEXT, productId TEXT
  }) async {
    database.transaction((txn) async {
      txn
          .rawInsert(
          'INSERT INTO favourite(productName, productImage,productPrice,productId) VALUES("$productName", "$productImage","$productPrice","$productId")')
          .then((value) {
        print('--------------------------------itemINSERT');
        isfavourite[productId] = true;
        emit(InsertdatabaseState(
        ));
        getfromDataBase(database);
        emit(GetdatabaseState());
      }).catchError((error) {});
      return null;
    });
  }


}