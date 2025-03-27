import 'package:flutter/material.dart';
import 'package:lui_fe/core/utils/navigation_service.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void showModalForPickingType(BuildContext context){
  showCupertinoModalBottomSheet(
    context: context, expand : false,
      builder: (context) => Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      Color(0xFF429690),
                      Color(0xFF2A7C76)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)
                  ),
                  child: ElevatedButton(onPressed: (){Navigator.of(context).push(NavigationService.navigationFromDashboardToAddIncome());}, child: Text("Income")),
                ),
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Color(0xFFF95B51),
                        Color(0xFFD64940)
                      ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)
                  ),
                  child: ElevatedButton(onPressed: (){Navigator.of(context).push(NavigationService.navigationFromDashboardToAddExpense());}, child: Text("Expense")),
                )
              ],
            ),
          ),
        ),
      )
  );
}