import 'dart:convert';
import 'package:API/screens/datalist1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class api1 extends StatefulWidget {
  const api1({super.key});

  @override
  State<api1> createState() => _api2State();
}

class _api2State extends State<api1> {
  var resultResponse;

  Future apicall() async {
    http.Response response;
    response = await http.get(
        Uri.parse("https://632017e19f82827dcf24a655.mockapi.io/api/programs"));

    if (response.statusCode == 200) {
      setState(() {
        resultResponse = response.body;
      });
    }

    // print(resultResponse);

    return resultResponse;
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Api-1")),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: FutureBuilder(
              future: apicall(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Some error occurred'),
                  );
                } else if (snapshot.hasData) {
                  var data = json.decode(snapshot.data);

                  return Column(
                    children: [
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'RequestID:  ${data['requestId']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'count: ${data['count']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'AnyKey :${data['anyKey']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.61,
                        child: ListView.builder(
                          itemCount: data['items'].length,
                          itemBuilder: (context, index) {
                            return DataListView(
                              items: data['items'][index],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }

                return CircularProgressIndicator();
              },
            ),
            //
          ),
        ));
  }
}
