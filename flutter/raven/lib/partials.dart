import 'package:flutter/material.dart';
import 'package:raven/models.dart';

class ListViewRow extends StatelessWidget {

  final String title, imageUrl;
  final Function callback, callbackOnAdd;

  ListViewRow({this.title, this.imageUrl, this.callback, this.callbackOnAdd});
  
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

            Expanded(
              child: Text(this.title),
            ),

            if(callbackOnAdd != null)
              MaterialButton(
                onPressed: () => this.callbackOnAdd(),
                color: Colors.green,
                textColor: Colors.white,
                child: Icon(
                  Icons.add,
                  size: 20,
                ),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              )

          ],
        ),
        
        onPressed: () => this.callback != null ? this.callback() : doNothing()
      )
    );
  }

  void doNothing() {}
}

class ListViewMultipleRow extends StatelessWidget {

  final Item item;
  final int quantity;

  ListViewMultipleRow({this.item, this.quantity});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [

          if(item.imageUrl != null)
            Padding(
              padding: EdgeInsets.all(16),
              child: Image.network(
                item.imageUrl,
                width: 64,
              ),
            ),

          Expanded(
            child: Text(item.name),
          ),

          Text('X $quantity')

        ],
      ),
    );
  }

  void doNothing() {}
}

