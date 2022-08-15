// import 'package:advanced_ui/services/covidtrackservice.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:advanced_ui/widget/data_card.dart';
// import 'package:advanced_ui/widget/text_card.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   void initState(){
//     Provider.of<CovidTrackerService>(context, listen: false).getCovidTrackerData();
//     setState((){});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var home = Provider.of<CovidTrackerService>(context).home;
//     int death = home.deaths;
//     int recover = home.recovered;
//     int comfirm = home.confirmed;
//     String update = home.updateDate;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 9,
//             ),
//             Text(
//               'Covid Case In Thailand $update'
//             ),
//             Text(
//               'Recovered $recover : Comfirm $comfirm : Death  $death'
//             ),
//             Container(
//               padding: EdgeInsets.all(15),
//               child: Card(
//                 elevation: 5,
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(2),
//                     topRight: Radius.circular(2)
//                   )
//                 ),
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   child: Column(
//                     children: <Widget>[
//                       Divider(),
//                       Row(
//                         children: <Widget>[
//                           Flexible(
//                               child: ListTile(
//                                 title: Text(
//                                   "Last Updated :",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w500
//                                   ),
//                                 ),
//                                 subtitle: Text(
//                                   update,
//                                   style: TextStyle(
//                                   ),
//                                 ),
//                               )
//                           )
//                         ],
//                       ),
//                       DataCard(
//                           children: <Widget>[
//                             TextStateCard(
//                               label: 'Recovery Rate',
//                               numbers: "${((recover / (recover + death)) * 100).toStringAsFixed(2)} %",
//                               color: Colors.green,
//                             ),
//                             TextStateCard(
//                                 label: 'Death Rate',
//                                 numbers: "${((death / (recover + death))* 100).toStringAsFixed(2)} %",
//                               color: Colors.red,
//                             )
//                           ])
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
