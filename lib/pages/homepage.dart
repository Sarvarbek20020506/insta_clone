import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/pages/MyProfile.dart';
import 'package:insta_clone/pages/my_feed_page.dart';
import 'package:insta_clone/pages/my_like_page.dart';
import 'package:insta_clone/pages/my_upload_Page.dart';
import 'package:insta_clone/pages/mysearchpage.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id="home_page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentTap=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController=PageController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          MyFeedPage(),
          MySearchPage(),
          MyUploadPage(),
          MyLikePage(),
          MyProfilePage(),
        ],
        onPageChanged: (int index){
          setState(() {
            _currentTap=index;
          });
        },

      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (int index){
          setState(() {
            _currentTap=index;
            _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
          });
        },
        currentIndex: _currentTap,
        activeColor: Color.fromRGBO(252, 175, 69, 1),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),),
          BottomNavigationBarItem(icon: Icon(Icons.search),),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined),),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,),),
          BottomNavigationBarItem(icon: Icon(Icons.person),),
        ],
      ),
    );
  }
}
