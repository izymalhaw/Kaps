import 'package:kaps/core/resources/data_state.dart';
import 'package:kaps/features/landing_page/display/domain/entites/entities.dart';

abstract class domainRepositories {
  domainRepositories(Object object);

  Future<DataState<List<ProductEntity>>> getproductData();
  Future<DataState<ProductEntity>> getSingleproductData(String id);
}
