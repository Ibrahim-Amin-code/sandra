// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sandra_app/network/cache/cache_helper.dart';
// import 'package:sandra_app/network/dio/dio_helper.dart';
// import 'package:sandra_app/network/end_points.dart';
// import 'package:sandra_app/screens/checkout/checkout_cubit/states.dart';
//
// class CheckoutCubit extends Cubit<CheckoutState> {
//   CheckoutCubit() : super(CheckoutInitialState());
//
//   static CheckoutCubit get(context) => BlocProvider.of(context);
//
//   List addressesData=[];
//
//   void getAddresses()async {
//     emit(CheckoutLoadingState());
//     String token = await CacheHelper.getData(key: 'token');
//     DioHelper.getData(
//       url: GetAddresses,
//       query: {
//         'buyerId':'2',
//       },
//         token: 'Bearer $token',
//     ).then((value) {
//       addressesData.addAll(value.data['data']);
//       print(value.data);
//       emit(CheckoutSuccessState());
//     }).catchError((error){
//       emit(CheckoutErrorState(error));
//       print(error.toString());
//     });
//
//   }
// }