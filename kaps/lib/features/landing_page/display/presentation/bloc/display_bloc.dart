import 'package:bloc/bloc.dart';
import 'package:kaps/core/resources/data_state.dart';
import 'package:kaps/features/landing_page/display/domain/usecases/usecases.dart';
import 'package:meta/meta.dart';

part 'display_event.dart';
part 'display_state.dart';

class DisplayBloc extends Bloc<DisplayEvent, DisplayState> {
  final GetDataUseCase _dataUseCase;
  DisplayBloc(this._dataUseCase) : super(DisplayInitial()) {
    on<DisplayEvent>((event, emit) {});
    on<DisplayInitialEvent>((event, emit) async {
      dynamic res = await _dataUseCase.call();
      if (res is DataSuccess) {
        print(res.data);
        emit(DisplayLoadedState(res.data));
      } else if (res is DataFailed) {
        emit(DisplayError());
      }
    });
    on<cartDataEvent>(
      (event, emit) async {
        String id;
        List<dynamic> cartList = [];
        for (id in event.ids) {
          dynamic res = await _dataUseCase.singleProductFetch(id);
          if (res is DataSuccess) {
            print(res.data);
            cartList.add(res.data);
            emit(cartDataLoadedState(cartList));
          } else if (res is DataFailed) {
            emit(DisplayError());
          }
        }
        print(cartList);
      },
    );
  }
}
