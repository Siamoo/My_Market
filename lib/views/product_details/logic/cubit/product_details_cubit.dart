import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/core/functions/api_services.dart';
import 'package:e_commerce/views/product_details/logic/models/rate.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  final ApiServices _apiServices = ApiServices();
  List<Rate> rates = [];
  int avgRate = 0;
  int userRate = 4;
  Future<void> getRates({required String productId}) async {
    emit(GetRateLoading());
    try {
      Response<dynamic> response = await _apiServices.getData(
        'rates_table?select=*&for_product=eq.$productId',
      );
      for (var element in response.data) {
        rates.add(Rate.fromJson(element));
      }
      _getAvgRate();
      List<Rate> userRates = rates
          .where(
            (rate) =>
                rate.forUser == Supabase.instance.client.auth.currentUser!.id,
          )
          .toList();
      if (userRates.isNotEmpty) {
        userRate = userRates[0].rate!;
      }
      emit(GetRateSuccess());
    } catch (e) {
      emit(GetRateError());
    }
  }

  void _getAvgRate() {
    if (rates.isNotEmpty) {
      int total = 0;
      for (var rate in rates) {
        total += rate.rate!;
      }
      avgRate = (total / rates.length).toInt();
    }
  }
}
