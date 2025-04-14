import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lui_fe/core/session/presentation/providers/providers.dart';
import 'package:lui_fe/features/dashboard/presentation/widgets/dashboard_widgets.dart';

import '../providers/dashboard_provider.dart';

class DashboardScreen extends ConsumerStatefulWidget{
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends ConsumerState<DashboardScreen>{

<<<<<<< HEAD
  //TODO
  // @override
  // void initState() {
  //   super.initState();
  //   Future.microtask(() {
  //     ref.read(dashboardProvider.notifier).getUser(userId);
  //   });
  // }
=======
  @override
  void initState() {
    super.initState();
  }
>>>>>>> 4c7a2ce52eb90d8d699ae11626bc66b53f0b1efe

  final List<Widget> _pages = [
    DashboardScreen(),
    DashboardScreen(),
    DashboardScreen(),
    DashboardScreen()
  ];

  @override
  Widget build(BuildContext context){
    final selectedPageIndex = ref.watch(selectedPageIndexProvider);
    final session = ref.watch(sessionData);
    print("session session $session");
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
                    gradient: LinearGradient(colors: [
                      colors.primary,
                      colors.secondary
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)
                  ),
                ),
                Image.asset(
                  "assets/images/dashboard_background_decoration.png"
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 60,0,0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          "Good afternoon,",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      Text(
                          "${session?['user']['name'] ?? "null"}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFF29756F),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal : 20.0, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: [
                                Text(
                                    "Total Balance",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "\$ 2,548.00",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 10,
                                          backgroundColor: Colors.white.withAlpha(50),
                                          child: Icon(
                                            size: 15,
                                              color: Colors.white,
                                              Icons.arrow_upward_sharp
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Income",
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "\$ 2,548.00",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 10,
                                          backgroundColor: Colors.white.withAlpha(50),
                                          child: Icon(
                                              size: 15,
                                              color: Colors.white,
                                              Icons.arrow_downward_sharp
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Expenses",
                                          style: TextStyle(
                                              color: Colors.white
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "\$ 2,548.00",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                      "Transactions History",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                      "See all",
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  transactionCard(context, "Upwork", "Today", 850, "income"),
                  transactionCard(context,"Transfer", "Yesterday", 85, "expenses"),
                  transactionCard(context,"Paypal", "Jan 30, 2022", 1406, "income"),
                  transactionCard(context,"Youtube", "Jan 16, 2022", 11, "expenses"),
                  transactionCard(context,"Upwork", "Today", 850, "income"),
                  transactionCard(context,"Transfer", "Yesterday", 85, "expenses"),
                  transactionCard(context,"Paypal", "Jan 30, 2022", 1406, "income"),
                  transactionCard(context,"Youtube", "Jan 16, 2022", 11, "expenses"),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}