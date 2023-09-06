import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindset_flutter/services/articles_services.dart';
import 'package:mindset_flutter/services/auth_services.dart';

import '../../../models/post.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/artical_bar.dart';

class ArticleDetails extends StatefulWidget {
  final Post article;
  final String docID;
  const ArticleDetails({
    super.key, 
    required this.docID,
    required this.article});
  

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  AuthService _authService = AuthService();
  ArticleServices _articleServices = ArticleServices();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

 
  //bool _isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArticleBar(), 
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.primaryColor,
                  ),
                  SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder<DocumentSnapshot>(
                        future: _authService.getUserByUID(widget.article.auther),
                        builder: (context, snapshot) {
                          if(snapshot.hasData) {
                             Map<String, dynamic> autherDetails = 
                             snapshot.data!.data() as Map<String, dynamic>;
                          return Row(
                            children: [
                              Text(
                              autherDetails['fullname'],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                              ),
                              SizedBox(width: 12,),
                              TextButton.icon(
                                onPressed: (){}, 
                                icon: Icon(CupertinoIcons.person_add,
                                color: AppColors.primaryColor,
                                size: 18, 
                                ),
                                label: Text(
                                  'follow', 
                                  style: TextStyle(
                                    color: AppColors.primaryColor),
                                    ),
                                    ),
                            ],
                          );
                          }else {
                           return SizedBox.shrink();
                          }
                        }
                      ),
                      
                      Text(
                 '${widget.article.createdAt} - ${widget.article.readTime}',
                   style: TextStyle(
                  fontSize: 13, 
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.normal
                  ),
                ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 22,),
              Row(
                children: [
                  Text(
                    widget.article.title,
                    style: TextStyle(
                      fontSize: 24,
                      color:Colors.white60,
                      fontWeight: FontWeight.bold,
                      ),
                      ),
                ],
              ),
                  SizedBox(height: 22,),
                  Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.2),
               borderRadius: BorderRadius.all(
                Radius.circular(12))
              ) ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      setState(() {
                        if (widget.article.likedBy!
                        .contains(_firebaseAuth.currentUser!.uid)) {
                        _articleServices.removeLike(widget.docID);
                      } else {
                        _articleServices.addLike(widget.docID);
                        
                       
                      }
                      });
                      print('hello');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          widget.article.likedBy!
                        .contains(_firebaseAuth.currentUser!.uid)
                         
                         ? CupertinoIcons.heart_fill 
                         : CupertinoIcons.heart,
                          color: widget.article.likedBy!
                        .contains(_firebaseAuth.currentUser!.uid)
                        ? Colors.redAccent
                        : AppColors.primaryColor,
                          ),
                        SizedBox(width: 8,),
                        Text(
                          widget.article.likedBy!.length.toString() , 
                        style: TextStyle(
                          color: AppColors.primaryColor
                          ),
                          ),
                      ],
                    ),
                  ),
                  
                  Row(
                    children: [
                      Icon(CupertinoIcons.chat_bubble, 
                      color: AppColors.primaryColor,
                      ),
                      SizedBox(width: 8,),
                      Text(
                       widget.article.nbComments.toString(), 
                      style: TextStyle(
                        color: AppColors.primaryColor
                        ),
                        ),
                    ],
                  ),
                   
                  Row(
                    children: [
                      Icon(CupertinoIcons.eye, 
                      color: AppColors.primaryColor,
                      ),
                      SizedBox(width: 8,),
                      Text(
                        widget.article.nbShares.toString(), 
                      style: TextStyle(
                        color: AppColors.primaryColor
                        ),
                        ),
                    ],
                  ),
                   
                  Row(
                    children: [
                      Icon(CupertinoIcons.share, 
                      color: AppColors.primaryColor,
                      ),
                      SizedBox(width: 8,),
                      Text(
                        widget.article.nbViews.toString(), 
                      style: TextStyle(
                        color: AppColors.primaryColor
                        ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 22,),
            Text(
                widget.article.content,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  color:Colors.white,
                  fontWeight: FontWeight.normal,
                  ),
                  ),
          ],
          ),
        ),
        ),
        ),
    );
  }
}