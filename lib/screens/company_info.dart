import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:interview_bunny/screens/company.dart';

class CompanyInfo extends StatefulWidget {
  const CompanyInfo({Key? key}) : super(key: key);

  @override
  _CompanyInfoState createState() => _CompanyInfoState();
}

int i = 0;

class _CompanyInfoState extends State<CompanyInfo> {
  late double screenHeight;

  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final List<List<dynamic>> csvTable = [];

  @override
  Widget build(BuildContext context) {
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
                    "Comapany Specific Prep",
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
                            new Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: new ListTile(
                                leading: new Icon(Icons.search),
                                title: new TextField(
                                  decoration: new InputDecoration(
                                    hintText: 'Search',
                                  ),
                                ),
                              ),
                            ),
                            new Expanded(
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(8),
                                  itemCount: csvTable.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      child: Card(
                                        child: ListTile(
                                          leading: Image.network(
                                            "${csvTable[index][1]}",
                                            height: 130,
                                            width: 130,
                                          ),
                                          title: Text(
                                            '${csvTable[index][0]}',
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 25, vertical: 20),
                                          subtitle:
                                              Text(' ${csvTable[index][2]}'),
                                          isThreeLine: true,
                                        ),
                                        color: const Color.fromARGB(
                                            255, 255, 230, 230),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onTap: () {
                                        print(index);

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Company(
                                                    text: index,
                                                  )),
                                        );
                                      },
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
