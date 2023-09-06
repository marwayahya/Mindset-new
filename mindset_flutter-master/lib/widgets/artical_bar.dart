
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ArticleBar extends StatefulWidget {
  const ArticleBar({super.key});

  @override
  State<ArticleBar> createState() => _ArticleBarState();
}

class _ArticleBarState extends State<ArticleBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          InkResponse(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              CupertinoIcons.arrow_left,
              color: Colors.white,
              size: 26,
              ),
          ),
            Spacer(),
             InkResponse(
            onTap: () {
              
            },
            child: Icon(
              CupertinoIcons.play_circle,
              color: Colors.white,
              size: 26,
              ),
          ),
            SizedBox(width: 12,),
            InkResponse(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              CupertinoIcons.bookmark,
              color: AppColors.primaryColor.withOpacity(.8),
              size: 26,
              ),
          ),
            SizedBox(width:12,),
             InkResponse(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              CupertinoIcons.share,
              color: Colors.white,
              size: 26,
              ),
          ),
            SizedBox(width: 12,),
             InkResponse(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              CupertinoIcons.ellipsis_vertical,
              color: Colors.white,
              size: 26,
              ),
          ),
          
        ],
      ),
    );
  }
}