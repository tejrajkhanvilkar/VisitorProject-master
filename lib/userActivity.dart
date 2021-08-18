import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:viitfiredbproject/VisitorDataModel.dart';
import 'package:visitorproject/VisitorDataModel.dart';

class UserActivity extends StatefulWidget {
  const UserActivity({Key? key}) : super(key: key);

  @override
  _UserActivityState createState() => _UserActivityState();
}

class _UserActivityState extends State<UserActivity>
{

  // var firebaseAuth;
  var  currentUser="IuVIPmybxYM7PSeq03c9PxMBzAx1";
  List<VisitorDataModel> pastvisitorList=[];

  String currentDate = DateFormat("dd-MM-yyyy").format(DateTime.now());

  final dateDBReference=FirebaseDatabase.instance.reference().child("DateDB");
  // final dateDBChildReference=dateDBReference.child(currentDate);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Firebase Messaging
    // String currentDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    // final dateDBReference=FirebaseDatabase.instance.reference().child("DateDB");

    setVisitorList();

  }

  void setVisitorList()
  {
    final dateDBChildReference=dateDBReference.child(currentDate);
    print(currentDate);

    //final FirebaseMessaging fdbmsgToken= FirebaseMessaging.instance;
    //fdbmsgToken.getToken().then((value) => print(value));

    dateDBChildReference.onChildChanged.listen((event) {

      pastvisitorList.clear();
      dateDBChildReference.once().then((DataSnapshot snap)
      {
        var visitor=snap.value;
        visitor.forEach((key,value)
        {
          VisitorDataModel visitordatamodel=new VisitorDataModel.con(
              value['RescheduledTime'],
              value['Vuid'],
              value['Reason'],
              value['Mobile_NO'],
              value['AreaCode'],
              value['First_Name'],
              value['Last_Name'],
              value['Email_ID'],
              value['Address'],
              value['City'],
              value['State'],
              value['WhomToMeet_Name'],
              value['WhomToMeet'],
              value['MDate'],
              value['MTime'],
              value['FeverStatus'],value['Cough'],
              value['Breathing_Difficulty'], value['Resp_Problem'],value['Visited_Status'],
              value['Notification_Status'],
              value['Visited_Status_Update'],
              value['ImageUrl'],
              value['ImageName']



          );

          // value['rtime'],
          // value['uid'],
          // value['reason'],
          // value['whomToMeet_Name'],
          // value['first_Name'],
          // value['mobile_NO'],
          // value['email_ID'],
          // value['address'],
          // value['city'],
          // value['areaCode'],
          // value['breathing_Difficulty'],
          // value['cough'],
          // value['feverStatus'],
          // value['last_Name'],
          // value['MDate'],
          // value['MTime'],
          // value['resp_problem'],
          // value['state'],
          // value['visited_Status'],
          // value['whomToMeet'],
          // value['notification_Status'],
          // value['visited_Status_Update'],
          // value['imageurl'],
          // value['imagename']



          bool visited=visitordatamodel.isVisited_Status();
          if(visited) {
            if (currentUser == visitordatamodel.getWhomToMeet()) {
              pastvisitorList.add(visitordatamodel);


            }
          }
          setState(() {

          });
          // }
          // setState(() {
          //
          // });
          //
          // pastvisitorList.add(visitordatamodel);
          //
          //

        });


      });

      // VisitorDataModel visitordatamodel=new VisitorDataModel.fromDataSnap(event.snapshot);
      //   bool visited=visitordatamodel.isVisited_Status();
      //   if(visited) {
      //
      //     if(currentUser==visitordatamodel.getWhomToMeet())
      //     {
      //       pastvisitorList.add(visitordatamodel);
      //       print("Data inserted...");
      //
      //     }
      //
      //   }
      //   setState(() {
      //
      //   });
    });

    dateDBChildReference.once().then((DataSnapshot snap)
    {
      var visitor=snap.value;
      visitor.forEach((key,value)
      {
        VisitorDataModel visitordatamodel=new VisitorDataModel.con(
            value['RescheduledTime'],
            value['Vuid'],
            value['Reason'],
            value['Mobile_NO'],
            value['AreaCode'],
            value['First_Name'],
            value['Last_Name'],
            value['Email_ID'],
            value['Address'],
            value['City'],
            value['State'],
            value['WhomToMeet_Name'],
            value['WhomToMeet'],
            value['MDate'],
            value['MTime'],
            value['FeverStatus'],value['Cough'],
            value['Breathing_Difficulty'], value['Resp_Problem'],value['Visited_Status'],
            value['Notification_Status'],
            value['Visited_Status_Update'],
            value['ImageUrl'],
            value['ImageName']



        );

        // value['rtime'],
        // value['uid'],
        // value['reason'],
        // value['whomToMeet_Name'],
        // value['first_Name'],
        // value['mobile_NO'],
        // value['email_ID'],
        // value['address'],
        // value['city'],
        // value['areaCode'],
        // value['breathing_Difficulty'],
        // value['cough'],
        // value['feverStatus'],
        // value['last_Name'],
        // value['MDate'],
        // value['MTime'],
        // value['resp_problem'],
        // value['state'],
        // value['visited_Status'],
        // value['whomToMeet'],
        // value['notification_Status'],
        // value['visited_Status_Update'],
        // value['imageurl'],
        // value['imagename']



        bool visited=visitordatamodel.isVisited_Status();
        if(visited) {
          if (currentUser == visitordatamodel.getWhomToMeet()) {
            pastvisitorList.add(visitordatamodel);


          }
        }
        setState(() {

        });
        // }
        // setState(() {
        //
        // });
        //
        // pastvisitorList.add(visitordatamodel);
        //
        //

      });


    });
  }

  Widget setui(int index,String uid, String fnm,String lnm,String mob,String whom_to_meet,String reason,String fstatus,String visitedstatusupdate,String mdate,String status)
  {
    final newdateDBChildReference=dateDBReference.child(currentDate);

    return new GestureDetector(
      onLongPress: (){},
      onTap: (){},
      child: Card(
        color: Colors.blue[100],
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Name : "+fnm+" "+lnm,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),



                  Text(
                    "Phone: "+mob,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  Text(
                    "Temp: "+fstatus,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  Text(
                    "To Meet : "+whom_to_meet,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  Text(
                    "Purpose : "+reason,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),


                  Text(
                    "Visited Status: "+visitedstatusupdate,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  Text(
                    "Date: "+mdate,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),




                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: (){},
                    child: Text("Call"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),

                  ),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text("Message"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),

                  ),



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

        child: pastvisitorList.length==0?Text("No Data Available"):new ListView.builder(
            itemCount: pastvisitorList.length,
            itemBuilder:(_,index)
            {
              return setui(index,pastvisitorList[index].Vuid,pastvisitorList[index].First_Name,pastvisitorList[index].Last_Name,pastvisitorList[index].Mobile_NO,pastvisitorList[index].WhomToMeet_Name,pastvisitorList[index].Reason,pastvisitorList[index].FeverStatus,pastvisitorList[index].Visited_Status_Update,pastvisitorList[index].MDate,pastvisitorList[index].Reason);
            }
        ),
      ),
    );
  }
}