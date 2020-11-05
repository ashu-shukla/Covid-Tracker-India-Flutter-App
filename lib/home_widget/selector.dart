import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test extends StatefulWidget {
  final List<dynamic> dat;
  final List<dynamic> data;
  const Test({this.dat, this.data});

  @override
  _TestState createState() => _TestState();
}

List<Map<String, dynamic>> states = [
  {'key': 'IND', 'value': 'India'},
  {'key': 'AN', 'value': 'Andaman and Nicobar Islands'},
  {'key': 'AP', 'value': 'Andhra Pradesh'},
  {'key': 'AR', 'value': 'Arunachal Pradesh'},
  {'key': 'AS', 'value': 'Assam'},
  {'key': 'BR', 'value': 'Bihar'},
  {'key': 'CH', 'value': 'Chandigarh'},
  {'key': 'CT', 'value': 'Chhattisgarh'},
  {'key': 'DN', 'value': 'Dadra and Nagar Haveli and Daman and Diu'},
  {'key': 'DL', 'value': 'Delhi'},
  {'key': 'GA', 'value': 'Goa'},
  {'key': 'GJ', 'value': 'Gujarat'},
  {'key': 'HR', 'value': 'Haryana'},
  {'key': 'HP', 'value': 'Himachal Pradesh'},
  {'key': 'JK', 'value': 'Jammu and Kashmir'},
  {'key': 'JH', 'value': 'Jharkhand'},
  {'key': 'KA', 'value': 'Karnataka'},
  {'key': 'KL', 'value': 'Kerala'},
  {'key': 'LA', 'value': 'Ladakh'},
  {'key': 'LD', 'value': 'Lakshadweep'},
  {'key': 'MP', 'value': 'Madhya Pradesh'},
  {'key': 'MH', 'value': 'Maharashtra'},
  {'key': 'MN', 'value': 'Manipur'},
  {'key': 'ML', 'value': 'Meghalaya'},
  {'key': 'MZ', 'value': 'Mizoram'},
  {'key': 'NL', 'value': 'Nagaland'},
  {'key': 'OR', 'value': 'Odisha'},
  {'key': 'PY', 'value': 'Puducherry'},
  {'key': 'PB', 'value': 'Punjab'},
  {'key': 'RJ', 'value': 'Rajasthan'},
  {'key': 'SK', 'value': 'Sikkim'},
  {'key': 'TN', 'value': 'Tamil Nadu'},
  {'key': 'TG', 'value': 'Telangana'},
  {'key': 'TR', 'value': 'Tripura'},
  {'key': 'UP', 'value': 'Uttar Pradesh'},
  {'key': 'UT', 'value': 'Uttarakhand'},
  {'key': 'WB', 'value': 'West Bengal'},
];

class _TestState extends State<Test> {
  String selectedState;
  List<dynamic> dist;
  List<dynamic> dam;

  @override
  void initState() {
    super.initState();
    _loadLocaton();
  }

