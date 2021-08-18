import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'Register.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var authc= FirebaseAuth.instance;
   late String email;
   late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
                child: Stack(children: [
              SafeArea(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
                  child: Text("Devops",
                      style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              SafeArea(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text("World",
                      style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              SafeArea(
                child: Container(
                  padding: EdgeInsets.fromLTRB(225.0, 110.0, 0.0, 0.0),
                  child: Text(".",
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                ),
              ),
    
            Container(
               padding: EdgeInsets.fromLTRB(20.0, 320, 0.0, 0.0),
              child: Text("Enter your Email and Password",
               style: TextStyle(
                 
                    fontWeight: FontWeight.bold,
                    fontFamily:  'Montserrat',
                    fontSize:25,
                   // fontFamily:Schyler,
                ),
              )),
        
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 380.0, 20.0, 0.0),
                child: Column(children: [
                  TextFormField(
                     onChanged: (value){
                          email=value;
                    },
                     keyboardType: TextInputType.emailAddress,
                     
                     style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize:20,
                        
                          ),
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            
                            color: Colors.black,
                          ),
                           border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0))),
                         ),
                  SizedBox(
                    height : 30.0,
                       ),
                  TextFormField(
                     onChanged: (value){
                          password=value;
                    },
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize:20,
                        
                          ),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                   
                      ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0))),
                         ),
                    
                   
                  
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                     
                      
                      ElevatedButton(
                        onPressed: () async {
                        try{

                              var signin= await authc.signInWithEmailAndPassword(
                                email: email, password: password
                                );

                                if(signin != null){
                                   Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>MyHome()),);
                                }   
                        }    
                        catch(e){
                          Container(child: SnackBar(content: Text("Password is invalid")));
                        }
                        },
                        
                        child: Text("LOGIN"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding:
                              EdgeInsets.symmetric(horizontal: 147, vertical: 15),
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),
                      Row(
                        children: [
                          Text("Are you a new member?",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          ),
                          TextButton(
                        child: Text("Create Account",
                         style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: (){
                             Navigator.push(
                             context,
                            MaterialPageRoute(builder: (context)=>Register()),
                        );
                      },),
                        ],
                      ),
                    
                     
                ]),
                
            ])),
          ],
        )),
          ],
        ),
    );
  }
}