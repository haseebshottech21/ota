import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ota/model/user_model.dart';
import 'package:ota/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();
    getUser();
  }

  final user = UsersViewModel();

  getUser() {
    user.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    // UsersViewModel userViewModel = context.watch<UsersViewModel>();
    final userViewModel = Provider.of<UsersViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        child: Column(
          children: [
            _ui(userViewModel),
          ],
        ),
      ),
    );
  }

  _ui(UsersViewModel userViewModel) {
    if (userViewModel.loading) {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: const CupertinoActivityIndicator(),
        ),
      );
    }
    return Expanded(
      child: ListView.separated(
        separatorBuilder: ((context, index) => const Divider()),
        itemCount: userViewModel.userListModel.length,
        itemBuilder: (context, index) {
          UserModel userModel = userViewModel.userListModel[index];
          return SizedBox(
            child: Column(
              children: [
                Text(
                  userModel.data![index].email,
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  userModel.data![index].firstName,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
