import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitorproject/AuthorityDataModel.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  List<AuthorityDataModel> userlist=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final userdbRef=FirebaseDatabase.instance.reference().child("Users");
    userdbRef.once().then((DataSnapshot snap)
      {

           var user=snap.value;
           userlist.clear();
           user.forEach((key,value)
           {
                AuthorityDataModel authoritydatamodel=new AuthorityDataModel(
                  value['designation'],
                  value['phone'],
                  value['email'],
                  value['image'],
                  value['name'],
                  value['organization'],
                  value['uid'],
                );
                userlist.add(authoritydatamodel);
           });
           setState(() {

           });
      }
    );
  }

  Widget createUserList(String des,String mob,String email,String img,String nm,String org,String uid)
  {
      return GestureDetector(
        onTap: (){},
        onLongPress: (){},
        child:  Card(
      color: Colors.blue[100],
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("asset/images/user.png",
                    width: 60,
                    height: 60,),
                    Text(
                      '\t'+nm + '\n\t' +
                      des + '\n\t' +
                      mob +    '\n\t' +
                      org+'\n\t' ,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton(onPressed: (){},
                      child: Text("Call"),

                    ),
                    SizedBox(width: 30.0,),
                    ElevatedButton(onPressed: (){},
                        child: Text("Message")),
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
        title: Text("User List"),
        backgroundColor: Colors.blue[600],
      ),

      body: new Container(
        child: userlist.length==0?Text("No users "):ListView.builder(
          itemCount: userlist.length,
            itemBuilder: (_,index)
            {
                return  createUserList(userlist[index].designation, userlist[index].phone,userlist[index].email,userlist[index].image, userlist[index].name, userlist[index].organization, userlist[index].uid);
            }
        ),
      ),
    );
  }
}
