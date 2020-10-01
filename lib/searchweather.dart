import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'shared.dart';
import 'weatherdetails.dart';
import 'database_helper.dart';
class SearchData extends StatefulWidget {
  @override
  _SearchDataState createState() => _SearchDataState();
}

class _SearchDataState extends State<SearchData> {
  TextEditingController _userCityName = TextEditingController();
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // final double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[900],
        body: Column(
          children: <Widget>[
            Container(
              width: width,
              //height: height,
              color: Colors.green[900],
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'check your weather',
                    style: fonts,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                      child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _userCityName,
                        decoration: textInputDecorations.copyWith(
                          hintText: 'search city',
                        ),
                      ),
                      //searchButton
                      SizedBox(
                        height: 30,
                      ),
                      RaisedButton(
                          child: Text('search'),
                          onPressed: () async {
                            // close the keyboard before user navigate to diffrent screen
                            FocusScope.of(context).requestFocus(FocusNode());

                            Navigator.of(context)
                                .pushReplacement(CupertinoPageRoute(
                                    builder: (context) => HomeForClipPath1(
                                          city: _userCityName.text
                                              .toString()
                                              .toLowerCase(),
                                        )));
                          }),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
