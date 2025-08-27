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
  var userId = Supabase.instance.client.auth.currentUser!.id;
  List<Rate> rates = [];
  int avgRate = 0;
  int numOfRates = 0;
  int userRate = 5;
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
      _getUserRate();
      numOfRates = rates.length;
      emit(GetRateSuccess());
    } catch (e) {
      emit(GetRateError());
    }
  }

  Future<void> addOrUpdateRate({
    required String productId,
    required Map<String, dynamic> data,
  }) async {
    String endpoint =
        'rates_table?select=*&for_product=eq.$productId&for_user=eq.$userId';
    emit(AddOrUpdateRateLoading());
    try {
      if (_chackIsUserRate(productId)) {
        await _apiServices.patchData(endpoint, data);
      } else {
        await _apiServices.postData(endpoint, data);
      }
      emit(AddOrUpdateRateSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddOrUpdateRateError());
    }
  }


  Future<void> addComment({
    required Map<String, dynamic> data,
  }) async {
    String endpoint = 'comments_table';
    emit(AddCommentLoading());
    try {
      await _apiServices.postData(endpoint, data);
      emit(AddCommentSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddCommentError());
    }
  }

  void _getUserRate() {
    List<Rate> userRates = rates
        .where((rate) => rate.forUser == userId)
        .toList();
    if (userRates.isNotEmpty) {
      userRate = userRates[0].rate!;
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

  bool _chackIsUserRate(String productId) {
    for (var rate in rates) {
      if (rate.forProduct == productId && rate.forUser == userId) {
        return true;
      }
    }
    return false;
  }
}
