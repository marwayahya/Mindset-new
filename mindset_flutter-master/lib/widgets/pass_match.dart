import 'package:flutter/material.dart';

class PassMatch extends StatefulWidget {
  
final bool isVerif;

  const PassMatch({super.key, required this.isVerif});
  @override
  State<PassMatch> createState() => _PassMatchState();
}

class _PassMatchState extends State<PassMatch> {
  @override
  Widget build(BuildContext context) {
    
    return Container( 
      child: widget.isVerif
      ? Row(
        children: [
          Icon(
            Icons.check, 
            color: Colors.greenAccent,
            ),

             SizedBox(width: 6,),
             Text(
              'Passwords match',
              style: TextStyle(
                color: Colors.greenAccent,
              ),
              ),
        ],
      ):

      Row(
        children: [
          Icon(
            Icons.close, 
            color: Colors.redAccent,
            ),

             SizedBox(width: 6,),
             Text(
              'Passwords mismatch',
              style: TextStyle(
                color: Colors.redAccent,
              ),
              ),
        ],
      ),

    );
  }
}