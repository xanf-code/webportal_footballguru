import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webportal_footballguru/List/listScreen.dart';

class MyHomePage extends StatefulWidget {
  final String dbName;

  MyHomePage({Key key, this.dbName}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController logoController = TextEditingController();
  TextEditingController foundedController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController backgroundController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController event1Controller = TextEditingController();
  TextEditingController event1dateController = TextEditingController();
  TextEditingController event1detailsController = TextEditingController();
  TextEditingController event2Controller = TextEditingController();
  TextEditingController event2dateController = TextEditingController();
  TextEditingController event2detailsController = TextEditingController();

  Map<String, dynamic> detailsToAdd;

  addDetails() {
    detailsToAdd = {
      "name": nameController.text,
      "logo": logoController.text,
      "Founded": foundedController.text,
      "Type": typeController.text,
      "background": backgroundController.text,
      "desc": descriptionController.text,
      "event1": event1Controller.text,
      "event1date": event1dateController.text,
      "event1details": event1detailsController.text,
      "event2": event2Controller.text,
      "event2date": event2dateController.text,
      "event2details": event2detailsController.text,
    };

    FirebaseFirestore.instance
        .collection(widget.dbName)
        .add(detailsToAdd)
        .whenComplete(() {
      nameController.clear();
      logoController.clear();
      foundedController.clear();
      typeController.clear();
      backgroundController.clear();
      descriptionController.clear();
      event1Controller.clear();
      event1dateController.clear();
      event1detailsController.clear();
      event2Controller.clear();
      event2dateController.clear();
      event2detailsController.clear();
    });
  }

  _buildTextField(TextEditingController controller, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: Color(0xFF232c51), border: Border.all(color: Colors.blue)),
        child: TextField(
          controller: controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              labelText: labelText,
              labelStyle: TextStyle(color: Colors.white),
              border: InputBorder.none),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF18203d),
        elevation: 0,
        title: Text('AFCAI Clubs Portal'),
        actions: [
          IconButton(
              icon: Icon(Icons.folder_open),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (_) => PanListScreen(
                              dbListName: widget.dbName,
                            )));
              })
        ],
      ),
      backgroundColor: Color(0xFF18203d),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildTextField(nameController, 'Name'),
            _buildTextField(logoController, 'Logo Link'),
            _buildTextField(foundedController, 'Date Founded'),
            _buildTextField(typeController, 'Club Type'),
            _buildTextField(backgroundController, 'Background Image'),
            _buildTextField(descriptionController, 'Description'),
            _buildTextField(event1Controller, 'Event 1'),
            _buildTextField(event1dateController, 'Event 1 Date'),
            _buildTextField(event1detailsController, 'Event 1 Details'),
            _buildTextField(event2Controller, 'Event 2'),
            _buildTextField(event2dateController, 'Event 2 Date'),
            _buildTextField(event2detailsController, 'Event 2 Details'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                color: Colors.greenAccent,
                onPressed: () {
                  addDetails();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Submit Details'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
