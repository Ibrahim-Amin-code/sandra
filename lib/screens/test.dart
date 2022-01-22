//  import 'package:bta3_tanmya/DBhelper/AppCubit/appState.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DataBaseCubit extends Cubit<AppCubitStates> {
// DataBaseCubit() : super(AppInitialState());
//
// static DataBaseCubit get(context) => BlocProvider.of(context);
//
// late Database database;
// List<Map> favourites = [];
// Map<String, bool> isfavourite = {};
//
// void createDb() {
// openDatabase('favourite.db', version: 1, onCreate: (database, version) {
// database
//     .execute(
// 'CREATE TABLE favourite (id INTEGER PRIMARY KEY , navyType TEXT, navyId)')
//     .then((value) {})
//     .catchError((error) {});
// }, onOpen: (database) {
// getfromDataBase(database);
// }).then((value) {
// database = value;
// emit(CreatedatabaseState());
// });
// }
// /////////////////////////////////////////////////////////////////////////
//
// getfromDataBase(database) {
// emit(LoadingDatafromDatabase());
// database.rawQuery('SELECT * FROM favourite').then((value) {
// favourites = value;
// emit(GetdatabaseState());
// });
// }
// ////////////////////////////////////////////////////////////////////////////////////////////
//
// ///////////////////////////////////////////////////////////////////////////////////////////
//
// deletaFromDB({required int id}) {
// database.rawDelete('DELETE FROM favourite WHERE navyId = ?', ['$id']).then(
// (value) {
// getfromDataBase(database);
// isfavourite["$id"] = false;
// emit(DeletedatabaseState());
// }).catchError((error) {});
// }
//
// ////////////////////////////////////////////////////////////////////////////////////////////
//
// void inserttoDatabase({
// required String typeNav,
// required String navyId,
// }) async {
// database.transaction((txn) async {
// txn
//     .rawInsert(
// 'INSERT INTO favourite(navyType, navyId) VALUES("$typeNav", "$navyId")')
//     .then((value) {
// isfavourite[navyId] = true;
//
// emit(InsertdatabaseState());
//
// getfromDataBase(database);
// emit(GetdatabaseState());
// }).catchError((error) {});
// return null;
// });
// }
// }
// ////////////////////////////////////////////////////////////////////////////////////////////////////////
// abstract class AppCubitStates {}
//
// class AppInitialState extends AppCubitStates {}
//
// class CreatedatabaseState extends AppCubitStates {}
//
// class InsertdatabaseState extends AppCubitStates {}
//
// class DeletedatabaseState extends AppCubitStates {}
//
// class GetdatabaseState extends AppCubitStates {}
//
// class LoadingDatafromDatabase extends AppCubitStates {}
//
// InkWell(
// onTap: () {
// if (DataBaseCubit.get(context)
//     .isfavourite[widget.articleID] ==
// true) {
// DataBaseCubit.get(context).deletaFromDB(
// id: int.parse("${widget.articleID}"));
// } else {
// DataBaseCubit.get(context)
//     .inserttoDatabase(
// typeNav: "article",
// navyId: "${widget.articleID}");
// }
// },
//
//
// child:
//  (DataBaseCubit.get(context)
//     .isfavourite[widget.articleID] ==true)
// ? Icon(
// Icons.favorite,
// color: HexColor("#AB0D03"),
// )
//     : Icon(
// Icons.favorite_outline,
// color: HexColor("#898A8D"),
// ),
// ),