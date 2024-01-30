import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_task_project/app/voco_app.dart';
import 'package:voco_task_project/data/resources/authantication/authantication_manager.dart';
import 'package:voco_task_project/data/resources/route_manager/route_constant.dart';
import 'package:voco_task_project/main.dart';

class UserListView extends ConsumerStatefulWidget {
  UserListView({Key? key}) : super(key: key);

  @override
  ConsumerState<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends ConsumerState<UserListView>
    with _PageProperties {
  @override
  void initState() {
    // getUserList();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getUserList();
      setState(() {});
    });
    super.initState();
  }

  Future<void> getUserList() async {
    await ref.read(UserListProvider).getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _pageWillPopScope,
      onPopInvoked: (didPop) {},
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                color: Colors.white,
                onPressed: () {
                  _logout(context);
                },
                icon: Icon(Icons.logout_outlined))
          ],
          backgroundColor: Colors.purple.shade600,
          automaticallyImplyLeading: false,
          title: Center(
              child: Text(
            _appbarTitle,
            style: TextStyle(color: Colors.white),
          )),
        ),
        body: Consumer(
          builder: (_, WidgetRef ref, __) {
            return _buildListViewSeperated();
          },
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
                   AuthManager.instance.logoutController().then((value) {
      Navigator.pushReplacementNamed(
          context, RouteConstant.loginRoute);
    });
  }

  ListView _buildListViewSeperated() {
    return ListView.separated(
      itemCount: ref.read(UserListProvider).userListResponseModel != null
          ? ref.read(UserListProvider).userListResponseModel!.userList.length
          : 0,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Color.fromARGB(255, 250, 243, 243),
          child: ListTile(
            onLongPress: () {},
            title: Text(ref
                    .read(UserListProvider)
                    .userListResponseModel!
                    .userList[index]
                    .firstName +
                ref
                    .read(UserListProvider)
                    .userListResponseModel!
                    .userList[index]
                    .lastName),
            subtitle: Text(ref
                .read(UserListProvider)
                .userListResponseModel!
                .userList[index]
                .email),
            leading: CircleAvatar(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: Image.network(ref
                  .read(UserListProvider)
                  .userListResponseModel!
                  .userList[index]
                  .avatar),
            )),
          ),
        );
      },
      separatorBuilder: (context, index) {
        Padding(padding: EdgeInsets.all(12));

        return SizedBox();
      },
    );
  }
}

mixin _PageProperties {
  final bool _pageWillPopScope = false;
  final String _appbarTitle = "User List";
}