  var stem;
  //Loading counter value on start
  _loadLocaton() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedState = (prefs.getString('selectedState') ?? 'India');
      stem = selectedState == 'India' ? 'Assam' : selectedState;
    });
  }

  showPicker() async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CupertinoPicker(
            scrollController: FixedExtentScrollController(initialItem: 1),
            backgroundColor: Colors.white,
            magnification: 1,
            useMagnifier: true,
            onSelectedItemChanged: (pos) async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              setState(() {
                selectedState = states[pos]['value'];
                stem = selectedState;
                prefs.setString('selectedState', selectedState);
              });
            },
            itemExtent: 35,
            children: List.generate(states.length, (index) {
              return Text(
                states[index]['value'],
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Poppins"),
              );
            }),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (selectedState == null) {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Center(
          child: Text(
            'Loading...',
            style: TextStyle(fontFamily: "Poppins"),
          ),
        ),
      );
    } else {
      widget.dat.forEach((element) {
        if (element.statename.toString() == '$stem') {
          dist = element.districtData;
          dist.forEach((element) => dam = element.distcases);
        }
      });
      return Container(
        width: MediaQuery.of(context).size.width * .8,
        // height: MediaQuery.of(context).size.width * .1,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.width * .08),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Select Location:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 242, 74, 141),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * .05,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .5,
                    height: MediaQuery.of(context).size.height * .05,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 202, 220, 229),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * .5,
                            height: MediaQuery.of(context).size.height * .05,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9)),
                              ),
                              onPressed: showPicker,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 200,
                                    child: Text(
                                      "$selectedState",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                .04,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(child: Icon(Icons.arrow_drop_down)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: selectedState != 'India' ? true : false,
              child: Container(
                width: MediaQuery.of(context).size.width * .95,
                child: DataTable(
                  columnSpacing: 18,
                  headingRowHeight: 25,
                  dividerThickness: 0,
                  dataRowHeight: MediaQuery.of(context).size.width * .12,
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text(
                        'District',
                        style: TextStyle(
                            color: Color.fromARGB(255, 75, 66, 121),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.width * .03),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Cnfrm',
                        style: TextStyle(
                            color: Color.fromARGB(210, 253, 78, 113),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.width * .03),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Rec',
                        style: TextStyle(
                            color: Color.fromARGB(255, 109, 212, 0),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.width * .03),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Dcs',
                        style: TextStyle(
                            color: Color.fromARGB(210, 148, 117, 255),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.width * .03),
                      ),
                    ),
                  ],
                  rows: dam
                      .map(
                        ((e) => DataRow(
                              cells: <DataCell>[
                                DataCell(
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                        child: Text(
                                          e.name,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 75, 66, 121),
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w600,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .03,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        e.confirmed.toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 75, 66, 121),
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w600,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .03),
                                      ),
                                      Visibility(
                                        visible:
                                            e.deltaconfirmed.toString() != '0'
                                                ? true
                                                : false,
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                child: Icon(
                                              Icons.arrow_drop_up,
                                              color: Color.fromARGB(
                                                  255, 253, 78, 113),
                                            )),
                                            Text(
                                              e.deltaconfirmed.toString(),
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    210, 253, 78, 113),
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .026,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        e.recovered.toString(),
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 75, 66, 121),
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w600,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .03),
                                      ),
                                      Visibility(
                                        visible:
                                            e.deltarecovered.toString() != '0'
                                                ? true
                                                : false,
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                child: Icon(
                                              Icons.arrow_drop_up,
                                              color: Color.fromARGB(
                                                  255, 109, 212, 0),
                                            )),
                                            Text(
                                              e.deltarecovered.toString(),
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      210, 109, 212, 0),
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .026),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        e.deceased.toString(),
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 75, 66, 121),
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w600,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .03),
                                      ),
                                      Visibility(
                                        visible:
                                            e.deltadeceased.toString() != '0'
                                                ? true
                                                : false,
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                child: Icon(
                                              Icons.arrow_drop_up,
                                              color: Color.fromARGB(
                                                  255, 253, 78, 113),
                                            )),
                                            Text(
                                              e.deltadeceased.toString(),
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      210, 148, 117, 255),
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .026),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      )
                      .toList(),
                ),
              ),
            ),
            Visibility(
              visible: selectedState == "India" ? true : false,
              child: DataTable(
                columnSpacing: 18,
                headingRowHeight: 25,
                dividerThickness: 0,
                dataRowHeight: MediaQuery.of(context).size.width * .155,
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      'State/UT',
                      style: TextStyle(
                        color: Color.fromARGB(255, 75, 66, 121),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.width * .03,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Cnfrm',
                      style: TextStyle(
                        color: Color.fromARGB(210, 253, 78, 113),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.width * .03,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Rec',
                      style: TextStyle(
                        color: Color.fromARGB(255, 109, 212, 0),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.width * .03,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Dcs',
                      style: TextStyle(
                        color: Color.fromARGB(255, 253, 78, 113),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.width * .03,
                      ),
                    ),
                  ),
                ],
                rows: widget.data
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        (() {
                                          if (element.state ==
                                              "State Unassigned") {
                                            return "Cases that are being reassigned";
                                          } else if (element.state ==
                                              "Dadra and Nagar Haveli and Daman and Diu") {
                                            return "Daman Diu and Dadra and Nagar...";
                                          } else {
                                            return element.state;
                                          }
                                        })(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 75, 66, 121),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .03,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      element.confirmed,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 75, 66, 121),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                .03,
                                      ),
                                    ),
                                    Visibility(
                                      visible: element.deltaconfirmed != '0'
                                          ? true
                                          : false,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                              child: Icon(
                                            Icons.arrow_drop_up,
                                            color: Color.fromARGB(
                                                255, 253, 78, 113),
                                          )),
                                          Text(
                                            element.deltaconfirmed,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  210, 253, 78, 113),
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w400,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .026,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      element.recovered,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 75, 66, 121),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                .03,
                                      ),
                                    ),
                                    Visibility(
                                      visible: element.deltarecovered != '0'
                                          ? true
                                          : false,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                              child: Icon(
                                            Icons.arrow_drop_up,
                                            color: Color.fromARGB(
                                                255, 109, 212, 0),
                                          )),
                                          Text(
                                            element.deltarecovered,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  210, 109, 212, 0),
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w400,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .026,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      element.deaths,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 75, 66, 121),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                .03,
                                      ),
                                    ),
                                    Visibility(
                                      visible: element.deltadeaths != '0'
                                          ? true
                                          : false,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                              child: Icon(
                                            Icons.arrow_drop_up,
                                            color: Color.fromARGB(
                                                255, 253, 78, 113),
                                          )),
                                          Text(
                                            element.deltadeaths,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  210, 148, 117, 255),
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w400,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .026,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }
  }
}
