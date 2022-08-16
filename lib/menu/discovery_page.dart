import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_sqlite/create_form/cl_create.dart';
import 'package:mobile_sqlite/create_form/cl_edit.dart';
import 'package:mobile_sqlite/Model/profile_model.dart';
import 'package:mobile_sqlite/database/db_service.dart';
import 'dart:convert';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  @override
  void initState(){
    super.initState();
    getAllData();
  }
  getAllData() async {
    prolist = <ProfileModel>[];
    var service = DBService();
    var profiles = await service.readData();
    // print(profiles.toString());
    profiles.forEach((pro){
      print(pro);
      setState((){
        var proModel = ProfileModel();
        proModel.id = pro['id'];
        proModel.firstname = pro['firstname'];
        proModel.lastname = pro['lastname'];
        proModel.email = pro['email'];
        proModel.phone = pro['phone'];
        proModel.image = pro['image'];
        prolist.add(proModel);
      });
    });
  }
  // List<ProfileModel> prolist = new List.filled(0, new ProfileModel());
  // List<ProfileModel> prolist = [];
  List<ProfileModel> prolist = <ProfileModel>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile List"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){},
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cl_create(),
                ),
              ).then((value){
                getAllData();
                setState((){});
              });
            },
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
            itemCount: prolist.length,
            itemBuilder: (BuildContext buildContext, int index){
              return ListTile(
                leading: Image.memory(Base64Codec().decode(prolist[index].image)),
                title: Text(prolist[index].firstname),
                subtitle: Text(prolist[index].lastname),
                trailing: Wrap(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: (){
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new Cl_edit(prolist[index].id),
                          ),
                        ).then((value){
                          getAllData();
                          setState((){});
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: ()async{
                        var service = DBService();
                        await service.deleteData(prolist[index].id);
                        getAllData();
                        setState((){});
                      },
                    )
                  ],
                ),
              );
            }
        )
      ),
    );
  }
}
