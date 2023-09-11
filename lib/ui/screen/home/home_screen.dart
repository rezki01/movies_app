import 'package:flutter/material.dart';
import 'package:movies_app/common/common.dart';
import 'package:movies_app/ui/screen/tab/tab.dart';
import 'package:movies_app/ui/ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> children = const [
    HomeTab(),
    SearchTab(),
    WatchlistTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: children,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorConstant.background,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetPath.home,
              width: 20,
              color: currentIndex == 0
                  ? Colors.blue
                  : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetPath.search,
              width: 20,
              color: currentIndex == 1
                  ? Colors.blue
                  : Colors.grey,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetPath.watchlist,
              width: 20,
              color: currentIndex == 2
                  ? Colors.blue
                  : Colors.grey,
            ),
            label: 'Watchlist',
          ),
        ],
      ),
    );
  }
}
