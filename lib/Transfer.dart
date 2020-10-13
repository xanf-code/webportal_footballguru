import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webportal_footballguru/ListScreen.dart';

class AddTransfer extends StatefulWidget {
  @override
  _AddTransferState createState() => _AddTransferState();
}

class _AddTransferState extends State<AddTransfer> {
  Color primaryColor = Color(0xFF18203D);
  Color secondaryColor = Color(0xFF232c51);
  Color logoGreen = Color(0xFF25bcbb);
  DateTime _currentdate = new DateTime.now();

  TextEditingController featuredimageController = TextEditingController();
  TextEditingController marketvalueController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController teamimageController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController toteamController = TextEditingController();
  TextEditingController fromteamController = TextEditingController();
  TextEditingController positionController = TextEditingController();

  Map<String, dynamic> transfertoAdd;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("transfers");

  addTransfer() {
    transfertoAdd = {
      "playername": nameController.text,
      "teamlogo": teamimageController.text,
      "featured_image": featuredimageController.text,
      "marketvalue": marketvalueController.text,
      "subtitle": subtitleController.text,
      "toteam": toteamController.text,
      "fromteam": fromteamController.text,
      "position": positionController.text,
      'time': _currentdate,
    };
    collectionReference.add(transfertoAdd).whenComplete(
          () => print("Added to the Database"),
        );
  }

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: secondaryColor,
        border: Border.all(color: Colors.blue),
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            border: InputBorder.none),
        textInputAction: TextInputAction.next,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Transfer Dashboard",
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                ),
                _buildTextField(nameController, "Name"),
                SizedBox(
                  height: 20,
                ),
                _buildTextField(featuredimageController, "Featured Image"),
                SizedBox(
                  height: 20,
                ),
                _buildTextField(marketvalueController, "Market Value"),
                SizedBox(
                  height: 20,
                ),
                _buildTextField(teamimageController, "To Team Image"),
                SizedBox(
                  height: 20,
                ),
                _buildTextField(subtitleController, "Subtitle"),
                SizedBox(
                  height: 20,
                ),
                _buildTextField(fromteamController, "From Team Name"),
                SizedBox(
                  height: 20,
                ),
                _buildTextField(toteamController, "To Team Name"),
                SizedBox(
                  height: 20,
                ),
                _buildTextField(positionController, "Position"),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  padding: EdgeInsets.all(16),
                  color: logoGreen,
                  child: Text("Add Transfer"),
                  onPressed: () {
                    addTransfer();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Data Created"),
                        actions: [
                          FlatButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "OK",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) => ListScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Database Screen",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => ListScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://fansmuseum.org/wp-content/uploads/2018/09/Football-Stadium-background.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.darken),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Transfer Database",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
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
  }
}
