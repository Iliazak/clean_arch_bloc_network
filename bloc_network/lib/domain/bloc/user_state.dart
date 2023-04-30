import 'package:bloc_network/data/model/user.dart';

abstract class UserState {}

class UserEmptyState extends UserState {} // состояние когда список пустой

class UserLoadingState extends UserState {
} // состояние когда данные загружаются в список 'индикатор загрузки'

class UserLoadedState extends UserState {
  List<User> loadedUser;
  UserLoadedState({
    required this.loadedUser,
  });
} // состояние когда данные успешно зашгрузились

class UserErrorState extends UserState {
} // состояние когда при загрузке данных произошла ошибка
