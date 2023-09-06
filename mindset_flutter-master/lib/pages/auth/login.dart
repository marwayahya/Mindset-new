import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindset_flutter/services/auth_services.dart';


import '../../utils/app_colors.dart';
import '../core/main_screen.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthService _authService = AuthService();
 final TextEditingController _LoginMailCtrl = TextEditingController();
 final TextEditingController _PasswordCtrl = TextEditingController();
 bool _isPasswordObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.secondaryColor,
       body: SafeArea(
       
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center ,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max ,
                children: [
                  Image.asset(
                    "assets/logo/logo.png",
                    height: 40,
                    color: Colors.white, 
                    ),
                    SizedBox(width: 4),
                  Text(
                    'Mindset'.toUpperCase(),
                     style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 20,
                      ),
                  ),
                ],
              ),
              SizedBox(height: 14),
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
        
              SizedBox(height: 14,),
              TextField(
                controller: _PasswordCtrl,
                obscureText: _isPasswordObscured,
                style: TextStyle(
                  color: Colors.white,
        
                ),
                decoration: InputDecoration (
                  hintText: "Password",
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
                    Icons.lock, 
                    color:  Colors.white,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                       _isPasswordObscured = !_isPasswordObscured;
                       });
                      } , 
                    icon: Icon (
                      _isPasswordObscured ?
                      Icons.visibility : 
                      Icons.visibility_off, 
                    color:  Colors.white,
                    ),
                    ), 
                ),
              ),
        
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end ,
                children: [
                  TextButton(onPressed: () {}, 
                  child: Text(
                    'forgot password' , 
                    style: TextStyle(
                      color: AppColors.primaryColor.withOpacity(.8),
                      ),
                      ),
                      ),
                ],
              ),
        
              SizedBox(height:22,),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      color: AppColors.primaryColor.withOpacity(.8),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white, 
                          fontWeight:FontWeight.w500 
                          ),
                          ), 
                          onPressed: ()async{
                            if( _LoginMailCtrl.text.isEmpty || _PasswordCtrl.text.isEmpty) {
                              print("email/pass can't be empty");
                            } else {
                              dynamic cred = await _authService.loginUser(_LoginMailCtrl.text.trim(),
                             _PasswordCtrl.text.trim());
                             if(cred == null){
                              print("email/pass invalid");
                             }else{
                                    Navigator.pushReplacement(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => MainScreen()
                                          ),
                    );

                             }
                            }
                       
                          },
                          ),
                  ),
                ],
              ),
        
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Not a member yet?',
                    style: TextStyle(
                      color: Colors.white
                      ),
                    ),
                  TextButton(onPressed: () {
                           Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => RegisterPage()
                        ),
                    );
                  }, 
                  child: Text(
                    'Sign up' , 
                    style: TextStyle(
                      color: AppColors.primaryColor.withOpacity(.8),
                      ),
                      ),
                      ),
                ],
              ),
              //email
              //password
              //forgot password
              //login button
            ],
          ),
        )
        ),
    );
  }
}