import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//Create Pod
class MyB1 extends StatefulWidget {
  @override
  _MyB1State createState() => _MyB1State();
}

class _MyB1State extends State<MyB1> {
  web() async {
    var idd = "2";
    var command = idd + " " + iname.text + " " + pname.text;
    print(command);
    var url = Uri.http("192.168.43.83", "/cgi-bin/kube.py", {"x": command});
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
  final pname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            Text(
              "Enter the Pod and Image Name",
              style: TextStyle(
                fontSize: 23.0,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              )
            ),
            
           SizedBox(height:40),
            TextFormField(
              
              controller: pname,
              decoration: InputDecoration(
                  labelText: "Pod Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0))),
              autofocus: true,
          
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: 30,
            ),

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

            SizedBox(
              height: 20,
            ),

            ElevatedButton(onPressed: web, child: Text("Submit")),
          ],
        ));
  }
}
