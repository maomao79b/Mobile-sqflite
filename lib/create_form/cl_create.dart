import 'dart:convert';
import 'dart:io';

import 'package:mobile_sqlite/Model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_sqlite/database/db_service.dart';

class Cl_create extends StatefulWidget {
  // const Cl_create({Key? key}) : super(key: key);
  @override
  State<Cl_create> createState() => _Cl_createState();
}

class _Cl_createState extends State<Cl_create> {

  var id = TextEditingController();
  var fisrtname = TextEditingController();
  var lastname = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var image = TextEditingController();
  var img;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Form"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                (img == null)?
                Icon(Icons.insert_photo,
                  size:200,
                )
                    : Image.file(img),
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () async {
                    PickedFile? pickedFile = await ImagePicker().getImage(
                        source: ImageSource.gallery,
                        maxWidth: 1800,
                        maxHeight: 1800
                    );
                    String bit = base64.encode(await pickedFile!.readAsBytes());
                    image.text = bit;
                    if(pickedFile != null){
                      setState((){
                        img = File(pickedFile.path);
                      });
                    }
                  },
                ),
                textHeader("Profile"),
                textFormF("Global", "Input global name of insect",fisrtname),
                textFormF("Thai name", "Input thai name of insect",lastname),
                textFormF("Type of insect", "Input type of insect",email),
                textFormF("Season found", "Input season found of insect",phone),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: RaisedButton(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: Text(
                                "Add data",
                              style: TextStyle(
                                color:  Colors.white,
                                fontSize: 20
                              ),
                            ),
                          onPressed: (){
                              // print("Global name : " + fisrtname.text);
                              // print("Thai name : " + lastname.text);
                              // print("Type : " + email.text);
                              // print("Season : " + phone.text);
                              DBService service = new DBService();
                              ProfileModel profile = new ProfileModel();
                              // count += 1;
                              // profile.id = count;
                              profile.firstname = fisrtname.text;
                              profile.lastname = lastname.text;
                              profile.email = email.text;
                              profile.phone = phone.text;
                              profile.image = image.text;
                              var data = profile.profileMap();
                              service.insertData(data);
                              Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: RaisedButton(
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Text(
                            "Cancle",
                            style: TextStyle(
                                color:  Colors.white,
                                fontSize: 20
                            ),
                          ),
                          onPressed: (){},
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding textFormF(String lText, String hText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: lText,
            hintText: hText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }

  Padding textHeader(String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(name,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue)),
    );
  }

  Padding PictureIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        Icons.insert_photo,
        size: 100,
      ),
    );
  }
}
