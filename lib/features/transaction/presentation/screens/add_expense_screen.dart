import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddExpenseScreen extends ConsumerStatefulWidget{
  const AddExpenseScreen({super.key});

  ConsumerState<AddExpenseScreen> createState() => AddExpenseScreenState();
}

class AddExpenseScreenState extends ConsumerState<AddExpenseScreen>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Expense"),
      ),
    );
  }
}