import 'package:get_it/get_it.dart';
import 'package:kaps/features/landing_page/display/data/data_source/fetch_all_products_api_service.dart';
import 'package:kaps/features/landing_page/display/data/repositories/repositories.dart';
import 'package:kaps/features/landing_page/display/domain/repositories/repositories.dart';
import 'package:kaps/features/landing_page/display/domain/usecases/usecases.dart';
import 'package:kaps/features/landing_page/display/presentation/bloc/display_bloc.dart';

final sl4 = GetIt.instance;

Future<void> displayInitializeDependecies() async {
  //Dependecies

  sl4.registerSingleton<FetchAllProducts>(FetchAllProducts(sl4()));
  sl4.registerSingleton<domainRepositories>(repositoriesImpl(sl4()));
  sl4.registerSingleton<GetDataUseCase>(GetDataUseCase(sl4()));
  sl4.registerFactory(() => DisplayBloc(sl4()));
}