part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetDataLoading extends HomeState {}

final class GetDataSuccess extends HomeState {}

final class GetDataError extends HomeState {}

final class AddOrDeleteFavoriteLoading extends HomeState {}

final class AddOrDeleteFavoriteSuccess extends HomeState {}

final class AddOrDeleteFavoriteError extends HomeState {}
