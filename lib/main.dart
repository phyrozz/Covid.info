import 'package:covid_info/pages/news.dart';
import 'package:covid_info/pages/rewards.dart';
import 'package:covid_info/pages/user_profile.dart';
import 'package:covid_info/route_generator.dart';
import 'package:covid_info/screens/home/statistics.dart';
import 'package:covid_info/screens/wrapper.dart';
import 'package:covid_info/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:covid_info/services/auth.dart';
import 'models/user.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: appTheme,
        title: "Covid.info",
        home: SplashScreenPage(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      backgroundColor: Colors.grey[900],
      image: Image.asset('assets/app_logo.png'),
      photoSize: 150.0,
      loaderColor: Colors.white,
      navigateAfterSeconds: Wrapper(),
    );
  }
}

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  PageController _pageController;
  final List<Widget> _children = [
    StatsPage(),
    NewsPage(),
    RewardsPage(),
    UserPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
          child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: [_children[_currentIndex]],
      )),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[600],
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Statistics",
            backgroundColor: Colors.grey[900],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Rewards",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      //
      //
      //using this page controller you can make beautiful animation effects
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }
}
