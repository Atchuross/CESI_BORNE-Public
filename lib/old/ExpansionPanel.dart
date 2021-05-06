/// Flutter code sample for ExpansionPanelList

// Here is a simple example of how to implement ExpansionPanelList.

/*import 'package:flutter/material.dart';

import '../JSONSerialization/Horaire/services.dart' as serviceHR;
import '../JSONSerialization/Horaire/post.dart' as postHR;

class MyItem {
  MyItem({this.isExpanded, this.header, this.body});

  bool isExpanded;
  final String header;
  final String body;
}

class Tcl extends StatefulWidget {
  Tcl({Key key, this.val}) : super(key: key);

  final val;

  @override
  _TclState createState() => _TclState();
}

class _TclState extends State<Tcl> {
  postHR.Post posts;
  bool loading;

  @override
  void initState() {
    super.initState();
    loading = true;
    serviceHR.Services.getPosts().then((list) {
      setState(() {
        posts = list;
        loading = false;
      });
    });
  }

  List<MyItem> _item = <MyItem>[MyItem(header: "Test 1", body: "Test2")];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _item[index].isExpanded = !_item[index].isExpanded;
            });
          },
          children: _item.map((MyItem item) {
            return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Text(item.header);
                },
                isExpanded: item.isExpanded,
                body: Container(
                  child: Text(item.body),
                ));
          }).toList(),
        )
      ],
    );
  }
}
*/
