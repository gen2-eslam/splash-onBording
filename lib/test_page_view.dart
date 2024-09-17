
import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  List<String> title = ["page1", "page2", "page3"];
  int selectedIndex = 0;
  PageController pageController = PageController();

  List<Widget> pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        pageController.animateToPage(2,
            duration: const Duration(seconds: 3), curve: Curves.bounceInOut);
      }),
      appBar: AppBar(
        title: Text(title[selectedIndex]),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: pages.length,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
            pageController.jumpToPage(value);
          });
        },
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.face), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: ""),
        ],
      ),
    );
  }
}
