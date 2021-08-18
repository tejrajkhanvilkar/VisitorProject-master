import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visitorproject/VisitorDataModel.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity>
{

  // var firebaseAuth;
  var  currentUser="IuVIPmybxYM7PSeq03c9PxMBzAx1";
  List<VisitorDataModel> visitorList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Firebase Messaging
    Firebase.initializeApp();

    //String currentDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    String currentDate = DateFormat("dd-MM-yyyy").format(DateTime.now());


    final dateDBReference=FirebaseDatabase.instance.reference().child("DateDB");
    final dateDBChildReference=dateDBReference.child(currentDate);

    //final FirebaseMessaging fdbmsgToken= FirebaseMessaging.instance;
    //fdbmsgToken.getToken().then((value) => print(value));


    dateDBChildReference.onChildAdded.listen((event) {
      visitorList.clear();
      VisitorDataModel visitordatamodel=new VisitorDataModel.fromDataSnap(event.snapshot);
      bool visited=visitordatamodel.isVisited_Status();
      if(!visited) {

        if(currentUser==visitordatamodel.getWhomToMeet())
        {
            visitorList.add(visitordatamodel);
            print("Data inserted...");

        }

      }
      setState(() {

      });

    });

  }

  Widget setui(String fnm,String lnm,String mob,String whom_to_meet,String reason,String fstatus,String visitedstatusupdate)
  {

    return new GestureDetector(
      onLongPress: (){},
      onTap: (){},
      child: Card(
        color: Colors.blue[100],
        child: Container(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    fnm+" "+lnm,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  Text(
                    whom_to_meet,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  Text(
                    mob,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  Text(
                    reason,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  Text(
                    fstatus,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  Text(
                    visitedstatusupdate,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),



                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(onPressed: (){

                  },
                      child: Text("Accept"),

                  ),
                  ElevatedButton(onPressed: (){

                  },
                      child: Text("Reschedule")),
                  ElevatedButton(onPressed: (){

                  },
                      child: Text("Deny")),
                ],
              ),
            ],
          ),

        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Home Activity'),
        centerTitle: true,
      ),

      body: new Container(

        child: visitorList.length==0?Text("No Data Available"):new ListView.builder(
            itemCount: visitorList.length,
            itemBuilder:(_,index)
            {
              return setui(visitorList[index].First_Name,visitorList[index].Last_Name,visitorList[index].Mobile_NO,visitorList[index].WhomToMeet,visitorList[index].Reason,visitorList[index].FeverStatus,visitorList[index].Visited_Status_Update);
            }
        ),
      ),
    );
  }
}
