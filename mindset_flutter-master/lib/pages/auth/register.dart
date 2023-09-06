

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../services/auth_services.dart';
import '../../utils/app_colors.dart';
import '../../widgets/pass_match.dart';
import '../core/main_screen.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthService _authService = AuthService();
  final TextEditingController _fullNameCtrl = TextEditingController();
 final TextEditingController _LoginMailCtrl = TextEditingController();
 final TextEditingController _PasswordCtrl = TextEditingController();
 final TextEditingController _ConfirmPassCtrl = TextEditingController();
 bool _isPasswordObscured = true;
 bool _isConfirmPassObscured = true;
 bool _isPassMatch = false;
 bool _isPassVerifEmpty = false;

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
                controller: _fullNameCtrl,
                style: TextStyle(
                  color: Colors.white,
        
                ),
                decoration: InputDecoration (
                  hintText: "Marwa Yahya",
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
                    Icons.person, 
                    color:  Colors.white,)
                ),
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

              SizedBox(height: 14,),
              TextField(
                controller: _ConfirmPassCtrl,
                obscureText: _isConfirmPassObscured,
                style: TextStyle(
                  color: Colors.white,
        
                ),
                decoration: InputDecoration (
                  hintText: "Confirm password",
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
                       _isConfirmPassObscured = !_isConfirmPassObscured;
                       });
                      } , 
                    icon: Icon (
                      _isConfirmPassObscured ?
                      Icons.visibility : 
                      Icons.visibility_off, 
                      color:  Colors.white,
                    ),
                    
                    ), 
                ),
                onChanged: (val) {
                   if (val.isEmpty && _ConfirmPassCtrl.text.isEmpty) {
                    setState(() {
                      _isPassVerifEmpty = false;
                      
                    }
                    );
                    } else {
                setState(() {
                 _isPassVerifEmpty = true;
                _PasswordCtrl.text == val 
                ? _isPassMatch = true 
                : _isPassMatch = false;
                });
                    }
                   
                  
                }
              ),
        
              SizedBox(height: 8,),
              Visibility(
                visible: _isPassVerifEmpty,
                child: PassMatch(isVerif: _isPassMatch,)
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end ,
                children: [
                  TextButton(onPressed: () {
                   
                  }, 
                  child: Text(
                    'forgot password' , 
                    style: TextStyle(
                      color: AppColors.primaryColor.withOpacity(.8),
                      ),
                      ),
                      ),
                ],
              ),
        
              SizedBox(height:28,),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      color: AppColors.primaryColor.withOpacity(.8),
                      child: Text(
                        "CREATE ACCOUNT",
                        style: TextStyle(
                          color: Colors.white, 
                          fontWeight:FontWeight.w500 
                          ),
                          ), 
                          onPressed: () async{
                            if( _LoginMailCtrl.text.isEmpty || 
                            _PasswordCtrl.text.isEmpty||
                            _ConfirmPassCtrl.text.isEmpty||
                            _fullNameCtrl.text.isEmpty||
                            (_PasswordCtrl.text != _ConfirmPassCtrl.text)) {
                              print("email/pass can't be empty");
                            } else {
                              dynamic cred = await _authService.registerUser(
                                _LoginMailCtrl.text.trim(),
                                _PasswordCtrl.text.trim(),
                                _fullNameCtrl.text.trim());
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
                    'Already a member?',
                    style: TextStyle(
                      color: Colors.white
                      ),
                    ),
                  TextButton(onPressed: () {
                     Navigator.of(
                      context).pop();
                   }, 
                  child: Text(
                    'Login' , 
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