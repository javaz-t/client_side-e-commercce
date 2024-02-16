import 'package:flutter/material.dart';
class BuyPage extends StatelessWidget {
  final String name;
  final String url;

  final String price;

   BuyPage({super.key, required this.name, required this.url,  required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Page'),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(child: Image.network(url,height: 400,width: 400,fit: BoxFit.fitHeight,)),
              SizedBox(height: 10,),
              Text(name,style: TextStyle(fontSize: 40,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text('descrition',style: TextStyle(fontSize: 25,overflow: TextOverflow.ellipsis,),),
              SizedBox(height: 10,),
              Text('Rs :$price',style: TextStyle(fontSize: 25,overflow: TextOverflow.ellipsis,color: Colors.green,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Shipping Address : ',
          
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  ElevatedButton(onPressed: (){}, child: Text('Submit')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
