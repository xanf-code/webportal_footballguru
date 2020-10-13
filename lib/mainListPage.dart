import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webportal_footballguru/homepage.dart';

import 'List/listScreen.dart';

class EntryPage extends StatefulWidget {
  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF18203d),
        elevation: 0,
        title: Text('AFCAI Clubs Portal'),
      ),
      backgroundColor: Color(0xFF18203d),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'AssamClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Assam",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'BiharClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Bihar",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'DelhiClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Delhi",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'GoaClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Goa",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'GujClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Gujarat",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'HaryanaClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Harayana",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'JKClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Jammu and Kashmir",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'JharkandClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Jharkhand",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'KarnatakaClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Karnataka",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'KeralaClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Kerala",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'ChattisgarhClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Chhattisgarh",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'MPClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Madhya Pradesh",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'MaharastraClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Maharastra",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'ManipurClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Manipur",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'MeghaClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Meghalaya",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'MizoramClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Mizoram",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'NagalandClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Nagaland",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'OdishaClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Odisha",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'PunjabClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Punjab",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'RajastanClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Rajastan",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'SikkimClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Sikkim",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'TamilnaduClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Tamil Nadu",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'TelanganaClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Telangana",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'UPClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Uttar Pradesh",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'WBClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "West Bengal",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MyHomePage(
                      dbName: 'PanIndianClubs',
                    ),
                  ),
                );
              },
              child: CardWidget(
                name: "Pan India",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatefulWidget {
  final String name;
  const CardWidget({
    Key key,
    this.name,
  }) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF232c51),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Center(
          child: Text(
            widget.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
