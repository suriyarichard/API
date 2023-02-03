import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataListView2 extends StatelessWidget {
  var items;
  DataListView2({required this.items});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        childrenPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        expandedCrossAxisAlignment: CrossAxisAlignment.end,
        title: Text(
          "Items: ${items['id']}",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        children: <Widget>[
          ListTile(
            title: RichText(
              text: TextSpan(
                text: 'ID: ',
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: items['id'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                text: 'Name : ',
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: items['name'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                text: 'Category : ',
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: items['category'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                text: 'Locked : ',
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: items['locked'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                text: 'Duration : ',
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: items['duration'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                text: 'createdAt : ',
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: items['createdAt'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
