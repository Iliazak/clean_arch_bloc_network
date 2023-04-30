import 'package:bloc_network/domain/bloc/user_bloc.dart';
import 'package:bloc_network/domain/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return Center(
          child: Text(
            'No data recived. Please tap button"Load"',
            style: TextStyle(fontSize: 20),
          ),
        );
      }
      if (state is UserLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is UserLoadedState) {
        return ListView.builder(
          itemCount: state.loadedUser.length,
          itemBuilder: (context, index) => Container(
            color: index % 2 == 0 ? Colors.white : Colors.blue[50],
            child: ListTile(
              leading: Text(
                'ID: ${state.loadedUser[index].id}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Column(
                children: [
                  Text(
                    'Name: ${state.loadedUser[index].name}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text(
                        'Email: ${state.loadedUser[index].email}',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'phone: ${state.loadedUser[index].phone}',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
      if (state is UserErrorState) {
        return Center(
          child: Text(
            'Error fetching users',
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }
      return SizedBox.shrink();
    });
  }
}
