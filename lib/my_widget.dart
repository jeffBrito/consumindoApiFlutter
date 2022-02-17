import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smartolt/olt.dart';

class SmartFulState extends State<SmartFulWidget>{
  
  var _olts = <Olt>[];//_ é referencia de privado (private)
  final _font = const TextStyle(fontSize: 20.0);

  @override
  void initState() {
    super .initState();
    _loadData();
  }

//async / await - vai criar uma thread com outro processo para nao travar o sistema
  _loadData()  async {
    var url = "https://api.github.com/orgs/adobe/members";
    http.Response response = await http.get(Uri.parse(url));
    // UI thread
    if(response.statusCode == 200){
      setState((){
       final oltsJSON = jsonDecode(response.body);
        for(var olt in oltsJSON){
          _olts.add(Olt(olt['login'],olt['avatar_url']));
        }
      });
    }
  }

  Widget _buildRow(int position){
    return ListTile(  
      title: Text("${_olts[position].login}",style: _font),
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        backgroundImage: NetworkImage(_olts[position].avatarUrl), 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _olts.length,
      itemBuilder: (BuildContext context, int position){
        return _buildRow(position);
      },
    );
  }

}

class SmartFulWidget extends StatefulWidget{
  @override
   createState() => SmartFulState();
}