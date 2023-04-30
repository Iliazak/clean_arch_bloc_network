import 'package:bloc_network/data/services/user_repository.dart';
import 'package:bloc_network/domain/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/action_buttons.dart';
import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(userRepository: userRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('User List'),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ActionButtons(),
            SizedBox(
              height: 10,
            ),
            Expanded(child: UserList()),
          ],
        ),
      ),
    );
  }
}
