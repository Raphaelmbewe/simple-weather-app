import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'shared.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'database_helper.dart';
import 'searchweather.dart';

class HomeForClipPath1 extends StatefulWidget {
  final dynamic city;
  const HomeForClipPath1({Key key,this.city}) : super(key: key);
  @override
  _HomeForClipPath1State createState() => _HomeForClipPath1State();
}

class _HomeForClipPath1State extends State<HomeForClipPath1> {
  // setting dataBaseHelper object
  DataBaseHelper dataBaseHelper = DataBaseHelper();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder(
            future: dataBaseHelper.fetchData(city: widget.city ?? 'lusaka'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    ClipPath(
                      clipper: ClipHere(),
                      child: Container(
                        width: width,
                        height: height * 0.50,
                        decoration: BoxDecoration(
                          color: Colors.green[900],
                        ),
                        child: Center(
                          //children of the cliped
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30.0,
                              ),
                              //next
                              Text(
                                'current weather',
                                style: fonts,
                              ),
                              //next
                              Text(
                                "${snapshot.data['main']['temp']}°",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 68,
                                ),
                              ),
                              //next
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_on),
                                  Text(
                                    snapshot.data['name'].toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //next to show weather
                    ListTile(
                      leading: CircleAvatar(
                        child: FaIcon(FontAwesomeIcons.thermometerHalf,
                            color: Colors.black, size: 20.0),
                        radius: 25.0,
                        backgroundColor: Colors.green[800],
                      ),
                      title: Text('Temperature'),
                      trailing: Text(
                        "${snapshot.data['main']['temp']}°",
                      ),
                    ),
                    //next
                    ListTile(
                      leading: CircleAvatar(
                        child: FaIcon(FontAwesomeIcons.airbnb,
                            color: Colors.black, size: 20.0),
                        radius: 25.0,
                        backgroundColor: Colors.green[800],
                      ),
                      title: Text('Humidity'),
                      trailing: Text("${snapshot.data['main']['humidity']}%"),
                    ),
                    //next
                    ListTile(
                      leading: CircleAvatar(
                        child: FaIcon(FontAwesomeIcons.wind,
                            color: Colors.black, size: 20.0),
                        radius: 25.0,
                        backgroundColor: Colors.green[800],
                      ),
                      title: Text('Wind Speed'),
                      trailing: Text("${snapshot.data['wind']['speed']}m/s"),
                    ),
                    //next
                    ListTile(
                      leading: CircleAvatar(
                        child: FaIcon(FontAwesomeIcons.skyatlas,
                            color: Colors.black, size: 20.0),
                        radius: 25.0,
                        backgroundColor: Colors.green[800],
                      ),
                      title: Text('Pressure'),
                      trailing: Text("${snapshot.data['main']['pressure']}mb"),
                    ),
                    //BottomBar
                    ClipPath(
                      clipper: BottomClip(),
                      child: Container(
                        color: Colors.green[900],
                        width: width,
                        height: height * 0.15,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                    'max: ${snapshot.data['main']['temp_max']}°'),
                                Text(
                                    'min : ${snapshot.data['main']['temp_min']}°'),
                              ],
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: FlatButton.icon(
                                onPressed: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchData(),
                                  ),
                                ),
                                icon: Icon(
                                  Icons.search,
                                  size: 40,
                                ),
                                label: Text(''),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: CupertinoActivityIndicator());
              }
            }),
      ),
    );
  }
}
