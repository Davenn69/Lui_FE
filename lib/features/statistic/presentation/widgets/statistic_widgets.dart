import 'package:flutter/material.dart';

Widget topSpendingCard(String description, String date, double amount, String type){
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                description,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                date,
                style: TextStyle(
                    color: Colors.grey.shade600
                ),
              )
            ],
          ),
          Text(
            type == "expense" ? "- \$ $amount" : "+ \$ $amount",
            style: TextStyle(
                color: type == "expense" ? Colors.red : Colors.green,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    ),
  );
}