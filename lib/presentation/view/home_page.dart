import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListViewSeparated(),
    );
  }

  ListView ListViewSeparated() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color:
              index % 2 == 0 ? Colors.orange.shade100 : Colors.purple.shade100,
          child: ListTile(
            onTap: (() {
              if (index % 2 == 0) {
                EasyLoading.instance.backgroundColor = Colors.red;
              } else {
                EasyLoading.instance.backgroundColor = Colors.blue;
              }
            }),
            onLongPress: () {},
            title: Text('asdsad'),
            subtitle: Text('asdasd'),
            leading: CircleAvatar(),
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
      itemCount: 8,
    );
  }
}
