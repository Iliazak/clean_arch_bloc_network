import 'package:bloc_network/domain/bloc/user_bloc.dart';
import 'package:bloc_network/domain/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {
            _userBloc.add(UserLoadEvent());
          },
          child: Text('Load'),
          backgroundColor: Colors.green,
        ),
        SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            _userBloc.add(UserClearEvent());
          },
          child: Text('Clear'),
          backgroundColor: Colors.red,
        ),
      ],
    );
  }
}
