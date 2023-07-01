import 'package:flutter/material.dart';

class detailpage extends StatefulWidget {
  const detailpage({super.key});

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
     body: Container(

       child: Center(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Center(
               child: Container(
                 width: 300,
                 height: 400,
                 decoration: BoxDecoration(
                   color: Colors.white,
                 ),
                 child: Image.asset('lib/assets/chair6.png'),


               ),
             ),
             Row(
               children: [
                 SizedBox(width: 20,),
                 Text("Chair",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900),),
               ],
             ),
             Row(
               children: [
                 SizedBox(width: 20,),
                 Text("Chair is made of wooden material",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
               ],
             ),
             SizedBox(height: 20,),
             Row(children: [Container(margin :EdgeInsets.all(10), width: 30,height: 30,color: Colors.red,),Container(margin :EdgeInsets.all(10), width: 30,height: 30,color: Colors.blue,),Container(margin :EdgeInsets.all(10), width: 30,height: 30,color: Colors.pink,),SizedBox(width: 70,),
               Container(width : 40,color: Colors.black,child: Center(child: Text("-",style: TextStyle(color:Colors.white,fontSize: 30),)),),Container(width : 40,color: Colors.black,child: Center(child: Text("2",style: TextStyle(color:Colors.white,fontSize: 30),)),),Container(width : 40,color: Colors.black,child: Center(child: Text("+",style: TextStyle(color:Colors.white,fontSize: 30),)),)],),
             SizedBox(height: 20,),
             Row(children: [
               SizedBox(width: 50,),
               Icon(Icons.star,size: 60,),
               Spacer(),
               Container(
                 width: 120,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                    ),
                    child: Text(" \$ 99",style: TextStyle(color: Colors.white,fontSize: 60,fontWeight: FontWeight.bold),)),
               SizedBox(width: 50,),
             ],)
           ],
         ),
       )

     ),



    );
  }
  }