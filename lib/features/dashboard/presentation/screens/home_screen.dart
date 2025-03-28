import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lui_fe/core/utils/navigation_service.dart';
import 'package:lui_fe/features/dashboard/presentation/widgets/dashboard_widgets.dart';
import 'package:lui_fe/features/dashboard/presentation/widgets/home_widgets.dart';

import '../../../statistic/presentation/screens/statistic_screen.dart';
import '../../../wallet/presentation/screens/wallet_screen.dart';
import '../providers/dashboard_provider.dart';
import 'dashboard_screen.dart';

class HomeScreen extends ConsumerStatefulWidget{
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen>{

  final List<Widget> _pages = [
    DashboardScreen(),
    StatisticScreen(),
    WalletScreen(),
    // DashboardScreen()
  ];

  @override
  Widget build(BuildContext context){
    final selectedPageIndex = ref.watch(selectedPageIndexProvider);

    void onItemTapped(int index){
      ref.read(selectedPageIndexProvider.notifier).state = index;
    }

    return Scaffold(
        bottomNavigationBar:  BottomNavigationBar(
          currentIndex: selectedPageIndex, items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Statistics"),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
          // BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "Profile")
        ],
        onTap: onItemTapped,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
        ),
        body: IndexedStack(
          index: selectedPageIndex,
          children: _pages,
        ),
        floatingActionButton: selectedPageIndex == 0 ? FloatingActionButton(
          onPressed: (){
            showModalForPickingType(context);
          },
          backgroundColor: Colors.green,
          child: Icon(Icons.add, size: 32, color: Colors.white),
        ) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}