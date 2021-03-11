import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:partners_mobile_application/widgets/login_screen.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
        FlatButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));


          }
        , child: Text('Logout',style: TextStyle(color:Colors.white),))
      ],),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*.2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 400,
                width: 400,
                child: Lottie.asset('assets/delivery-riding.json'))
            ],
          ),
        ])
    );
  }
}
