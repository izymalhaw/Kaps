import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitialState()) {
    on<LanguageEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LanguageLoading>(
      (event, emit) {
        emit(LanguageLoadingState(event.lang));
      },
    );
  }
}
