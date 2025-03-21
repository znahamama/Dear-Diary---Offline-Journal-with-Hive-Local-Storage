import 'package:flutter/material.dart';
import 'boxes.dart';
import 'view/diary_list_screen.dart';
import '../model/diary_entry.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(DiaryEntryAdapter());
  boxDiaryEntry = await Hive.openBox<DiaryEntry>('DiaryEntryBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiaryListScreen(),
    );
  }
}
