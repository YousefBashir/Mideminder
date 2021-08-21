
import 'package:flutter/material.dart';
import 'package:mediminder/Helpers/DbHelper.dart';
import 'package:mediminder/providers/medicineProvider.dart';
import 'package:mediminder/ui/new_entry_page.dart';
import 'package:mediminder/ui/success_page.dart';
import 'package:provider/provider.dart';

import 'ui/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(
    ChangeNotifierProvider<MedicineProvider>(
      create: (context)=>MedicineProvider(),
      child: MaterialApp(
        routes: {
           HomePage.routeName: (ctx) => HomePage(),
           SuccessPage.routeName: (ctx) => SuccessPage(),
           NewEntryPage.routeName: (ctx) => NewEntryPage(),
        },
         initialRoute:HomePage.routeName,
      ),
    ));
}

