import 'package:http/http.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  final int id;
  final String note;
  final Client client;
  const UpdatePage({Key? key, required this.client, required this.id, required this.note}) : super(key: key);
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    _noteController.text = widget.note;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('update Note'),
      ),
      body: Column(children: [
        TextField(controller: _noteController,
          maxLines: 10,),
        ElevatedButton(onPressed: () async {
          widget.client.put(
              updateurl(widget.id), body: {'note': _noteController.text});
          Navigator.pop(context);
        }, child: const Text('Update'))
      ],),
    );
  }

  Uri updateurl(int id) {
    return Uri.parse('http://localhost:8000/notes/update/$id/');
  }
}
