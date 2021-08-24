import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//create Deployment
class MyD extends StatefulWidget {
   
      
  @override
  _MyDState createState() => _MyDState();
}

class _MyDState extends State<MyD> {
   web() async{
    
      var idd="1";
      var command =idd+" "+iname.text+" "+dname.text;
      print(command);
      var url = Uri.http("192.168.43.83","/cgi-bin/kube.py",{"x":command});
      var response = await http.get(url);
      showModalBottomSheet(
             backgroundColor: Colors.black,
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>Container(
                height: 465,
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text(
                  response.body,
                  style:TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.5,
                    wordSpacing: 1,
                    fontSize: 20,

                  )
                  
                  ),
              ),
             );
         
        
  }

 final iname = TextEditingController();

 final dname = TextEditingController();

 @override
  Widget build(BuildContext context) {
     
    return Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            Text(
              "Please Enter Deployment and Image name",
                style: TextStyle(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )
            ),
           SizedBox(height:40),
               TextFormField(
                 controller: dname,
                // cursorColor:Colors.red,
                
                 keyboardType: TextInputType.text,
                // textInputAction:TextInputAction.continueAction,
                 autocorrect: false,
                 decoration: InputDecoration(
                  labelText: "Deployment Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0))),
                 autofocus: true,
            
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10,),
             TextFormField(
               controller: iname,
              decoration: InputDecoration(
                  labelText: "Image Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0))),
              autofocus: true,
  
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed:web,
             child: Text("Submit")),
          ],
        ));
  }
}
