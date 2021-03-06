import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

class Company extends StatelessWidget {
  final int text;
  const Company({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _expanded = false;
    var _test = "Full Screen";
    return FutureBuilder<String>(
        future: rootBundle.loadString('assets/Companies.csv'), //
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<List<dynamic>> csvTable =
              CsvToListConverter().convert(snapshot.data);
          return Scaffold(
            backgroundColor: const Color(0xffD9D7F1),
            body: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${csvTable[text][0]}",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Color.fromARGB(255, 47, 47, 47), fontSize: 24),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: const Radius.circular(20),
                            topRight: const Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            new Expanded(
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(8),
                                  itemCount: 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      child: Column(
                                        children: [
                                          ListTile(
                                            // leading: Image.network(
                                            //   "${csvTable[text][1]}",
                                            //   height: 150,
                                            //   width: 150,
                                            // ),
                                            title: Text(
                                              '${csvTable[text][3]}',
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 25,
                                                    vertical: 20),
                                            subtitle: Text(''),
                                            isThreeLine: true,
                                          ),
                                          ListTile(
                                            // leading: Image.network(
                                            //   "${csvTable[text][1]}",
                                            //   height: 150,
                                            //   width: 150,
                                            // ),
                                            title: Text(
                                              '${csvTable[text][4]}',
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 25,
                                                    vertical: 20),
                                            subtitle: Text(' '),
                                            isThreeLine: true,
                                          ),
                                          ListTile(
                                            // leading: Image.network(
                                            //   "${csvTable[text][1]}",
                                            //   height: 150,
                                            //   width: 150,
                                            // ),
                                            title: Text(
                                              '${csvTable[text][5]}',
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 25,
                                                    vertical: 20),
                                            subtitle: Text(' '),
                                            isThreeLine: true,
                                          ),
                                          ListTile(
                                            // leading: Image.network(
                                            //   "${csvTable[text][1]}",
                                            //   height: 150,
                                            //   width: 150,
                                            // ),
                                            title: Text(
                                              '${csvTable[text][6]}',
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 25,
                                                    vertical: 20),
                                            subtitle: Text(' '),
                                            isThreeLine: true,
                                          ),
                                          ListTile(
                                            // leading: Image.network(
                                            //   "${csvTable[text][1]}",
                                            //   height: 150,
                                            //   width: 150,
                                            // ),
                                            title: Text(
                                              '${csvTable[text][7]}',
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 25,
                                                    vertical: 20),
                                            subtitle: Text(' '),
                                            isThreeLine: true,
                                          ),
                                          Text(
                                              "Find all questions and answers here"),
                                          SizedBox(
                                            height: 60,
                                          )
                                        ],
                                      ),
                                      color: const Color.fromARGB(
                                          255, 255, 230, 230),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  bool _expanded = false;
  var _test = "Full Screen";
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 200,
        margin: EdgeInsets.all(10),
        color: Colors.green,
        child: ExpansionPanelList(
          animationDuration: Duration(milliseconds: 2000),
          children: [
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text(
                    'Click To Expand',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              },
              body: ListTile(
                title: Text('Description text',
                    style: TextStyle(color: Colors.black)),
              ),
              isExpanded: _expanded,
              canTapOnHeader: true,
            ),
          ],
          dividerColor: Colors.grey,
          expansionCallback: (panelIndex, isExpanded) {
            _expanded = !_expanded;
            setState(() {});
          },
        ),
      ),
    ]);
  }
}
