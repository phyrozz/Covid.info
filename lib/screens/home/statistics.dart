import 'package:flutter/material.dart';
import 'package:covid_info/covid_data.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  String confirmedCases = 'Loading...';
  String confirmedDeaths = 'Loading...';
  String confirmedRecoveries = 'Loading...';
  String phConfirmedCases = 'Loading...';
  String phConfirmedDeaths = 'Loading...';
  String phConfirmedRecoveries = 'Loading...';

  void getCovidData() async {
    CovidData instance = CovidData();
    await instance.getData();
    setState(() {
      confirmedCases = instance.confirmedCases;
      confirmedDeaths = instance.confirmedDeaths;
      confirmedRecoveries = instance.confirmedRecoveries;
      phConfirmedCases = instance.phConfirmedCases;
      phConfirmedDeaths = instance.phConfirmedDeaths;
      phConfirmedRecoveries = instance.phConfirmedRecoveries;
    });
  }

  @override
  void initState() {
    super.initState();
    getCovidData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Covid Statistics",
                style: TextStyle(fontSize: 25.0),
              ),
              centerTitle: true,
              background: Container(
                padding: EdgeInsets.only(top: 35.0),
                child: Align(
                    alignment: FractionalOffset.topCenter,
                    child: Text(
                      "CHECK THE CURRENT SITUATION BY NUMBERS",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
            pinned: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              height: 80.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      "Worldwide",
                      style: TextStyle(fontSize: 32.0),
                    ),
                  ),
                ],
              ),
            ),
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
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                    child: Text(
                      "TOTAL CASES",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(25.0),
                    child: Center(
                        child: Text(
                      confirmedCases,
                      style: TextStyle(fontSize: 60.0, color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),
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
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                    child: Text(
                      "TOTAL DEATHS",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(25.0),
                    child: Center(
                        child: Text(
                      confirmedDeaths,
                      style: TextStyle(fontSize: 60.0, color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),
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
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                    child: Text(
                      "TOTAL RECOVERIES",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(25.0),
                    child: Center(
                        child: Text(
                      confirmedRecoveries,
                      style: TextStyle(fontSize: 60.0, color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),
            Container(
              height: 80.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      "Covid in the Philippines",
                      style: TextStyle(fontSize: 32.0),
                    ),
                  ),
                ],
              ),
            ),
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
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                    child: Text(
                      "TOTAL CASES",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(25.0),
                    child: Center(
                        child: Text(
                      phConfirmedCases,
                      style: TextStyle(fontSize: 60.0, color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),
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
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                    child: Text(
                      "TOTAL DEATHS",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(25.0),
                    child: Center(
                        child: Text(
                      phConfirmedDeaths,
                      style: TextStyle(fontSize: 60.0, color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),
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
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                    child: Text(
                      "TOTAL RECOVERIES",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(25.0),
                    child: Center(
                        child: Text(
                      phConfirmedRecoveries,
                      style: TextStyle(fontSize: 60.0, color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),
          ])),
        ],
      ),
    );
  }
}
