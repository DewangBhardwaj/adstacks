import 'package:flutter/material.dart';

class CreatorCard extends StatelessWidget {
  final String name;
  final String artworks;
  final String rating;

  CreatorCard({required this.name, required this.artworks, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(name[0].toUpperCase(),
                 style: TextStyle(color: Colors.white,),
                 ),
              ),
              SizedBox(width: 10),
              Text(name,
              style: TextStyle(
                fontSize: 13,
              ),),
            ],
          ),
          Text(artworks),
          Text(rating),
        ],
      ),
    );
  }
}