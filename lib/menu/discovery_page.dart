import 'package:flutter/material.dart';
import 'package:mobile_sqlite/create_form/cl_create.dart';
import 'package:mobile_sqlite/create_form/cl_edit.dart';
import 'package:mobile_sqlite/Model/profile_model.dart';
import 'package:mobile_sqlite/database/db_service.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  void initState(){
    super.initState();
    getAllData();
  }
  List<ProfileModel> prolist = new List.filled(0, ProfileModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discovery"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cl_create(),
                ),
              ).then((value){
                if(value == null){
                }else{
                  getAllData();
                  setState((){});
                }
              });
            },
          )
        ],
      ),
      body: Container(
        child: (prolist.length != 0) ? ListView.builder(
            itemCount: prolist.length,
            itemBuilder: (BuildContext buildContext, int index){
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(prolist[index].image), // no matter how big it is, it won't overflow
                ),
                title: Text(prolist[index].firstname),
                subtitle: Text(prolist[index].lastname),
                trailing: Wrap(
                  children: [
                    // IconButton(
                    //   icon: Icon(Icons.edit),
                    //   onPressed: (){
                    //     Navigator.push(
                    //       context,
                    //       new MaterialPageRoute(
                    //         builder: (context) => new Cl_edit.setText(prolist, index),
                    //       ),
                    //     ).then((value){
                    //       if (value == null) {
                    //       }else{
                    //         prolist = value;
                    //       }
                    //       setState((){});
                    //     });
                    //   },
                    // ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){
                        prolist.removeWhere(
                                (element) => element.id == prolist[index].id
                        );
                        setState((){});
                      },
                    )
                  ],
                ),
              );
            }
        ): Container(),
      ),
    );
  }
  getAllData() async {
    prolist = <ProfileModel>[];
    var service = DBService();
    var profiles = await service.readData();
    profiles.forEach((pro){
      print(pro);
      setState((){
        var proModel = ProfileModel();
        proModel.id = pro['id'];
        proModel.firstname = pro['fisrtname'];
        proModel.lastname = pro['lastname'];
        proModel.email = pro['email'];
        proModel.phone = pro['phone'];
        proModel.image = pro['image'];
        prolist.add(proModel);
      });
    });
  }
}
