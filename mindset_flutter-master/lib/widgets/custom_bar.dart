// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../pages/core/profile_page.dart';
import '../utils/app_colors.dart';

class CustomBar extends StatefulWidget {
  final String text;
  const CustomBar({Key? key, required this.text}) : super(key: key);

  @override
  State<CustomBar> createState() => _CustomBarState();
}

class _CustomBarState extends State<CustomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child:Row(
        children: [


          SizedBox(width: 8,),
           Text(widget.text, style: TextStyle(
            color: Colors.black, 
            fontSize:  30, 
            fontWeight: FontWeight.bold
            ),
            ),

            Spacer(),
            IconButton(
                      onPressed: () {},
                        
                       
                    icon: Icon (
                      
                      CupertinoIcons.bell ,
                    color:  AppColors.primaryColor.withOpacity(.8),
                    size: 20,
                    ),
                    ), 
        ],
      ) ,
    );
  }
}

