// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindset_flutter/models/post.dart';
import 'package:mindset_flutter/services/articles_services.dart';
import 'package:mindset_flutter/utils/app_colors.dart';
import 'package:mindset_flutter/widgets/article_preview_exp.dart';
import '../../../widgets/article_preview.dart';
import '../../../widgets/custom_bar.dart';
import '../../../widgets/custom_tab_bar.dart';
import '../article/article_details.dart';
import '../article/newArticle.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
 ArticleServices _articleServices = ArticleServices();
TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: SingleChildScrollView(
           child:  DefaultTabController(
            length: 3,
             initialIndex: 1,
             child: Column(
              children: [
                CustomBar(text: 'Explore',),
                Column(
                  children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    
                    child: TextField(
                    
                    controller: _search,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 88, 88, 88),
                            
                    ),
                    
                    decoration: InputDecoration (
                    filled: true,
                    fillColor: Color.fromARGB(255, 238, 235, 235).withOpacity(.8),
                      hintText: "Search Mindset",
                      hintStyle: TextStyle(color: Colors.grey)  ,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          
                          width: 1,
                        )
                        ),
                  
                      prefixIcon: Icon(
                        Icons.search, 
                        color:  Color.fromARGB(255, 56, 56, 56),)
                    ),
                                  ),
                  ),
                    SizedBox(height: 4,),
                  ],
                ),
       CustomTabBar(),
       Divider( // Add a divider here
                color: Colors.grey, // Set the color of the divider line
                thickness: 1.0, // Set the thickness of the divider line
              ),
              Row( // Use a Row to align text and icon
                  children: [
                    Icon(
                      Icons.trending_up, // Replace with your preferred trending icon
                      color: Colors.grey,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Trending on Mindset",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 63, 63, 63),
                        fontSize: 20
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                
                StreamBuilder<QuerySnapshot>(
                  stream: _articleServices.fetchAllArticles(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print('list lenght ${snapshot.data!.docs.length}');
                      print('list lenght ${snapshot.data!.docs}');
                      return ListView.separated(
                      itemCount: snapshot.data!.docs.length,
                      physics: const NeverScrollableScrollPhysics(),
                      
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) {
    
    return Divider(
      color: Colors.grey, 
      thickness: 1.0,    
    );
  },
                      itemBuilder: (context,index)  {
                        
                        Post post =Post(
                          title: snapshot.data!.docs[index]['title'], 
                          
                          content: snapshot.data!.docs[index]['content'], 
                          author: snapshot.data!.docs[index]['author'], 
                          createdAt: snapshot.data!.docs[index]['created_at'].toDate().toString(), 
                          readTime: snapshot.data!.docs[index]['read_time'],
                          nbLikes: snapshot.data!.docs[index]['nb_likes'],
                          nbViews: snapshot.data!.docs[index]['nb_views'],
                          nbComments: snapshot.data!.docs[index]['nb_comments'],
                          nbShares: snapshot.data!.docs[index]['nb_shares'],
                          likedBy: snapshot.data!.docs[index]['liked_by'] ?? 
                          List.empty(growable: true),
                          );
                      
                        return GestureDetector(
                        onTap: () {
                          print('test');
                        
                        Navigator.push(
                          context, 
                          CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => ArticleDetails(
                            docID: snapshot.data!.docs[index].id,
                            article: post,)
                          ),
                          );
                        }, child: ArticlePreviewExp(
                          article: post,
                        ),
                        );
                      } 
                     
                      );
           
                    } else {
                      return Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor),
                          )
                        ],
                        );
                    }
                    
                    
                  }
                  
                ),
                
                     
               ]
             ),
           ),
           
        ),
        );
  
  }
}