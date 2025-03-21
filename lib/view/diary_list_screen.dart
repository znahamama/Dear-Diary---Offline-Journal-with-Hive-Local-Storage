import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import '../controller/diary_controller.dart';
import '../model/diary_entry.dart';
import '../boxes.dart';
import 'diary_entry_screen.dart';

class DiaryListScreen extends StatefulWidget {
  const DiaryListScreen({super.key});

  @override
  _DiaryListScreenState createState() => _DiaryListScreenState();
}

class _DiaryListScreenState extends State<DiaryListScreen> {
  final DiaryController _controller = DiaryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dear Diary")),
      body: ValueListenableBuilder(
        valueListenable: boxDiaryEntry.listenable(),
        builder: (context, Box<DiaryEntry> box, _) {
          if (box.isEmpty) {
            return Center(child: Text("No diary entries yet."));
          }

          List<DiaryEntry> entries = box.values.toList().cast<DiaryEntry>()
            ..sort((a, b) => b.date.compareTo(a.date));

          Map<String, List<DiaryEntry>> groupedEntries = {};
          for (var entry in entries) {
            String monthYear = DateFormat.yMMMM().format(entry.date);
            groupedEntries.putIfAbsent(monthYear, () => []).add(entry);
          }

          return ListView(
            padding: EdgeInsets.all(12),
            children: groupedEntries.entries.map((group) {
              return Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                  
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      group.key, 
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ...group.value.map((entry) => _buildDiaryCard(entry)),
                ],
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DiaryEntryScreen()),
          );
          setState(() {}); 
        },
      ),
    );
  }

  Widget _buildDiaryCard(DiaryEntry entry) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('EEE, MMM d').format(entry.date),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                _buildStars(entry.rating), 
              ],
            ),
            SizedBox(height: 4),
            Text(
              entry.description,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () async {
                  await _controller.deleteEntry(entry.date);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStars(int rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border, 
          color: Colors.purple,
          size: 20,
        );
      }),
    );
  }
}
