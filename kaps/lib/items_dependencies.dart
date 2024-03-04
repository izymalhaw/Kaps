import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kaps/features/landing_page/item_add/data/data_sources/add_items_api_services.dart';
import 'package:kaps/features/landing_page/item_add/data/repositories/repositories.dart';
import 'package:kaps/features/landing_page/item_add/domain/repositories/repositories.dart';
import 'package:kaps/features/landing_page/item_add/domain/usecases/add_item.dart';
import 'package:kaps/features/landing_page/item_add/presentation/bloc/add_items_bloc.dart';

final sl2 = GetIt.instance;

Future<void> ItemsInitializeDependecies() async {
  //Dependecies

  sl2.registerSingleton<AddItemsApiService>(AddItemsApiService(sl2()));
  sl2.registerSingleton<domainRepositories>(repositoriesImpl(sl2()));
  sl2.registerSingleton<AddItemsUseCase>(AddItemsUseCase(sl2()));
  sl2.registerFactory(() => AddItemsBloc(sl2()));
}
