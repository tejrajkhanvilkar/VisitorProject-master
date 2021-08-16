import 'package:flutter/material.dart';

class editProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Edit Profile';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          elevation: 0,
          title: Text(appTitle),
          centerTitle: true,
        ),
        body: MyCustomForm2(),
      ),
    );
  }
}
// Create a Form widget.
class MyCustomForm2 extends StatefulWidget {
  @override
  editFormState createState() {
    return editFormState();
  }
}
// Create a corresponding State class. This class holds data related to the form.
class editFormState extends State<MyCustomForm2> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: const EdgeInsets.only(top: 50.0),
            child:Center(
                child:Text("Edit Profile Here")
            ),),
          Padding(padding: const EdgeInsets.only(top: 20.0),
            child:TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
            ),),
          Padding(padding: const EdgeInsets.only(top: 20.0),
            child:TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone),
                hintText: 'Enter a phone number',
                labelText: 'Phone',
              ),
            ),),
          Padding(padding: const EdgeInsets.only(top: 20.0),
            child:TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'Enter your email',
                labelText: 'E-mail',
              ),
            ),),
          Padding(padding: const EdgeInsets.only(top: 20.0),
            child:TextFormField(

              decoration: const InputDecoration(
                icon: const Icon(Icons.password),
                hintText: 'Enter your password',
                labelText: 'Password',
              ),
            ),),
          Padding(padding: const EdgeInsets.only(top: 20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person_off_sharp),
                hintText: 'Enter your Designation',
                labelText: 'Designation',
              ),
            ),
          ),
          Center(
            child:Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child:SizedBox(
                  height: 30,
                  width: 300,
                  child: new ElevatedButton(
                    child: const Text('Update'),
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(primary: Colors.blue[700]),
                  )),),),
        ],
      ),
    );
  }
}