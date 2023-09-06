import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindset_flutter/services/auth_services.dart';

import '../models/post.dart';
import '../utils/app_colors.dart';


class ArticlePreview extends StatefulWidget {
  final Post article;

  const ArticlePreview({
    super.key, 
    required this.article
    });


  @override
  State<ArticlePreview> createState() => _ArticlePreviewState();
}

class _ArticlePreviewState extends State<ArticlePreview> {
 
 AuthService _authService =AuthService();
  
  @override
  Widget build(BuildContext context) {

    //auther
    //title
    //description
    //image preview
    //datetime
    //read time
    //actions: save,favorite,option ,report
    return Container(
      padding: EdgeInsets.all(12),
      color: Colors.grey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height:150 ,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/cover_test.jpg",
                  ), 
                  fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12)
                    ),
            ) ,
          ),
          Row(
            children: [
              CircleAvatar(
               backgroundColor: AppColors.primaryColor,
               radius: 9,
              ),
              SizedBox(width: 6,),
              FutureBuilder<DocumentSnapshot>(
                future: _authService.getUserByUID(widget.article.auther),
                builder: (context, snapshot) {
                  if (snapshot.hasData){
                    Map<String, dynamic> auther = 
                    snapshot.data!.data() as Map<String, dynamic>;
                  return Text(
                    auther['fullname'],
                  style: TextStyle(
                    fontSize: 13, 
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w300),
                  );
                } else{
                  return Text('data');
                }
                }
              ),
             
            ],
            ),
            SizedBox(height: 16,),
            Row(children: [
              Text(
                widget.article.title,
              style: TextStyle(
                fontSize: 18, 
                color: Colors.white,
                fontWeight: FontWeight.bold
                ),
              )
            ],
            ),
             SizedBox(height: 10,),
             Text(
              widget.article.desc,
              softWrap: true,
              maxLines: 2,
              style: TextStyle(fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w300,
              ),
             ),
             SizedBox(height: 24,),
             Row(children: [
              Text(
                '${widget.article.createdAt} - ${widget.article.readTime}',
                 style: TextStyle(
                fontSize: 13, 
                color: Colors.grey.shade300,
                fontWeight: FontWeight.normal
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Icon(CupertinoIcons.bookmark,
                  color: AppColors.primaryColor,
                  size: 17,
                  ),
                  SizedBox(width: 8,),
                  Icon(CupertinoIcons.flag,
                  color: Colors.redAccent,
                  size: 17,),
                ],
              ),
              Icon(CupertinoIcons.ellipsis_vertical,
                  color: Colors.white,
                  ),
             ],
             ),
        ]
        ),
    
    );
  }
}