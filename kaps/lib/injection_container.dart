import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kaps/features/authentication/data/data_sources/remote/get_farmer_data_api_service.dart';
import 'package:kaps/features/authentication/data/repositories/repositories.dart';
import 'package:kaps/features/authentication/domain/repositories/repositories.dart';
import 'package:kaps/features/authentication/domain/usecases/get_farmer_data.dart';
import 'package:kaps/features/authentication/presentation/bloc/Auth_bloc.dart';

final sl = GetIt.instance;

Future<void> InitializeDependecies() async {
  //Dependecies
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<GetFarmerDataApiService>(GetFarmerDataApiService(sl()));
  sl.registerSingleton<domainRepositories>(repositoriesImpl(sl()));
  sl.registerSingleton<GetFarmerDataUseCase>(GetFarmerDataUseCase(sl()));
  sl.registerFactory(() => AuthBloc(sl()));
}
