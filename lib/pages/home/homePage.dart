import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 243, 135, 33),
       ),
      body:SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 65, 65, 65),
          height: MediaQuery.of(context).size.height *1,
          width: MediaQuery.of(context).size.width *1,
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Em Alta",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600),),
            ),
            Container(  color: Colors.red,
                     height: MediaQuery.of(context).size.height *0.3,
          width: MediaQuery.of(context).size.width *1,
              child:
         ListView.builder(
          scrollDirection: Axis.horizontal,
        
          
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
        return Container(color: Colors.black,
        width: 130,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            
            height: 50,
             
            child: Center(child: Text('Entry ${index}')),
          ),
        );
          }
        )
               , ),
           const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("DUBLAGEM EM PORTUGUES DESTA TEMPORADA!",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400),),
            ),
            Container(  color: Colors.red,
                     height: MediaQuery.of(context).size.height *0.3,
          width: MediaQuery.of(context).size.width *1,
              child:
         ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
        return Container(color: Colors.black,
          width: 130,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            
            height: 50,
             
            child: Center(child: Text('Entry ${index}')),
          ),
        );
          }
        )),
           ],),
        ),
      )
    );
  }
}