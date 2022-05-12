import 'package:flutter/material.dart';
import 'package:insta_clone/pages/SignUp.dart';
import 'package:insta_clone/pages/homepage.dart';
class SignInPage extends StatefulWidget {
 static final String id="signinpage";
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body:Container(
        padding: EdgeInsets.all(30),
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
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text("Instagram",style: TextStyle(color: Colors.white,fontSize: 40,fontFamily: 'Billabong',fontWeight: FontWeight.normal),),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white54.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'mail',
                        border: InputBorder.none,
                        hintStyle:TextStyle(fontSize: 17,color: Colors.white54),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white54.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        hintStyle:TextStyle(fontSize: 17,color: Colors.white54),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  GestureDetector(
                    child:  Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white54.withOpacity(0.2),
                        border: Border.all(color: Colors.white54.withOpacity(0.2),width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Sign In",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                    ),
                    onTap: (){
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    },
                  ),
                ],
              ),),
            Expanded(
              flex: 1,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('I have not account!',style: TextStyle(color: Colors.white,fontSize: 20),),
                  SizedBox(width: 10,),
                  GestureDetector(
                    child: Text('SignUp',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    onTap: (){
                      Navigator.pushReplacementNamed(context, SignUpPage.id);
                    },
                  ),
                ],
              ),),
          ],
        ),
      ),
    );
  }
}
