import 'package:covid_info/main.dart';
import 'package:covid_info/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid_info/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    print(user);
    // return either Stat or Auth widget
    if (user == null) {
      return Authenticate();
    } else {
      return NavBar();
    }
  }
}
