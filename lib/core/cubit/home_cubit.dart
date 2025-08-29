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
  List<ProductModel> favoriteProductsList = [];
  SupabaseClient client = Supabase.instance.client;
  Map<String, bool> favoriteProductsInHome = {};
  Future<void> getProducts({
    String? query,
    String? categorie,
    bool? isFavoriteView,
  }) async {
    emit(GetDataLoading());
    try {
      Response<dynamic> response = await _apiServices.getData(
        'products_table?select=*,favorite_products(*),purchase_table(*)',
      );
      for (var element in response.data) {
        products.add(ProductModel.fromJson(element));
      }
      getFavoriteProducts(isFavoriteView);
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
        'favorite_products?for_user=eq.${client.auth.currentUser!.id}&for_product=eq.$productId';
    emit(AddOrDeleteFavoriteLoading());
    try {
      Response<dynamic> response = await _apiServices.getData(endpoint);
      if (response.data.isEmpty) {
        await _apiServices.postData(endpoint, {
          "is_favorite": true,
          "for_user": client.auth.currentUser!.id,
          "for_product": productId,
        });
        favoriteProductsInHome.addAll({productId: true});
        emit(AddOrDeleteFavoriteSuccess());
      } else {
        await _apiServices.deleteData(endpoint);
        favoriteProductsInHome.removeWhere((key, value) => key == productId);
        products = [];
        await getProducts();
        emit(AddOrDeleteFavoriteSuccess());
      }
    } catch (e) {
      log(e.toString());
      emit(AddOrDeleteFavoriteError());
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

  void getFavoriteProducts(bool? isFavoriteView) {
    favoriteProductsList.clear();
    for (var product in products) {
      if (product.favoriteProducts!.isNotEmpty) {
        if (product.favoriteProducts!.first.forUser ==
            client.auth.currentUser!.id) {
          favoriteProductsList.add(product);
          favoriteProductsInHome.addAll({product.id.toString(): true});
        }
      }
    }
  }

  bool checkIsFavorite(String productId) {
    return favoriteProductsInHome.containsKey(productId);
  }
}
