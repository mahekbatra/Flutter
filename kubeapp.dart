import 'package:flutter/material.dart';
import 'Kubernetes/createdeploy.dart';
import 'Kubernetes/createpod.dart';
import 'Kubernetes/deletedeploy.dart';
import 'Kubernetes/deletepod.dart';
import 'Kubernetes/exposedeploy.dart';
import 'Kubernetes/scaledeploy.dart';
import 'Kubernetes/showdeploy.dart';
import 'Kubernetes/showpod.dart';
import 'Kubernetes/showsvc.dart';

class MyKubeApp extends StatefulWidget {
  const MyKubeApp({ Key? key }) : super(key: key);
 
  
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyKubeApp> {
  late String cmd;
  final value = TextEditingController();
  

 app(){
    
 

         //creating deployment
         if (((value.text.contains("deployments")) | (value.text.contains("deployment")) | (value.text.contains("deploy"))) & ((value.text.contains("launch")) | (value.text.contains("create")) | (value.text.contains("run")) | (value.text.contains("build")))) {

            showModalBottomSheet(
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>MyD(),
             );
          }
        

         //create pod
           if (((value.text.contains("pod")) | (value.text.contains("pods")) | (value.text.contains("container"))) & ((value.text.contains("launch")) | (value.text.contains("create")) | (value.text.contains("run")) | (value.text.contains("build")))) {
            showModalBottomSheet(
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>MyB1(),
             );
         }

         //delete deployment   
          if (((value.text.contains("deployment")) | (value.text.contains("deploy")) | (value.text.contains("deployments"))) & (value.text.contains("delete")) | (value.text.contains("destroy")) | (value.text.contains("detach"))| (value.text.contains("remove"))) {
            showModalBottomSheet(
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>MyDD(),
             );
         }

         //delete pod
           if (((value.text.contains("pod")) | (value.text.contains("pods")) | (value.text.contains("container"))) & ((value.text.contains("delete")) | (value.text.contains("destroy")) | (value.text.contains("detach")) | (value.text.contains("remove")))) {
            showModalBottomSheet(
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>MyDP(),
             );
         }

          //expose deployment
           if (((value.text.contains("deployment")) | (value.text.contains("deploy")) | (value.text.contains("deployments"))) & ((value.text.contains("expose")))) {
            showModalBottomSheet(
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>MyED(),
             );
         }
        
      //scale Deployment
           if (((value.text.contains("deploy")) | (value.text.contains("deployment")) | (value.text.contains("deployments"))) & ((value.text.contains("scale")) | (value.text.contains("increase")) | (value.text.contains("decrease")) | (value.text.contains("replicas")))) {
            showModalBottomSheet(
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>MyS(),
             );
         }

        //list deployments
           if (((value.text.contains("deploy")) | (value.text.contains("deployment")) | (value.text.contains("deployments"))) & ((value.text.contains("list")) | (value.text.contains("show")) | (value.text.contains("display")) | (value.text.contains("get")))) {
            
                showModalBottomSheet(
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>MySD(),
             );
           
                 
            
           }

      //list pod
           if (((value.text.contains("pod")) | (value.text.contains("pods")) | (value.text.contains("container"))) & ((value.text.contains("list")) | (value.text.contains("display")) | (value.text.contains("show")) | (value.text.contains("get")))) {
            showModalBottomSheet(
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>MySP(),
             );
         }

         //list service
           if (((value.text.contains("service")) | (value.text.contains("services")) | (value.text.contains("svc"))) & ((value.text.contains("list")) | (value.text.contains("show")) | (value.text.contains("display")) | (value.text.contains("get")))) {
            showModalBottomSheet(
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>MySS(),
             );
         }

          


 }
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:AppBar(title :Text("KUBERNETES"),
     
      ),
        resizeToAvoidBottomInset: false,
      body: Container(
        
         
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              Container(
                  padding: EdgeInsets.fromLTRB(0.0, 20, 0.0, 0.0),
                child: Text("Enter Your Requirement",
                style: TextStyle(
             fontSize: 25,
             fontWeight: FontWeight.bold,
            )
            ),
              ),  
            SizedBox(height:20,),
            TextField(
               controller: value,
               maxLines:2,
                style:TextStyle(
                  fontSize:20,
                  fontWeight: FontWeight.bold,
                ),
               textAlign:TextAlign.center,
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
         
            ),
            Image(image: AssetImage("assets/kube.jpg"),
               fit: BoxFit.cover,
            ),
          ]
        ),
       ),
    );
  }
}

