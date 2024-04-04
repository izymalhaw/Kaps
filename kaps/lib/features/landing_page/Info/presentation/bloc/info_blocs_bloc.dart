import 'package:bloc/bloc.dart';
import 'package:kaps/core/resources/data_state.dart';
import 'package:kaps/features/landing_page/Info/domain/usecases/info.dart';
import 'package:kaps/features/landing_page/item_add/presentation/bloc/add_items_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'info_blocs_event.dart';
part 'info_blocs_state.dart';

class InfoBlocsBloc extends Bloc<InfoBlocsEvent, InfoBlocsState> {
  final info _info;
  InfoBlocsBloc(this._info) : super(InfoBlocsInitial()) {
    on<InfoBlocsEvent>((event, emit) {});
    on<FetchHistory>(
      (event, emit) async {
        dynamic res = await _info.getAllItem(event.Phone);
        if (res is DataSuccess) {
          emit(History(res.data));
        } else {
          print("error");
        }
      },
    );
    on<updateAccountEvent>(
      (event, emit) async {
        String id = await retriveId();
        _info
            .updateAgentAccount(id, event.accountName, event.accountNumber)
            .then((value) {});
      },
    );
  }
  Future<String> retriveId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('agentid').toString();
  }
}
