import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/core/functions/api_services.dart';
import 'package:e_commerce/core/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ApiServices _apiServices = ApiServices();
  List<ProductModel> products = [];
  List<ProductModel> searchProducts = [];
  Future<void> getProducts({String? query}) async {
    emit(GetDataLoading());
    try {
      Response<dynamic> response = await _apiServices.getData(
        'products_table?select=*,favorite_products(*),purchase_table(*)',
      );
      for (var element in response.data) {
        products.add(ProductModel.fromJson(element));
      }
      search(query);
      emit(GetDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetDataError());
    }
  }

  void search(String? query) {
    for (var product in products) {
      if (product.productName!.toLowerCase().contains(query!.toLowerCase())) {
        searchProducts.add(product);
      }
    }
  }
}
