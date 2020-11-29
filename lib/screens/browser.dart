import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_info/models/user.dart';
import 'package:covid_info/services/database.dart';
import 'package:covid_info/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserPage extends StatefulWidget {
  String data;

  BrowserPage({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  _BrowserPageState createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        UserData userData = snapshot.data;

        Future addPoints() async {
          await Future.delayed(Duration(milliseconds: 10000));
          return DatabaseService(uid: user.uid)
              .updateUserData(userData.points + 1, userData.name);
        }

        FirebaseFirestore.instance
            .collection('info')
            .doc(user.uid)
            .update({"points": addPoints(), "name": userData.name}).catchError(
                (onError) {
          print("onError");
        });

        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Covid.info"),
            ),
            body: WebView(
              initialUrl: widget.data,
              javascriptMode: JavascriptMode.unrestricted,
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
