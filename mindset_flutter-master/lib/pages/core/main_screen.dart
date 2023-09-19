// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindset_flutter/pages/core/article/newArticle.dart';
import 'package:mindset_flutter/pages/core/profile_page.dart';
import 'package:mindset_flutter/pages/core/tab_pages/home_page.dart';
import 'package:mindset_flutter/pages/core/write_article.dart';

import '../../utils/app_colors.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
 int _page = 0;
 late PageController _pageController;
 
 @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int p){
    _pageController.jumpToPage(p);
  }
   void onPageChaged(int p){
    setState(() {
      _page = p;
    });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  PageView(
        physics: ScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChaged,
        children: [
          HomePage(),
          Container(color: Colors.orange,),
          Container(color: Colors.purple,),
          Container(color: Colors.teal,),
        ],
      ),
       floatingActionButton: FloatingActionButton(
         onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true, // Allow for full-screen modal
            builder: (BuildContext context) {
              return WriteArticle();
            },
          );
        },
    child: Icon(Icons.add),
    backgroundColor: Colors.green, // You can use any icon you like
  ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 22,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Color.fromARGB(77, 48, 47, 47),
        onTap: navigationTapped,
        currentIndex: _page,
        //type: BottomNavigationBarType.shifting,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
         // ignore: prefer_const_constructors
         BottomNavigationBarItem(
          // ignore: prefer_const_constructors
          icon: Icon(CupertinoIcons.home,fill: 1,),
          label: 'Home',
         ),
         BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.compass,),
          label: 'Explore',
         ),
         BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book,),
          label: 'Favorites',
         ),
         BottomNavigationBarItem(
           icon: GestureDetector(
    onTap: () {

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>ProfilePage()),
      );
    },
    child: Icon(CupertinoIcons.person),
  ),
  label: 'Profile',
         ),
         
        ],
      ),
    );
  }
}