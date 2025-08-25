import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/functions/api_services.dart';
import 'package:e_commerce/views/product_details/logic/models/rate.dart';
import 'package:equatable/equatable.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit( ) : super(ProductDetailsInitial());

  final ApiServices _apiServices = ApiServices();
  List<Rate> rates = [];
  int avgRate = 0;
  Future<void> getRates({required String productId}) async {
    emit(GetRateLoading());
    try {
      Response<dynamic> response = await _apiServices.getData(
        'rates_table?select=*&for_product=eq.$productId',
      );
        for (var element in response.data) {
          rates.add(Rate.fromJson(element));
        }
     

      emit(GetRateSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetRateError());
    }
  }
}
