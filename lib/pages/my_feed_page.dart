import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';
class MyFeedPage extends StatefulWidget {
  // const MyFeedPage({Key? key}) : super(key: key);

  State<MyFeedPage> createState() => _MyFeedPageState();
}


 

  @override
  _MyFeedPageState createState() => _MyFeedPageState();

class _MyFeedPageState extends State<MyFeedPage> {
 

  List<Post> items=[];

  String post_img1="https://images.pexels.com/photos/326168/pexels-photo-326168.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
  String post_img2="https://images.pexels.com/photos/302743/pexels-photo-302743.jpeg?cs=srgb&dl=pexels-pixabay-302743.jpg&fm=jpg";

  PageController? get pageController => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,

        title: Text("Instagram",style: TextStyle(fontFamily: "Billabong",fontSize: 30,color: Colors.black),),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.camera_alt,color: Color.fromRGBO(193, 53, 132, 1),),
          ),
        ],
      ),
      body:ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx,index){
          return _itemOfPost(items[index]);
        },)
    );
  }

  Widget _itemOfPost(Post post){
    return Container(
      width: 200,
      color: Colors.black,
      height: 100,
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<PageController>('pageController', pageController));
  }
}
