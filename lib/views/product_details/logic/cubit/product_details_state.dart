part of 'product_details_cubit.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}

final class GetRateLoading extends ProductDetailsState {}

final class GetRateSuccess extends ProductDetailsState {}

final class GetRateError extends ProductDetailsState {}

final class AddOrUpdateRateLoading extends ProductDetailsState {}

final class AddOrUpdateRateSuccess extends ProductDetailsState {}

final class AddOrUpdateRateError extends ProductDetailsState {}
