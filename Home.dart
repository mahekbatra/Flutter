import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/Login.dart';
import 'package:testapp/kubeapp.dart';

import 'dockerapp.dart';

class MyHome extends StatefulWidget {
  const MyHome({ Key? key }) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var authc=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         resizeToAvoidBottomInset: false,
        body: Container(
          
         
            child:Column(
             
              children: [
                Container(
                      padding: EdgeInsets.fromLTRB(0.0, 50, 0.0, 0.0),
                   child:Text("Welcome to Devops World",
                    style: TextStyle(
                      color:Colors.black87 ,
                      decoration: TextDecoration.underline,
                        fontFamily: 'Montserrat',
                        fontStyle: FontStyle.italic,
                        
                        fontWeight: FontWeight.bold,
                        fontSize:32.0,
                       // fontFamily:Schyler,
                    ),
                  )
                ),
             
              
               Container(
                   padding: EdgeInsets.fromLTRB(20.0, 70, 0.0, 0.0),
                  child: Text("Select the Technology",
                   style: TextStyle(
                        wordSpacing: 4,
                        letterSpacing:2,
                        fontWeight: FontWeight.bold,
                        fontFamily:  'Montserrat',
                        fontSize:30,
                       // fontFamily:Schyler,
                    ),
                  )),
                  SizedBox(height: 40,),
            
                Image(image: AssetImage("assets/home1.jpg"),
               fit: BoxFit.cover,
            ),
                SizedBox(height:10,),
               Row(
                 children: [
                   ElevatedButton(onPressed:(){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context)=>MyKubeApp()),
                     );
                   },
                   child:Text("KUBERNETES",
                   style: TextStyle(
                     color: Colors.blueAccent,
                   ),),
                   style: ElevatedButton.styleFrom(
                     primary:Colors.white,
                     padding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
                     textStyle: TextStyle(
                       fontSize: 20,
                       
                      fontWeight: FontWeight.bold,)
      
                    
             ),
      
                    
                   ),

                    SizedBox(width: 80,),
               ElevatedButton(onPressed:(){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context)=>MyDocApp()),
                 );
               },
               child:Text("DOCKER",
               style: TextStyle(
                 color: Colors.blueAccent,
               ),
               ),
               style: ElevatedButton.styleFrom(
                 primary:Colors.white,
                 padding: EdgeInsets.symmetric(horizontal:28,vertical: 5),
                 textStyle: TextStyle(
                   fontSize: 20,
             
                  fontWeight: FontWeight.bold,)
      
                
             ),
               ),
               
              
                 ],
               ),
               SizedBox(height: 90,),
                 Container(
                        padding: EdgeInsets.fromLTRB(220.0, 50, 0.0, 0.0),
                   child: ElevatedButton(onPressed:() async{
                          try{
                            
                          await authc.signOut();
                          
                          
                         Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context)=>LoginPage()),
                       );

                          }catch(e){
                            print(e);
                          }
                     
                     },
                     child:Text("LOGOUT",
                     style: TextStyle(
                       color: Colors.white,
                     ),),
                     style: ElevatedButton.styleFrom(
                       primary:Colors.blue,
                       padding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
                       textStyle: TextStyle(
                         fontSize: 20,
                         
                        fontWeight: FontWeight.bold,)
      
                      
             ),
      
                      
                     ),
                 ),

               
              ],
            ),
          ),
      ),
     ) ;
  }
}
