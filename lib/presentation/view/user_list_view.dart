import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_task_project/app/voco_app.dart';

class UserListView extends ConsumerStatefulWidget {
  UserListView({Key? key}) : super(key: key);

  @override
  ConsumerState<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends ConsumerState<UserListView> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade600,
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'User List',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Consumer(
        builder: (_, WidgetRef ref, __) {
          // return Card();
          return
              // ref.read(UserListProvider).isFetchSuccess
              //     ?
              _buildListViewSeperated();
          // : Card();
        },
      ),
    );
  }

  ListView _buildListViewSeperated() {
    return ListView.separated(
      itemCount:
          ref.read(UserListProvider).userListResponseModel!.userList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.red,
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
                child: Image.network(ref
                    .read(UserListProvider)
                    .userListResponseModel!
                    .userList[index]
                    .avatar)),
          ),
        );
      },
      separatorBuilder: (context, index) {
        var newindex = index + 1;
        if (newindex % 4 == 0) {
          return Divider(
            thickness: 2,
            color: Colors.teal,
          );
        }
        return SizedBox();
      },
    );
  }
}
