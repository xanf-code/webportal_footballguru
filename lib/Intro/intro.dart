import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webportal_footballguru/Transfer.dart';
import 'package:webportal_footballguru/mainListPage.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF18203d),
        elevation: 0,
        title: Text('Admin Portal'),
      ),
      backgroundColor: Color(0xFF18203d),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => AddTransfer(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 0,
                child: twoWid(
                  image:
                      "https://www.131events.com/wp-content/uploads/2016/08/transfer-510x600.png",
                  title: "Transfers",
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => EntryPage(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 0,
                child: twoWid(
                  image:
                      "https://s3-us-west-2.amazonaws.com/theathletic-league-logos/league-16-color.png",
                  title: "AFCAI Portal",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class twoWid extends StatelessWidget {
  final String image;
  final String title;
  const twoWid({
    Key key,
    this.image,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      color: Color(0xFF232c51),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            image,
            height: 100,
            width: 100,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
