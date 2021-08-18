import 'package:flutter/material.dart';
import 'Docker/createcontain.dart';
import 'Docker/delcontain.dart';
import 'Docker/listcontain.dart';
import 'Docker/listruncon.dart';
import 'Docker/pullimage.dart';
import 'Docker/stopcontain.dart';

class MyDocApp extends StatefulWidget {
  const MyDocApp({ Key? key }) : super(key: key);
 
  
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyDocApp> {
  late String cmd;
  final value = TextEditingController();
  

 app(){
    
 

         //Start a new container with name given by user
           if (((value.text.contains("container")) | (value.text.contains("OS"))) & ((value.text.contains("launch")) | (value.text.contains("create")) | (value.text.contains("start")) | (value.text.contains("build")))) {
            showModalBottomSheet(
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>MyC(),
             );
         }

        

         //Delete a container
           if (((value.text.contains("container")) |(value.text.contains("OS"))) & ((value.text.contains("detach")) | (value.text.contains("delete")) | (value.text.contains("destroy")) | (value.text.contains("remove")))){
            showModalBottomSheet(
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>MyDC(),
             );
         }

         //Stop container
          if (((value.text.contains("container"))) & ((value.text.contains("stop"))) | (value.text.contains("halt")) | (value.text.contains("pause")) | (value.text.contains("end"))| (value.text.contains("terminate"))) {
            showModalBottomSheet(
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>MySC(),
             );
         }

         //download image
           if (((value.text.contains("image"))) & ((value.text.contains("download")) | (value.text.contains("pull"))) | (value.text.contains("extract"))) {
            showModalBottomSheet(
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>MyPI(),
             );
         }

          //list all container
           if (((value.text.contains("container"))) & (value.text.contains("all")) & (((value.text.contains("get"))|(value.text.contains("list"))|(value.text.contains("display"))|(value.text.contains("show"))))) {
            showModalBottomSheet(
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>MyLC(),
             );
         }

        //list running container
           if (((value.text.contains("container")) & ((value.text.contains("list")) | (value.text.contains("show")) | (value.text.contains("display")) | (value.text.contains("get"))))) {
            showModalBottomSheet(
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>MyLRD(),
             );
         }

  

         

          


 }
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:AppBar(title :Text("DOCKER",
      textAlign: TextAlign.center,
      )),
       resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(3, 16, 0, 0,),
       
        
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Enter Your Requirement",
            
            style: TextStyle(
             fontSize: 25,
             fontWeight: FontWeight.bold,
            )
            ,),
            SizedBox(height: 15,),
            TextField(
               controller: value,
               maxLines:2,
                textAlign:TextAlign.center,
                style:TextStyle(
                  fontSize:20,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                         
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            
                            color: Colors.black,
                          ),
                    
                )
             ),
             
            SizedBox(height: 20,),
              
          ElevatedButton(
            child:Text("OUTPUT"),
            onPressed: app,
          /*
            showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(myController.text),
              );
              */
            ),

            SizedBox(height: 120,),
              Image(image: AssetImage("assets/docker.png"),
               fit: BoxFit.cover,
            ),
          ]
        ),
       ),
    );
  }
}

