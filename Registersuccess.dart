import 'package:flutter/material.dart';
import 'package:testapp/Login.dart';

class RSuccess extends StatelessWidget {
  const RSuccess({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
               padding: EdgeInsets.fromLTRB(5.0, 100, 0.0, 0.0),
                    child: Text("Congratulations!!!",
                     style: TextStyle(
                       
                          fontWeight: FontWeight.bold,
                          fontFamily:  'Montserrat',
                          fontSize:40,
                         // fontFamily:Schyler,
                      ),
                    )     
              
          ),
    
          Container(
               padding: EdgeInsets.fromLTRB(10.0, 150, 0.0, 0.0),
                    child: Text("You have Registered Successfully",
                     style: TextStyle(
                       
                          fontWeight: FontWeight.bold,
                          fontFamily:  'Montserrat',
                          fontSize:24,
                         // fontFamily:Schyler,
                      ),
                    )     
              
          ),
          SizedBox(height: 40,),
          Container(
              padding: EdgeInsets.fromLTRB(30.0, 0, 0.0, 0.0),
            child: Row(
              children: [
                TextButton(onPressed: (){
                     Navigator.push(
                                   context,
                                  MaterialPageRoute(builder: (context)=>LoginPage()),
                              );
                }, 
                child: Text("Click Here",
                style: TextStyle(
                  fontSize: 20,
                ),
                ),
        
      ),

      Text("to redirect to login page",
      style:TextStyle(fontSize: 20,
      //fontWeight: FontWeight.bold
      )
      ),
              ],
            ),
          ),
      
        ],
      ),
    );
}

}