import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/functions/api_services.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ApiServices _apiServices = ApiServices();

  Future<void> getProducts() async {
    emit(GetDataLoading());
    try {
      Response<dynamic> data = await _apiServices.getData(
        'products_table?select=*,favorite_products(*),purchase_table(*)',
      );
      log(data.data.toString());
      emit(GetDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetDataError());
    }
  }
}
