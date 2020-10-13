import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PanListScreen extends StatefulWidget {
  final String dbListName;

  const PanListScreen({Key key, this.dbListName}) : super(key: key);
  @override
  _PanListScreenState createState() => _PanListScreenState();
}

class _PanListScreenState extends State<PanListScreen> {
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
        title: Text('Clubs List'),
      ),
      backgroundColor: Color(0xFF18203d),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(widget.dbListName)
              .snapshots(),
          builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    var doc = snapshot.data.docs[index];
                    return ListTile(
                      leading: IconButton(
                        icon: Icon(Icons.edit),
                        color: Colors.white,
                        onPressed: () {
                          nameController.text = doc['name'];
                          logoController.text = doc["logo"];
                          foundedController.text = doc["Founded"];
                          typeController.text = doc["Type"];
                          backgroundController.text = doc["background"];
                          descriptionController.text = doc["desc"];
                          event1Controller.text = doc["event1"];
                          event1dateController.text = doc["event1date"];
                          event1detailsController.text = doc["event1details"];
                          event2Controller.text = doc["event2"];
                          event2dateController.text = doc["event2date"];
                          event2detailsController.text = doc["event2details"];
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: Container(
                                color: Color(0xFF18203d),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      _buildTextField(nameController, 'Name'),
                                      _buildTextField(
                                          logoController, 'Logo Link'),
                                      _buildTextField(
                                          foundedController, 'Date Founded'),
                                      _buildTextField(
                                          typeController, 'Club Type'),
                                      _buildTextField(backgroundController,
                                          'Background Image'),
                                      _buildTextField(
                                          descriptionController, 'Description'),
                                      _buildTextField(
                                          event1Controller, 'Event 1'),
                                      _buildTextField(
                                          event1dateController, 'Event 1 Date'),
                                      _buildTextField(event1detailsController,
                                          'Event 1 Details'),
                                      _buildTextField(
                                          event2Controller, 'Event 2'),
                                      _buildTextField(
                                          event2dateController, 'Event 2 Date'),
                                      _buildTextField(event2detailsController,
                                          'Event 2 Details'),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FlatButton(
                                          color: Colors.greenAccent,
                                          onPressed: () {
                                            snapshot.data.docs[index].reference
                                                .update({
                                              "name": nameController.text,
                                              "logo": logoController.text,
                                              "Founded": foundedController.text,
                                              "Type": typeController.text,
                                              "background":
                                                  backgroundController.text,
                                              "desc":
                                                  descriptionController.text,
                                              "event1": event1Controller.text,
                                              "event1date":
                                                  event1dateController.text,
                                              "event1details":
                                                  event1detailsController.text,
                                              "event2": event2Controller.text,
                                              "event2date":
                                                  event2dateController.text,
                                              "event2details":
                                                  event2detailsController.text,
                                            }).whenComplete(() =>
                                                    Navigator.pop(context));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text('Update Details'),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8,
                                          bottom: 8,
                                        ),
                                        child: FlatButton(
                                          color: Colors.red,
                                          onPressed: () {
                                            snapshot.data.docs[index].reference
                                                .delete()
                                                .whenComplete(() =>
                                                    Navigator.pop(context));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              'Delete Details',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      title: Text(
                        doc['name'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        doc['desc'],
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: Image.network(
                        doc['logo'],
                        fit: BoxFit.cover,
                      ),
                    );
                  });
            }
          }),
    );
  }
}
