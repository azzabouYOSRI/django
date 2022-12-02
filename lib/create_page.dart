import 'package:http/http.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  final Client client;
  const CreatePage({Key? key, required this.client}) : super(key: key);
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
      ),
      body: Column(children: [
        TextField(controller: _noteController,
        maxLines: 10,),
        ElevatedButton(onPressed: () async {
           widget.client.post(createUrl(), body: {'body': _noteController.text});
          Navigator.pop(context);
        }, child: const Text('Create'))
      ],),
    );
  }

  Uri createUrl() {
    return Uri.parse('http://10.0.2.2:8000/notes/');
  }
}