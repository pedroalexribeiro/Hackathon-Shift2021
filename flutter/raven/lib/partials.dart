import 'package:flutter/material.dart';

class ListViewRow extends StatelessWidget {

  String title, imageUrl;

  ListViewRow({this.title, imageUrl});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child:  Row(
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
    );
  }

}