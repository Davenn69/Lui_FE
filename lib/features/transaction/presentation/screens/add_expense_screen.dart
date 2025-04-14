import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:date_picker_plus/date_picker_plus.dart';

class AddExpenseScreen extends ConsumerStatefulWidget{
  const AddExpenseScreen({super.key});

  @override
  ConsumerState<AddExpenseScreen> createState() => AddExpenseScreenState();
}

class AddExpenseScreenState extends ConsumerState<AddExpenseScreen>{
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  final fileNameController = TextEditingController();
  File? selectedFile;

  Future<void> selectDate(BuildContext context)async{
    DateTime? pickedDate = await showDatePickerDialog(
      context: context,
      initialDate: DateTime.now(),
      maxDate: DateTime.now(),
      minDate: DateTime(2022, 1, 1)
    );

    if(pickedDate !=null){
      dateController.text = DateFormat('EEE, dd MMMM yyyy').format(pickedDate);
    }
  }

  Future<void> selectFile()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png']
    );

    if(result != null){
      setState(() {
        selectedFile = File(result.files.single.path!);
        fileNameController.text = path.basename(selectedFile!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Add Expense", style : TextStyle(color: Colors.white, fontSize: 16)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
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
                        Color(0xFFF95B51),
                        Color(0xFFD64940)
                      ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)
                  ),
                ),
                Image.asset(
                    "assets/images/dashboard_background_decoration.png"
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top:120),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54.withAlpha(50),
                            spreadRadius: 2,
                            blurRadius: 10,
                          )
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    "AMOUNT",
                                  style: TextStyle(
                                    color: Colors.grey[600]
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  controller: amountController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Select an amount",
                                      hintStyle: TextStyle(
                                        color: Colors.grey
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(left: 20, top: 13, bottom: 5),
                                        child: Text(
                                            "\$",
                                          style: TextStyle(
                                          fontSize: 16
                                        ),
                                      ),
                                    ),
                                    suffixIcon: GestureDetector(onTap : (){amountController.text = "";}, child: Icon(Icons.delete_forever)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: Color(0xFF2A7C76))
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "DATE",
                                  style: TextStyle(
                                      color: Colors.grey[600]
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  controller: dateController,
                                  readOnly: true,
                                  onTap: ()=>selectDate(context),
                                  decoration: InputDecoration(
                                    hintText: DateFormat("EEE, dd MMMM yyyy").format(DateTime.now()),
                                    hintStyle: TextStyle(
                                      color: Colors.grey
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    suffixIcon: Icon(Icons.calendar_month_outlined),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(color: Color(0xFF2A7C76))
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "INVOICE",
                                  style: TextStyle(
                                      color: Colors.grey[600]
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  controller: fileNameController,
                                  readOnly: true,
                                  onTap: ()=>selectFile(),
                                  decoration: InputDecoration(
                                    hintText: "Jpg, png files here",
                                    hintStyle: TextStyle(
                                      color: Colors.grey
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    suffixIcon: Icon(Icons.calendar_month_outlined),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(color: Color(0xFF2A7C76))
                                    ),
                                  ),
                                )
                          ],
                        ),
                      ]),
                    ),
                  ),
                )
                ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 650),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Color(0xFFF95B51),
                        Color(0xFFD64940)
                      ],
                      begin: Alignment.topCenter,
                      end : Alignment.bottomCenter)
                    ),
                      child: ElevatedButton(
                          onPressed: (){},
                          child: Text("Submit")
                      )
                  ),
                ),
              )
              ],
            ),
          ],
        ),
      ),
    );
  }
}