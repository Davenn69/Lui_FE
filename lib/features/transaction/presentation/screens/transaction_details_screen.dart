import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionDetailsScreen extends ConsumerWidget{

  const TransactionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return Scaffold(
      backgroundColor: colors.primary,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap : (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_new, color: Colors.white,),
                  ),
                  Center(child: Text("Transaction Details", style: TextStyle(color: Colors.white, fontSize: 20),))
                ],
              ),
            ),
            SizedBox(height: 40,),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 40),
                      Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "\$ 85.00",
                              style: TextStyle(
                                fontSize: 28,
                                color: Color(0xFF438883)
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFF438883).withAlpha(50),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(
                                child: Text(
                                  "Income",
                                  style: TextStyle(
                                    color: Color(0xFF438883)
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Transaction details",
                                style: TextStyle(
                                  fontSize: 20
                                ),
                              ),
                              Icon(Icons.arrow_upward_sharp)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Status",
                                style: TextStyle(
                                    fontSize: 16,
                                  color: Colors.grey.shade600
                                ),
                              ),
                              Text(
                                "Expense",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "To",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade600
                                ),
                              ),
                              Text(
                                "Claire Jovalski",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Time",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade600
                                ),
                              ),
                              Text(
                                "04.30 PM",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Date",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade600
                                ),
                              ),
                              Text(
                                "Feb 29, 2022",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                            height: 20,
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Spending",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade600
                                ),
                              ),
                              Text(
                                "\$ 85.00",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Fee",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade600
                                ),
                              ),
                              Text(
                                "- \$ 0.99",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                            height: 20,
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Total",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade600
                                ),
                              ),
                              Text(
                                "- \$ 84.00",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: 250,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: colors.primary,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: ElevatedButton(
                                onPressed: (){

                                },
                                child: Text(
                                    "Download Receipt",
                                  style: TextStyle(
                                    color: colors.primary
                                  ),
                                )
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
            ))
          ],
        ),
      ),
    );
  }
}