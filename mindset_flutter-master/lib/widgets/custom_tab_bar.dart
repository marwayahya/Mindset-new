import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindset_flutter/pages/core/write_article.dart';


import '../utils/app_colors.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  List<String>tabTitles = [

    "Blochchain",
    "Data Sciences",
    "Machine Learning",
    "Technology",
    "bioTech"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(12),
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tabTitles.length,
        shrinkWrap: true,
        separatorBuilder: (context,index) =>SizedBox(width: 10,),
        itemBuilder: (context,index) =>GestureDetector(
          onTap: () {
            if(index== 0) {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => WriteArticle()));
            }
          },
          child: _buildTabChip(tabTitles [index])),
      ),
    );
  } 

  Widget _buildTabChip(String title) {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 230, 233, 230).withOpacity(.8),
      borderRadius: BorderRadius.all(Radius.circular(100))
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Center(
        child: Text(title,
        style: TextStyle(color: Color.fromARGB(255, 80, 80, 80),
        fontSize: 20),),
      ),
    );
  }
}