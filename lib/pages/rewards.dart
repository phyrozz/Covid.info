import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_info/models/user.dart';
import 'package:covid_info/services/database.dart';
import 'package:covid_info/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RewardsPage extends StatefulWidget {
  @override
  _RewardsPageState createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Future<void> _showMyDialog() async {
            return showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Insufficient Points'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(
                            'Oops, it seems like you don\'t have enough Awareness Points to claim this.'),
                        Text('Please try again.'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }

          Future<int> _successDialog(int deduction) async {
            UserData userData = snapshot.data;

            return showDialog<int>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Congratulations!'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('Yay! You have now claimed this reward!'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('info')
                            .doc(user.uid)
                            .update({
                          "points": userData.points - deduction,
                          "name": userData.name
                        }).catchError((onError) {
                          print("onError");
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }

          UserData userData = snapshot.data;
          String pointStatus() {
            if (userData.points == 0) {
              return "You don't have points yet. Time to grind by reading articles!";
            } else if (userData.points > 0 && userData.points < 20) {
              return "Looking good so far. Keep it up!";
            } else if (userData.points >= 20) {
              return "You're doing great! You can claim your points for some goodies.";
            } else {
              return "";
            }
          }

          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  actions: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(userData.points.toString()),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(Icons.monetization_on_outlined),
                      ],
                    ),
                  ],
                  expandedHeight: 100.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      "Rewards",
                      style: TextStyle(fontSize: 25.0),
                    ),
                    centerTitle: true,
                    background: Container(
                      padding: EdgeInsets.only(top: 35.0),
                      child: Align(
                          alignment: FractionalOffset.topCenter,
                          child: Text(
                            "EARN MORE POINTS FOR MORE REWARDS",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0)),
                          ),
                          color: Colors.grey[900],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                                child: Text(
                                  "YOUR AWARENESS POINTS",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(25.0),
                                child: Center(
                                    child: Text(
                                  userData.points.toString(),
                                  style: TextStyle(
                                      fontSize: 80.0, color: Colors.white),
                                )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            pointStatus(),
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            if (userData.points < 20) {
                              _showMyDialog();
                            } else {
                              _successDialog(20);
                            }
                          },
                          leading: Icon(Icons.sim_card_outlined),
                          title: Text(
                            "₱5 Load",
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("20"),
                              SizedBox(
                                width: 5.0,
                              ),
                              Icon(Icons.monetization_on_outlined),
                            ],
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            if (userData.points < 40) {
                              _showMyDialog();
                            } else {
                              _successDialog(40);
                            }
                          },
                          leading: Icon(Icons.sim_card_outlined),
                          title: Text(
                            "₱10 Load",
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("40"),
                              SizedBox(
                                width: 5.0,
                              ),
                              Icon(Icons.monetization_on_outlined),
                            ],
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            if (userData.points < 50) {
                              _showMyDialog();
                            } else {
                              _successDialog(50);
                            }
                          },
                          leading: Icon(Icons.sim_card_outlined),
                          title: Text(
                            "₱15 Load",
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("50"),
                              SizedBox(
                                width: 5.0,
                              ),
                              Icon(Icons.monetization_on_outlined),
                            ],
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            if (userData.points < 100) {
                              _showMyDialog();
                            } else {
                              _successDialog(100);
                            }
                          },
                          leading: Icon(Icons.sim_card_outlined),
                          title: Text(
                            "₱30 Load",
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("100"),
                              SizedBox(
                                width: 5.0,
                              ),
                              Icon(Icons.monetization_on_outlined),
                            ],
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            if (userData.points < 150) {
                              _showMyDialog();
                            } else {
                              _successDialog(150);
                            }
                          },
                          leading: Icon(Icons.sim_card_outlined),
                          title: Text(
                            "₱50 Load",
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("150"),
                              SizedBox(
                                width: 5.0,
                              ),
                              Icon(Icons.monetization_on_outlined),
                            ],
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            if (userData.points < 200) {
                              _showMyDialog();
                            } else {
                              _successDialog(200);
                            }
                          },
                          leading: Icon(Icons.sim_card_outlined),
                          title: Text(
                            "₱75 Load",
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("200"),
                              SizedBox(
                                width: 5.0,
                              ),
                              Icon(Icons.monetization_on_outlined),
                            ],
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            if (userData.points < 250) {
                              _showMyDialog();
                            } else {
                              _successDialog(250);
                            }
                          },
                          leading: Icon(Icons.sim_card_outlined),
                          title: Text(
                            "₱100 Load",
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("250"),
                              SizedBox(
                                width: 5.0,
                              ),
                              Icon(Icons.monetization_on_outlined),
                            ],
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            if (userData.points < 300) {
                              _showMyDialog();
                            } else {
                              _successDialog(300);
                            }
                          },
                          leading: Icon(Icons.sim_card_outlined),
                          title: Text(
                            "₱150 Load",
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("300"),
                              SizedBox(
                                width: 5.0,
                              ),
                              Icon(Icons.monetization_on_outlined),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
