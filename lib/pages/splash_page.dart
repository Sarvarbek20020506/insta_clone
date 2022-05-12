import 'package:flutter/material.dart';
import 'package:insta_clone/pages/SignUp.dart';
import 'package:insta_clone/pages/homepage.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatiSlpash();
  }
  _navigatiSlpash()async{
    await  Future.delayed(Duration(milliseconds: 1500),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>(HomePage())));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body:Container(
        padding: EdgeInsets.all(20),
        height:MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(252, 175, 69, 1),
              Color.fromRGBO(245, 96, 64, 1),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(child: Center(
              child: Text("Instagram",style: TextStyle(color: Colors.white,fontSize: 40,fontFamily: 'Billabong',fontWeight: FontWeight.normal),),
            ),),
            Text("All right reserved",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}
