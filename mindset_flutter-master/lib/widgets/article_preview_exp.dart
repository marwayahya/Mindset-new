// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mindset_flutter/services/auth_services.dart';

import '../models/post.dart';
import '../utils/app_colors.dart';


class ArticlePreviewExp extends StatefulWidget {
  final Post article;

  const ArticlePreviewExp({
    super.key, 
    required this.article
    });
  

  @override
  State<ArticlePreviewExp> createState() => _ArticlePreviewExpState();
}
 
 

class _ArticlePreviewExpState extends State<ArticlePreviewExp> {
 AuthService _authService =AuthService();
  
  // Function to fetch and extract the author's name
  String authorName = 'A';
  // Function to fetch and extract the author's name
  Future<String> _getAuthorName(String authorUID) async {
    final DocumentSnapshot snapshot = await _authService.getUserByUID(authorUID);
    final Map<String, dynamic> authorData = snapshot.data() as Map<String, dynamic>;
    final String authorName = authorData['fullname'];
    print('authorName$authorName');
    return authorName;
  }
  
   @override
  void initState() {
    super.initState();
    _getAuthorName(widget.article.author); 
    _refreshAuthorName();
    print('test');// Fetch authorName when the widget is initialized
  }
    void _refreshAuthorName() async {
    String name = await _getAuthorName(widget.article.author);
    setState(() {
      authorName = name; // Update the authorName variable
    });
    print('test');
  }

  @override
  Widget build(BuildContext context) {
    _getAuthorName(widget.article.author); 
   
    print('sss$authorName');
    //auther
    //title
    //description
    //image preview
    //datetime
    //read time
    //actions: save,favorite,option ,report
    return 
    RefreshIndicator(
      onRefresh: () async {
        _refreshAuthorName(); // Manually trigger a refresh of authorName
      },
        child: Container(
          padding: EdgeInsets.all(12),
          color: Colors.white,
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
                
              
              Row(
                children: [
                  
            
                
                  CircleAvatar(
                   backgroundColor: const Color.fromARGB(255, 218, 221, 218),
                   radius: 9,
                   child: Text(authorName[0].toUpperCase())
                  ),
                  SizedBox(width: 6,),
                  FutureBuilder<DocumentSnapshot>(
                    future: _authService.getUserByUID(widget.article.author),
                    builder: (context, snapshot) {
                      if (snapshot.hasData){
                        Map<String, dynamic> author = 
                        snapshot.data!.data() as Map<String, dynamic>;
                      return Text(
                        author['fullname'],
                      style: TextStyle(
                        fontSize: 13, 
                        color: Colors.black,
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                    ),
                  )
                ],
                ),
                 SizedBox(height: 10,),
                 
                 SizedBox(height: 24,),
                 Row(children: [
                  Text(
                    '${DateFormat('MMM d').format(DateTime.parse(widget.article.createdAt))} - ${widget.article.readTime} min',
                     style: TextStyle(
                    fontSize: 13, 
                    color: const Color.fromARGB(255, 88, 86, 86),
                    fontWeight: FontWeight.normal
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(CupertinoIcons.bookmark,
                      color: Colors.black,
                      size: 17,
                      ),
                      SizedBox(width: 8,),
                      Icon(CupertinoIcons.flag,
                      color: Colors.redAccent,
                      size: 17,),
                    ],
                  ),
                 IconButton(
                onPressed: () {
                  // Show the popup menu when the icon is tapped
                  showPopupMenu(context);
                },
                icon: Icon(
                  CupertinoIcons.ellipsis_vertical,
                  color: Colors.black,
                ),
              ),
                 ],
                 ),
            ]
            ),
        
        ),
      
    );
  }
}
void showPopupMenu(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text('Option 1'),
              onPressed: () {
                // Handle Option 1
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Option 2'),
              onPressed: () {
                // Handle Option 2
                Navigator.pop(context);
              },
            ),
          ],
          
        );
      },
    );
  }

