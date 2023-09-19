

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindset_flutter/widgets/imagePickerThumbnail.dart';


//import '../../services/auth_services.dart';
import '../../utils/app_colors.dart';
import '../../widgets/pass_match.dart';
import '../core/main_screen.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
 bool _isPasswordObscured = true;
 bool _isConfirmPassObscured = true;
 bool _isPassMatch = false;
 bool _isPassVerifEmpty = false;
void _register() async {
  print('called');
    
      try {
         String email = _emailController.text.trim();
         
         String password = _passwordController.text.trim();
         String name = _nameController.text.trim(); // Name input
         print('$email');
         print('$password');
         UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
            await FirebaseFirestore.instance.collection('users').doc(authResult.user!.uid).set({
      'name': name,
      
      
      
    });
        
        // Optionally, you can update the user's display name:
        await authResult.user!.updateDisplayName( name);

        Navigator.pushReplacement(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => MainScreen()
                                          ),
                    );

      } catch (e) {
        print('Error during registration: $e');
      
    }
  }
  
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
                controller: _nameController,
                style: TextStyle(
                  color: Color.fromARGB(255, 95, 94, 94),
        
                ),
                decoration: InputDecoration (
                  hintText: "Full name",
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 140, 138, 138))  ,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      
                      width: 1,
                    )
                    ),
                  filled: true,
                  
                  prefixIcon: Icon(
                    Icons.person, 
                    color:  Color.fromARGB(255, 95, 94, 94),)
                ),
              ),
              SizedBox(height: 14),
              TextField(
                controller: _emailController,
                style: TextStyle(
                  color: Color.fromARGB(255, 95, 94, 94),
        
                ),
                decoration: InputDecoration (
                  hintText: "Email",
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 140, 138, 138))  ,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      
                      width: 1,
                    )
                    ),
                  filled: true,
                  
                  prefixIcon: Icon(
                    Icons.mail, 
                    color:  Color.fromARGB(255, 95, 94, 94),)
                ),
              ),
        
              SizedBox(height: 14,),
              TextField(
                controller: _passwordController,
                obscureText: _isPasswordObscured,
                style: TextStyle(
                  color: Colors.white,
        
                ),
                decoration: InputDecoration (
                  hintText: "Password",
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 140, 138, 138))  ,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      
                      width: 1,
                    )
                    ),
                  filled: true,
                  
                  prefixIcon: Icon(
                    Icons.lock, 
                    color:  Color.fromARGB(255, 95, 94, 94),
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
                    color:  Color.fromARGB(255, 95, 94, 94),
                    ),
                    ), 
                ),
              ),

              SizedBox(height: 14,),
              TextField(
                controller: _confirmPasswordController,
                obscureText: _isConfirmPassObscured,
                style: TextStyle(
                  color: Colors.white,
        
                ),
                decoration: InputDecoration (
                  hintText: "Confirm password",
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 140, 138, 138))  ,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      
                      width: 1,
                    )
                    ),
                  filled: true,
                  
                  prefixIcon: Icon(
                    Icons.lock, 
                    color:  Color.fromARGB(255, 95, 94, 94),
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
                      color:  Color.fromARGB(255, 95, 94, 94),
                    ),
                    
                    ), 
                ),
                onChanged: (val) {
                   if (val.isEmpty && _confirmPasswordController.text.isEmpty) {
                    setState(() {
                      _isPassVerifEmpty = false;
                      
                    }
                    );
                    } else {
                setState(() {
                 _isPassVerifEmpty = true;
                _passwordController.text == val 
                ? _isPassMatch = true 
                : _isPassMatch = false;
                });
                    }
                   
                  
                }
              ),
        ImagePickerThumbnail(),
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
                            if( _emailController.text.isEmpty || 
                            _passwordController.text.isEmpty||
                            _confirmPasswordController.text.isEmpty||
                            _nameController.text.isEmpty||
                            (_passwordController.text != _confirmPasswordController.text)) {
                              print("email/pass can't be empty");
                            } else {
                              print('something');
                              _register();
                    //          if(cred == null){
                    //           print("email/pass invalid");
                    //          }else{
                    //            Navigator.pushReplacement(
                    //                     context,
                    //                     CupertinoPageRoute(
                    //                       builder: (context) => MainScreen()
                    //                       ),
                    // );

                    //          }
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