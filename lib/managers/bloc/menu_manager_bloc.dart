import 'package:bloc/bloc.dart';
import 'menu_manager_event.dart';
import 'menu_manager_state.dart';

class MenuManagerBloc extends Bloc<MenuManagerEvent, MenuManagerState> {
  MenuManagerBloc() : super(MenuManagerState.initial()) {
    on<MenuItemSelected>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });
  }
}
