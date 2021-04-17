import 'package:flutter/material.dart';

class ListViewRow extends StatelessWidget {

  final String title, imageUrl;

  ListViewRow({this.title, this.imageUrl});
  
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
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/items',
            //arguments: PokemonArgs(pokemon),
          );
        },
      )
    );
  }

}