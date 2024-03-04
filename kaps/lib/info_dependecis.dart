import 'package:get_it/get_it.dart';
import 'package:kaps/features/landing_page/Info/data/data_sources/info_data_api_services.dart';
import 'package:kaps/features/landing_page/Info/data/repositories/repositories.dart';
import 'package:kaps/features/landing_page/Info/domain/repositories/repositoris.dart';
import 'package:kaps/features/landing_page/Info/domain/usecases/info.dart';
import 'package:kaps/features/landing_page/Info/presentation/bloc/info_blocs_bloc.dart';

final sl3 = GetIt.instance;

Future<void> InfoInitializeDependecies() async {
  //Dependecies

  sl3.registerSingleton<infoDataApiService>(infoDataApiService(sl3()));
  sl3.registerSingleton<domainRepositories>(repositoriesImpl(sl3()));
  sl3.registerSingleton<info>(info(sl3()));
  sl3.registerFactory(() => InfoBlocsBloc(sl3()));
}
