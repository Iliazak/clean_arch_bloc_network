import 'package:bloc_network/data/model/user.dart';
import 'package:bloc_network/data/services/user_repository.dart';
import 'package:bloc_network/domain/bloc/user_event.dart';
import 'package:bloc_network/domain/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository; // передаем сотсояние репозитория
  UserBloc({required this.userRepository}) : super(UserEmptyState()) {
    // загружаем пустой список
    on<UserLoadEvent>((event, emit) async {
      //  отображение индикатора загрузки
      emit(UserLoadingState());
      // блок отработки ошибок загрузки
      try {
        final List<User> loadedUserList = await userRepository
            .getAllUsers(); // здесь находяться все пользователи loadedUserList'
        emit(UserLoadedState(loadedUser: loadedUserList));
      } catch (_) {
        UserErrorState();
      }
    });
    // события по кнопке Clear
    on<UserClearEvent>((event, emit) async {
      UserEmptyState();
    });
  }
}
