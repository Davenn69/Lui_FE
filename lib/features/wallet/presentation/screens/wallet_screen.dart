import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lui_fe/features/wallet/presentation/widgets/wallet_widgets.dart';

class WalletScreen extends ConsumerStatefulWidget{
  const WalletScreen({super.key});

  @override
  ConsumerState<WalletScreen> createState() => WalletScreenState();
}

class WalletScreenState extends ConsumerState<WalletScreen>{

  int selectedIndex = 0;
  final FlutterCarouselController _carouselController = FlutterCarouselController();

  List<Map<String, dynamic>> transactions = [
    {"name": "Salary", "date": "March 25, 2025", "amount": 1500.0, "type": "income"},
    {"name": "Freelance", "date": "March 26, 2025", "amount": 500.0, "type": "income"},
    {"name": "Coffee", "date": "March 27, 2025", "amount": -5.0, "type": "expense"},
    {"name": "Salary", "date": "March 25, 2025", "amount": 1500.0, "type": "income"},
    {"name": "Freelance", "date": "March 26, 2025", "amount": 500.0, "type": "income"},
    {"name": "Coffee", "date": "March 27, 2025", "amount": -5.0, "type": "expense"},
    {"name": "Salary", "date": "March 25, 2025", "amount": 1500.0, "type": "income"},
    {"name": "Freelance", "date": "March 26, 2025", "amount": 500.0, "type": "income"},
    {"name": "Coffee", "date": "March 27, 2025", "amount": -5.0, "type": "expense"},
  ];

  List<Map<String, dynamic>> upcomingBills = [
    {"name": "Electricity Bill", "date": "April 5, 2025", "amount": 80.0},
    {"name": "Internet", "date": "April 10, 2025", "amount": 50.0},
    {"name": "Netflix", "date": "April 15, 2025", "amount": 15.0},
  ];

  Widget buildSegment(String text, int index){
    bool isSelected = selectedIndex == index;
    return Expanded(
        child: InkWell(
          onTap: (){
            setState(() {
              selectedIndex = index;
            });
            _carouselController.jumpToPage(index);
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: selectedIndex == index ? Colors.black : Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: colors.primary,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Stack(
                children: <Widget>[
                  Center(child: Text("Wallet", style: TextStyle(color: Colors.white, fontSize: 20),))
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 40),
                        Column(
                          children: <Widget>[
                            Text(
                                "Total Balance",
                              style: TextStyle(
                                color: Colors.grey.shade700
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                                "\$ 2,548.00",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 30),
                        // Container(
                        //   height: 50,
                        //   decoration: BoxDecoration(
                        //     color: Colors.grey[200],
                        //     borderRadius: BorderRadius.circular(20)
                        //   ),
                        //   padding: EdgeInsets.all(4),
                        //   child: Row(
                        //     children: <Widget>[
                        //       buildSegment("Transactions", 0),
                        //       buildSegment("UpcomingBills", 1)
                        //     ],
                        //   ),
                        // ),
                        Stack(
                          children: [
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(4),
                              child: Row(
                                children: <Widget>[
                                  buildSegment("Transactions", 0),
                                  buildSegment("Upcoming Bills", 1),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:5.0, left: 5, right: 5),
                              child: AnimatedAlign(
                                duration: Duration(milliseconds: 200),
                                alignment: selectedIndex == 0 ? Alignment.centerLeft : Alignment.centerRight,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.5 - 8,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(4),
                              child: Row(
                                children: <Widget>[
                                  buildSegment("Transactions", 0),
                                  buildSegment("Upcoming Bills", 1),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        FlutterCarousel(
                            items: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      ...transactions.map((t) => transactionCard(t['name'], t['date'], t['amount'], t['type']))
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      ...upcomingBills.map((u)=> upComingBillCard(u['name'], u['date'], u['amount']))
                                    ],
                                  ),
                                ),
                              )
                            ],
                            options: FlutterCarouselOptions(
                              enableInfiniteScroll: false,
                                height: 300,
                                showIndicator: false,
                                viewportFraction: 1,
                              controller: _carouselController,
                              onPageChanged: (index, reason){
                                setState(() {
                                  selectedIndex = index;
                                });
                              }
                            ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}