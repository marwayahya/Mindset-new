import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindset_flutter/pages/core/tab_pages/home_page.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 22,
        backgroundColor: Colors.black,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.white30,
        onTap: navigationTapped,
        currentIndex: _page,
        //type: BottomNavigationBarType.shifting,
        items: [
         BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home,),
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
         
        ],
      ),
    );
  }
}