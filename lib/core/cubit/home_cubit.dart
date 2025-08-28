import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/core/functions/api_services.dart';
import 'package:e_commerce/core/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ApiServices _apiServices = ApiServices();
  List<ProductModel> products = [];
  List<ProductModel> searchProducts = [];
  List<ProductModel> categorieProducts = [];
  SupabaseClient client = Supabase.instance.client;
  Future<void> getProducts({String? query, String? categorie}) async {
    emit(GetDataLoading());
    try {
      Response<dynamic> response = await _apiServices.getData(
        'products_table?select=*,favorite_products(*),purchase_table(*)',
      );
      for (var element in response.data) {
        products.add(ProductModel.fromJson(element));
      }
      search(query);
      categories(categorie);
      emit(GetDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetDataError());
    }
  }

  Future addOrDeleteFavorite({required String productId}) async {
    String endpoint =
        '{{baseUrl}}favorite_products?for_user=eq.${client.auth.currentUser!.id}&for_product=eq.$productId';
    emit(AddToFavoriteLoading());
    try {
      Response<dynamic> response = await _apiServices.getData(endpoint);
      if (response.data.isEmpty) {
        await _apiServices.postData(endpoint, {
          "is_favorite": true,
          "for_user": client.auth.currentUser!.id,
          "for_product": productId,
        });
        emit(AddToFavoriteSuccess());
      } else {
        await _apiServices.deleteData(endpoint);
        emit(AddToFavoriteSuccess());
      }
    } catch (e) {
      log(e.toString());
      emit(AddToFavoriteError());
    }
  }

  void search(String? query) {
    if (query != null) {
      for (var product in products) {
        if (product.productName!.toLowerCase().contains(query.toLowerCase())) {
          searchProducts.add(product);
        }
      }
    }
  }

  void categories(String? categorie) {
    if (categorie != null) {
      for (var product in products) {
        if (product.category!.trim().toLowerCase() == categorie.toLowerCase()) {
          categorieProducts.add(product);
        }
      }
    }
  }
}
