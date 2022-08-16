import 'package:flutter/material.dart';
import 'package:mobile_sqlite/Model/profile_model.dart';
import 'package:mobile_sqlite/database/db_service.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';

class Cl_edit extends StatefulWidget {
  // const Cl_edit({Key? key}) : super(key: key);
  late int id = 0;

  Cl_edit(int id){
   this.id = id;
  }

  @override
  State<Cl_edit> createState() => _Cl_editState(id);
}

class _Cl_editState extends State<Cl_edit> {
  // List<ProfileModel> prolist = <ProfileModel>[];

  @override
  void initState(){
    super.initState();
    getDataProfile(id);
  }

  _Cl_editState(int id){
    this.id = id;
  }

  getDataProfile(int id)async{
    var profile = await service.readDataById(id);
    profile.forEach((pro){
      setState((){
        firstname.text = pro['firstname'];
        lastname.text = pro['lastname'];
        email.text = pro['email'];
        phone.text = pro['phone'];
        image.text = pro['image'];
        // print()
      });
    });
    print("firstname: " + firstname.text);
    print("lastname: " + lastname.text);
    print("email: " + email.text);
    print("phone: " + phone.text);
    print("image: " + image.text);
  }
  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var image = TextEditingController();
  var img;
  late int id;
  DBService service = new DBService();
  late ProfileModel pro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                (image.text != "")
                    ?Image.memory(const Base64Codec().decode(image.text))
                    : Icon(Icons.insert_photo),
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
                        // image.text = bit;
                        img = File(pickedFile.path);
                      });
                    }
                  },
                ),
                // textHeader("Profile"),
                textFormF("Fisrtname", "Input Firstname",firstname),
                textFormF("Lastname", "Input Lastname",lastname),
                textFormF("Email", "Input email",email),
                textFormF("Phone", "Input phone",phone),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          // color: Colors.blue,
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.all(
                          //     Radius.circular(30),
                          //   ),
                          // ),
                          child: const Text(
                            "Save data",
                            style: TextStyle(
                                color:  Colors.white,
                                fontSize: 20
                            ),
                          ),
                          onPressed: (){
                            print("Global name : " + firstname.text);
                            print("Thai name : " + lastname.text);
                            print("Type : " + email.text);
                            print("Season : " + phone.text);
                            DBService service = new DBService();
                            ProfileModel profile = new ProfileModel();
                            // count += 1;
                            // profile.id = count;
                            profile.firstname = firstname.text;
                            profile.lastname = lastname.text;
                            profile.email = email.text;
                            profile.phone = phone.text;
                            profile.image = image.text;
                            var data = profile.profileMap();

                            service.updateData(data, id);
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
