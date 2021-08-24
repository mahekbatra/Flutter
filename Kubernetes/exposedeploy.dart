import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//create Deployment
class MyED extends StatefulWidget {
   
      
  @override
  _MyEDState createState() => _MyEDState();
}

class _MyEDState extends State<MyED> {
   web() async{
    
      var idd="5";
      var command =idd+" "+dname.text+" "+port.text+" "+etype.text;
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

 final dname = TextEditingController();
 final etype= TextEditingController();
 final port = TextEditingController();

 @override
  Widget build(BuildContext context) {
     
    return Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            Text(
              "Please Enter Deployment,Port No. and Type",
                style: TextStyle(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.bold

              )
            ),
           SizedBox(height: 30,),
               TextFormField(
                 controller: dname,
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
               controller: port,
               keyboardType: TextInputType.number,
               decoration: InputDecoration(
                  labelText: "Port No",
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
                 controller: etype,
                 decoration: InputDecoration(
                  labelText: "Type",
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
