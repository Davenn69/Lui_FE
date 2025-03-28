import 'package:flutter/material.dart';
import 'package:lui_fe/core/utils/navigation_service.dart';

Widget transactionCard(BuildContext context, String name, String date, double amount, String type){
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(NavigationService.navigationFromDashboardToDetails());
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
              Text(
                date,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14
                ),
              )
            ],
          ),
          Text(
            "+ \$ $amount",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: type == "income" ? Color(0xFF25A969) : Colors.red
            ),
          )
        ],
      ),
    ),
  );
}