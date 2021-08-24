import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//Delete Deployment
class MyPI extends StatelessWidget {
   
      
   web() async{
    
      var idd="4";
      var command =idd+" "+iname.text;
      print(command);
      var url = Uri.http("192.168.43.83","/cgi-bin/doc.py",{"x":command});
      var response = await http.get(url);
      Text("Deployment Deleted Successfully");
      Text(response.body);
   }
  
  final iname = TextEditingController();
      

 @override
  Widget build(BuildContext context) {
     
    return Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            Text(
              "Please Enter Image name you want to pull",
                style: TextStyle(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight:FontWeight.bold,
              )
            ),
            SizedBox(height: 40,),

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
            SizedBox(height: 10,),
            
            ElevatedButton(onPressed:web,
             child: Text("Submit")),
          ],
        ));
  }
}
