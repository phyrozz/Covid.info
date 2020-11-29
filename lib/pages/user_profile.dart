import 'package:covid_info/models/user.dart';
import 'package:covid_info/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:covid_info/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:covid_info/services/database.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          return SafeArea(
            child: Scaffold(
              body: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    height: 380.0,
                    child: DrawerHeader(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 50.0,
                              ),
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/user_thumb.jpg'),
                                radius: 100.0,
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 30.0),
                            child: Center(
                              child: Text(
                                userData.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 28.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(color: Colors.grey[900]),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text("About"),
                    onTap: () {
                      Navigator.of(context).pushNamed('/about');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Log Out"),
                    onTap: () async {
                      await _auth.signOut();
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
