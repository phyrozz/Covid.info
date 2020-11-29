import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Covid News",
              style: TextStyle(fontSize: 25.0),
            ),
            centerTitle: true,
            background: Container(
              padding: EdgeInsets.only(top: 35.0),
              child: Align(
                  alignment: FractionalOffset.topCenter,
                  child: Text(
                    "EARN REWARDS BY READING THESE ARTICLES",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
          pinned: true,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/browser',
                  arguments:
                      "https://www.gmanetwork.com/news/news/world/766057/worldwide-coronavirus-cases-cross-61-56m-death-toll-at-1-442-309-reuters-tally/story/");
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/news_thumb4.jpg',
                          ),
                        ),
                      ),
                      height: 200.0,
                    ),
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.grey.withOpacity(0.0),
                                Colors.black,
                              ],
                              stops: [
                                0.0,
                                1.0
                              ])),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                      height: 200.0,
                      child: Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: Text(
                          "Worldwide coronavirus cases cross 61.56M, death toll at 1,442,309 —Reuters tally",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/browser',
                  arguments:
                      "https://www.google.com/amp/s/globalnation.inquirer.net/192350/fwd-ph-to-get-up-to-50-million-doses-of-covid-19-vaccines-from-chinas-sinovac-galvez/amp");
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/news_thumb1.jpg',
                          ),
                        ),
                      ),
                      height: 200.0,
                    ),
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.grey.withOpacity(0.0),
                                Colors.black,
                              ],
                              stops: [
                                0.0,
                                1.0
                              ])),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                      height: 200.0,
                      child: Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: Text(
                          "PH to get up to 50 million doses of COVID-19 vaccines from China’s Sinovac–Galvez",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/browser',
                  arguments:
                      "https://www.google.com/amp/s/www.medicalnewstoday.com/amp/articles/high-blood-sugar-could-increase-covid-19-death-risk-in-those-without-diabetes");
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/news_thumb2.jpg',
                          ),
                        ),
                      ),
                      height: 200.0,
                    ),
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.grey.withOpacity(0.0),
                                Colors.black,
                              ],
                              stops: [
                                0.0,
                                1.0
                              ])),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                      height: 200.0,
                      child: Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: Text(
                          "COVID-19: High blood sugar raises death risk in those without diabetes",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/browser',
                  arguments: "https://www.webmd.com/lung/coronavirus");
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/news_thumb3.jpg',
                          ),
                        ),
                      ),
                      height: 200.0,
                    ),
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.grey.withOpacity(0.0),
                                Colors.black,
                              ],
                              stops: [
                                0.0,
                                1.0
                              ])),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                      height: 200.0,
                      child: Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: Text(
                          "Coronavirus and COVID-19: What You Should Know",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/browser',
                  arguments:
                      "https://www.gmanetwork.com/news/news/nation/766053/imee-marcos-urges-return-to-face-to-face-classes-in-some-areas/story/");
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/news_thumb5.jpg',
                          ),
                        ),
                      ),
                      height: 200.0,
                    ),
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.grey.withOpacity(0.0),
                                Colors.black,
                              ],
                              stops: [
                                0.0,
                                1.0
                              ])),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                      height: 200.0,
                      child: Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: Text(
                          "Imee Marcos urges return to face-to-face classes in some areas",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/browser',
                  arguments:
                      "https://news.abs-cbn.com/overseas/11/29/20/virus-surge-leads-to-curfew-in-san-francisco");
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/default_news_thumb.jpg',
                          ),
                        ),
                      ),
                      height: 200.0,
                    ),
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.grey.withOpacity(0.0),
                                Colors.black,
                              ],
                              stops: [
                                0.0,
                                1.0
                              ])),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                      height: 200.0,
                      child: Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: Text(
                          "Virus surge leads to curfew in San Francisco",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ])),
      ],
    );
  }
}
