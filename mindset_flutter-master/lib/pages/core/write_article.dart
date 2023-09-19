import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:mindset_flutter/models/post.dart';
import 'package:mindset_flutter/services/articles_services.dart';
import 'package:mindset_flutter/utils/date_helper.dart';

import '../../utils/app_colors.dart';

class WriteArticle extends StatefulWidget {
  const WriteArticle({super.key});

  @override
  State<WriteArticle> createState() => _WriteArticleState();
}

class _WriteArticleState extends State<WriteArticle> {
  ArticleServices _articleServices = ArticleServices();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  TextEditingController _title = TextEditingController();
  TextEditingController _content = TextEditingController();
  TextEditingController _desc = TextEditingController();
  QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.secondaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 32),
            Row(
              children: [
                Text(
                  'Write new article', 
                  style: TextStyle(
                     color: Colors.black, 
                     fontSize:  25, 
                     fontWeight: FontWeight.bold
                            ),
                     ),

              ],
            ),
            SizedBox(height: 26),
            TextField(
                  controller: _title,
                  style: TextStyle(
                    color: Colors.grey,
          
                  ),
                  decoration: InputDecoration (
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.grey)  ,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        
                        width: 1,
                      )
                      ),

                    prefixIcon: Icon(
                      Icons.title, 
                      color:  Colors.grey,)
                  ),
                ),
                SizedBox(height: 14),
      
                TextField(
                  controller: _desc,
                  style:  TextStyle(
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  decoration: const InputDecoration (
                    hintText: "Read Time",
                    hintStyle: TextStyle(color: Colors.grey)  ,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        
                        width: 1,
                      )
                      ),

                    prefixIcon: Icon(
                      Icons.access_time, 
                      color:  Colors.grey,)
                  ),
                                        keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered

                ),
                SizedBox(height: 14),
      
                Column(
                  children: [
                    TextField(
                      controller: _content,
                      style: TextStyle(
                        color: Colors.grey,
          
                      ),
                      maxLines: 10,
                      decoration: InputDecoration (
                        hintText: "Article content",
                        hintStyle: TextStyle(color: Colors.grey)  ,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            
                            width: 1,
                          )
                          ),
 
                        prefixIcon: Icon(
                          Icons.text_fields, 
                          color:  Colors.grey,)
                      ),
                    ),
                    QuillToolbar.basic(controller: _controller),

                  ],
                ),

                SizedBox(height:22,),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      color: AppColors.primaryColor.withOpacity(.8),
                      child: Text(
                        "PUBLISH ARTICLE",
                        style: TextStyle(
                          color: Colors.white, 
                          fontWeight:FontWeight.w500 
                          ),
                          ), 
                          onPressed: () {
                           Post newArticle = Post(
                            title: _title.text.trim(), 
                           
                            content: _content.text.trim(),
                            readTime: "10 min read",
                            author: _firebaseAuth.currentUser!.uid,
                            createdAt: DateHelper.getReadableDate(DateTime.now()),
                            );
                            _articleServices.addNewArticle(newArticle);
                            Navigator.of(context).pop();
                            
                       
                          },
                          ),
                  ),
                ],
              ),
          ],
        ),
      )
    );
  }
}