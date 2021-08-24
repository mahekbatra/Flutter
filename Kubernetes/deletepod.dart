import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//Delete Pod
class MyDP extends StatefulWidget {
   
      
  @override
  _MyDPState createState() => _MyDPState();
}

class _MyDPState extends State<MyDP> {
   web() async{
    
      var idd="3";
      var command =idd+" "+pname.text;
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

  final pname = TextEditingController();

 @override
  Widget build(BuildContext context) {
     
    return Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            Text(
              "Please Enter Pod name",
                style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold
              )
            ),
          SizedBox(height: 60,),
               TextFormField(
                 controller: pname,
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
            
            ElevatedButton(onPressed:web,
             child: Text("Submit")),
          ],
        ));
  }
}
