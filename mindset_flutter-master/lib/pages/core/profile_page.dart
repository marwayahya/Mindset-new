import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 6,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            CupertinoIcons.arrow_left, 
            color: Colors.black,
            ),
          
        ),
        
        title: Text(
          'My Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
          onPressed: () {
            
          },
          icon: Icon(
            CupertinoIcons.slider_horizontal_3, 
            color: Colors.black,
            ),
          
        ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.primaryColor,
                      child:Text('M',
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                         fontSize: 50,
                        ),)
                    ),
                  
                  ],
                ),
                const SizedBox(height: 14,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.person, 
                    color: AppColors.primaryColor,),
                    SizedBox(width: 4,),
                    Text(
                      'Marwa Yahya',
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         color: Colors.black,
                         fontSize: 18,
                        ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.mail, 
                    color: AppColors.primaryColor,
                    ),
                    SizedBox(width: 4,),
                    Text(
                      'marwa@gmail.com',
                       style: TextStyle(
                         fontWeight: FontWeight.normal,
                         color: Colors.black,
                         fontSize: 14,
                        ),
                    ),
                    SizedBox(width: 10,),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.at, 
                    color: AppColors.primaryColor,),
                    SizedBox(width: 4,),
                    Text(
                      'Marwa1410',
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         color: Colors.black,
                         fontSize: 14,
                        ),
                    ),
                  ],
                ),
                  
                  ],
                ),
               Container(
                margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.2),
             borderRadius: BorderRadius.all(
              Radius.circular(12))
            ) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.doc, 
                    color: AppColors.primaryColor,
                    ),
                    SizedBox(width: 8,),
                    Text('0', 
                    style: TextStyle(
                      color: AppColors.primaryColor
                      ),
                      ),
                  ],
                ),
                
                Row(
                  children: [
                    Icon(CupertinoIcons.person_2, 
                    color: AppColors.primaryColor,
                    ),
                    SizedBox(width: 8,),
                    Text('120', 
                    style: TextStyle(
                      color: AppColors.primaryColor
                      ),
                      ),
                  ],
                ),
                 
                Row(
                  children: [
                    Icon(CupertinoIcons.person_3, 
                    color: AppColors.primaryColor,
                    ),
                    SizedBox(width: 8,),
                    Text('2k', 
                    style: TextStyle(
                      color: AppColors.primaryColor
                      ),
                      ),
                  ],
                ),
                
              ],
            ),
          )
              ],
            ),
          ),
          ),
          ),
    );
  }
}