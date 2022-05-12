import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class MyUploadPage extends StatefulWidget {
  const MyUploadPage({Key? key}) : super(key: key);

  @override
  State<MyUploadPage> createState() => _MyUploadPageState();
}

class _MyUploadPageState extends State<MyUploadPage> {
  File? image;

  pickImagegal() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemporary = File(image.path);

      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("failed to pickimage $e");
    }
  }

  pickImagecam() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemporary = File(image.path);

      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("failed to pickimage $e");
    }
  }

  var captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.post_add,
                color: Color.fromRGBO(252, 175, 69, 1),
              )),
        ],
        title: Text(
          "Upload",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Billabong",
              fontSize: 35,
              color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => showBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: new Icon(Icons.image),
                          title: new Text('From gallery'),
                          onTap: () => pickImagegal(),
                        ),
                        ListTile(
                          leading: new Icon(Icons.camera),
                          title: new Text('From camera'),
                          onTap: () => pickImagecam(),
                        ),
                      ],
                    );
                  },
                ),
                child: Container(
                  height: MediaQuery.of(context).size.width,
                  width: double.infinity,
                  color: Colors.grey,
                  child: image == null
                      ? Center(
                          child: Icon(
                            Icons.add_a_photo,
                            size: 45,
                          ),
                        )
                      : Stack(
                          children: [
                            Image.file(
                              image!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              height: double.infinity,
                              width: double.infinity,
                              color: Colors.black12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    child: Icon(
                                      Icons.highlight_remove,
                                      color: Colors.white,
                                    ),
                                    onTap: (){
                                      setState(() {
                                        image=null;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TextField(
                  controller: captionController,
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Caption",
                    hintStyle: TextStyle(fontSize: 17, color: Colors.black38),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
