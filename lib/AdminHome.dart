import 'FacultyList.dart';
import 'VisitorList.dart';
import 'package:flutter/material.dart';

class modifiedList extends StatefulWidget {
  const modifiedList({Key? key}) : super(key: key);

  @override
  _modifiedListState createState() => _modifiedListState();
}

class _modifiedListState extends State<modifiedList> {

  String str = 'Visitor List';
  List<FacultyList> facultyList = [
    FacultyList(nm: 'Subhash Tatale',
        des: 'Teacher',
        mobno: '8989898989'),
    FacultyList(nm: 'Atul Kulkarni',
        des: 'Teacher',
        mobno: '8788155890'),


  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty List'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),

      body:_buildRow(),
    );
  }

  Widget _buildRow() {
    return ListView.builder(
        itemCount: facultyList.length,
        itemBuilder: (context, index) {
          return Card(
            child:Padding(padding:  const EdgeInsets.only(top: 30.0),
              child: ListTile(

                leading: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('asset/images/user.png'),

                ),
                title: Text('\t' + facultyList[index].nm + '\n\t' +
                    facultyList[index].mobno + '\n\t' +
                    facultyList[index].des + '\n\t' ,

                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.normal,

                  ),
                ),

                // onTap: () {
                //   setState(() {
                //
                //     visitorsList.insert(index, VisitorList
                //       (nm: 'Name$index',
                //         purpose: 'Purpose$index',
                //         fever: 'fever$index',
                //         mobno: 'mobno$index'));
                //   });
                //
                //   print('$index tapped.');
                // },
                // onLongPress: () {
                //   setState(() {
                //     visitorsList.removeAt(index);
                //
                //   });
                //   print('$index Removed.');
                // },
              ),
            ),
          );
        }


    );
  }
}