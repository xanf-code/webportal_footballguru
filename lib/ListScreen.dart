import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Color primaryColor = Color(0xFF18203D);
  Color secondaryColor = Color(0xFF232c51);
  Color logoGreen = Color(0xFF25bcbb);

  TextEditingController featuredimageController = TextEditingController();
  TextEditingController marketvalueController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController teamimageController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController toteamController = TextEditingController();
  TextEditingController fromteamController = TextEditingController();
  TextEditingController positionController = TextEditingController();

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: secondaryColor,
        border: Border.all(color: Colors.blue),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }

  final Query ref = FirebaseFirestore.instance
      .collection('transfers')
      .orderBy("time", descending: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Transfers",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: primaryColor,
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  var doc = snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      nameController.text = doc['playername'];
                      featuredimageController.text = doc['featured_image'];
                      marketvalueController.text = doc['marketvalue'];
                      teamimageController.text = doc['teamlogo'];
                      subtitleController.text = doc['subtitle'];
                      positionController.text = doc['position'];
                      fromteamController.text = doc['fromteam'];
                      toteamController.text = doc['toteam'];
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Container(
                            color: primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  _buildTextField(nameController, "Name"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  _buildTextField(featuredimageController,
                                      "Featured Image"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  _buildTextField(
                                      marketvalueController, "Market Value"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  _buildTextField(
                                      teamimageController, "To Team Image"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  _buildTextField(
                                      subtitleController, "Subtitle"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  _buildTextField(
                                      positionController, "Position"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  _buildTextField(
                                      fromteamController, "From Team Name"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  _buildTextField(
                                      toteamController, "To Team Name"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MaterialButton(
                                    padding: EdgeInsets.all(16),
                                    color: logoGreen,
                                    child: Text("Update Transfer"),
                                    onPressed: () {
                                      snapshot.data.docs[index].reference
                                          .update({
                                        "playername": nameController.text,
                                        "featured_image":
                                            featuredimageController.text,
                                        "marketvalue":
                                            marketvalueController.text,
                                        "teamlogo": teamimageController.text,
                                        "subtitle": subtitleController.text,
                                        "position": positionController.text,
                                        "fromteam": fromteamController.text,
                                        "toteam": toteamController.text,
                                      }).whenComplete(
                                              () => Navigator.pop(context));
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MaterialButton(
                                    padding: EdgeInsets.all(16),
                                    color: Colors.red,
                                    child: Text(
                                      "Delete Transfer",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      snapshot.data.docs[index].reference
                                          .delete()
                                          .whenComplete(
                                              () => Navigator.pop(context));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Container(
                        height: 230,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black54,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, left: 15, right: 15, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    doc["subtitle"].toString().toUpperCase(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${DateTime.fromMillisecondsSinceEpoch(doc['time'].millisecondsSinceEpoch)}"
                                        .replaceRange(10, 23, "")
                                        .replaceAll("-", "/"),
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 0.5,
                              indent: 15,
                              endIndent: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, top: 15, right: 15, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 27,
                                    backgroundColor: Colors.yellow,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                        (doc["featured_image"]),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      doc["playername"] == null
                                          ? Text("")
                                          : Text(
                                              doc["playername"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                      doc["position"] == null
                                          ? Text("")
                                          : Text(
                                              doc["position"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white60),
                                            ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                        width: 120,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF27b076),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          doc['marketvalue'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  doc["teamlogo"] == null
                                      ? CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Color(0xFF222327),
                                          child: CachedNetworkImage(
                                            height: 35,
                                            width: 35,
                                            imageUrl:
                                                "https://simplehq.co/wp-content/uploads/2017/02/image-placeholder-blue.png",
                                          ),
                                        )
                                      : CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Color(0xFF222327),
                                          child: CachedNetworkImage(
                                            height: 35,
                                            width: 35,
                                            imageUrl: doc["teamlogo"],
                                          ),
                                        ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 0.5,
                              indent: 15,
                              endIndent: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  doc["fromteam"] == null
                                      ? Text("")
                                      : Text(
                                          doc["fromteam"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white60),
                                        ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.white60,
                                  ),
                                  doc["toteam"] == null
                                      ? Text("")
                                      : Text(
                                          doc["toteam"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white60),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Text("");
          }
        },
      ),
    );
  }
}
