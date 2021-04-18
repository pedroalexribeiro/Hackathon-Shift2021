import 'package:flutter/material.dart';

class ListViewRow extends StatelessWidget {

  final String title, imageUrl;
  final Function callback;

  ListViewRow({this.title, this.imageUrl, this.callback});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child:  TextButton(
        child: Row(
          children: [

            if(imageUrl != null)
              Padding(
                padding: EdgeInsets.all(16),
                child: Image.network(
                  this.imageUrl,
                  width: 64,
                ),
              ),

            Text(this.title),

          ],
        ),
        
        onPressed: () => this.callback != null ? this.callback() : doNothing()
      )
    );
  }

  void doNothing() {}
}