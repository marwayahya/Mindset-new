

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class EmailVerif extends StatefulWidget {
  const EmailVerif({super.key});

  @override
  State<EmailVerif> createState() => _EmailVerifState();
}

class _EmailVerifState extends State<EmailVerif> {
  final TextEditingController _LoginMailCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      
      child:  Card(

        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
          ),
        margin: EdgeInsets.all(12) ,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('data'),
            Spacer(),
            Divider(color: Colors.grey,),
            SizedBox(height: 30),
               Text(
                'Please enter your email to search for your account',
                 style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                controller: _LoginMailCtrl,
                style: TextStyle(
                  color: Colors.white,
        
                ),
                decoration: InputDecoration (
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey.shade300)  ,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      
                      width: 1,
                    )
                    ),
                  filled: true,
                  fillColor: AppColors.primaryColor.withOpacity(.8),
                  prefixIcon: Icon(
                    Icons.mail, 
                    color:  Colors.white,)
                ),
              ),
              SizedBox(height: 30),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                CupertinoButton(
                      
                      color: AppColors.primaryColor.withOpacity(.8),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white, 
                          fontWeight:FontWeight.w500 
                          
                          ),
                          ), 
                          onPressed: () {

                          },
                          ),
                          
                const SizedBox(width: 8),
                CupertinoButton(
                      color: AppColors.primaryColor.withOpacity(.8),
                      child: Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.white, 
                          fontWeight:FontWeight.w500 
                          ),
                          ), 
                          onPressed: () {
                            
                          },
                          ),
                const SizedBox(width: 8),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}