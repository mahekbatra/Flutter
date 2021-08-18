import 'package:flutter/material.dart';
import 'package:testapp/Registersuccess.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var authc=FirebaseAuth.instance;
  late String email;
  late String password;
  final TextEditingController pass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();

 @override
  void initState() {
    print("logout");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
          
              
    
            Container(
               padding: EdgeInsets.fromLTRB(0.0, 100, 0.0, 0.0),
              child: Text("Please Fill up the Required Details",
               style: TextStyle(
                 
                    fontWeight: FontWeight.bold,
                    fontFamily:  'Montserrat',
                    fontSize:24,
                   // fontFamily:Schyler,
                ),
              )),
        
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 50.0, 20.0, 0.0),
                child: Column(children: [

                 
                     TextFormField(
                 
                    style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize:20,
                        
                          ),
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                   
                      ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0))),
                         ),
                           SizedBox(height: 30,),
                  TextFormField(
                      onChanged: (value){
                       email=value;
                    },
                    style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize:20,
                        
                          ),
                     keyboardType: TextInputType.emailAddress,
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
                 
                          SizedBox(height: 30,),
                     TextFormField(
                         onChanged: (value){
                          password=value;
                    },
                      controller: pass,
                           validator: (val){
                              if(val!.isEmpty)
                                   return 'Empty';
                              return null;
                              },
                       style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize:20,
                        
                          ),
                     obscureText: true,
                    keyboardType: TextInputType.number,
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
                    height : 30.0,
                       ),
                  TextFormField(
                    style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize:20,
                        
                          ),
                           controller: confirmPass,
                           validator: (val){
                              if(val!.isEmpty)
                                   return 'Empty';
                              if(val != pass.text)
                                   return 'Not Match';
                              return null;
                              },
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                   
                      ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0))),
                         ),
                   
                    SizedBox(height: 30,),
                     TextFormField(
                    style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize:20,
                        
                          ),
                  
                    decoration: InputDecoration(
                      labelText: 'Organization',
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
                        onPressed: () async{
                          try{

                            var user=await authc.createUserWithEmailAndPassword(
                              email:email , password: password);

                              if(user.additionalUserInfo!.isNewUser==true){
                                  Navigator.push(
                                   context,
                                  MaterialPageRoute(builder: (context)=>RSuccess(),));
                              }

                          }catch(e){
                            print(e);
                          }
                          },

                        child: Text("REGISTER"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding:
                              EdgeInsets.symmetric(horizontal: 130, vertical: 15),
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
             
                     
                    
                     
                ]),
                
            ])),
          ],
        ));
        

  
  }
}
