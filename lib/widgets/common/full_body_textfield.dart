import 'package:flutter/material.dart';

import '../../utils/icons.dart';

class TextfieldFullBody extends StatelessWidget {
  const TextfieldFullBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Description',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(cancel, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: const [
          TextButton(
            onPressed: null,
            child: Text('Save'),
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const TextField(
          // expands: true,
          minLines: null,
          maxLines: null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Add skills and requirement you\'re looking for.',
            contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
