import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindset_flutter/models/post.dart';
import 'package:mindset_flutter/services/articles_services.dart';
import 'package:mindset_flutter/utils/app_colors.dart';
import '../../../widgets/article_preview.dart';
import '../../../widgets/custom_bar.dart';
import '../../../widgets/custom_tab_bar.dart';
import '../article/article_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

ArticleServices _articleServices = ArticleServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
           child:  Column(
            children: [
              CustomBar(),
              SizedBox(height: 4,),
              CustomTabBar(),
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
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context,index)  {
                      
                      Post post =Post(
                        title: snapshot.data!.docs[index]['title'], 
                        desc: snapshot.data!.docs[index]['desc'], 
                        content: snapshot.data!.docs[index]['content'], 
                        auther: snapshot.data!.docs[index]['auther'], 
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
                      }, child: ArticlePreview(
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
        );
  
  }
}