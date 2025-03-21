import 'package:flutter/material.dart';
import '../controller/diary_controller.dart';
import '../model/diary_entry.dart';

class DiaryEntryScreen extends StatefulWidget {
  const DiaryEntryScreen({super.key});

  @override
  _DiaryEntryScreenState createState() => _DiaryEntryScreenState();
}

class _DiaryEntryScreenState extends State<DiaryEntryScreen> {
  final _descriptionController = TextEditingController();
  final DiaryController _controller = DiaryController();
  DateTime? _selectedDate = DateTime.now(); 
  double _selectedRating = 3.0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Diary Entry")), 
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Date"),
            ElevatedButton(
              child: Text("${_selectedDate!.toLocal()}".split(" ")[0]),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate!,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() => _selectedDate = pickedDate);
                }
              },
            ),
            SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              maxLength: 140,
              decoration: InputDecoration(labelText: "Describe your day"),
            ),
            SizedBox(height: 10),

            Text("Rate your day:"),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: _selectedRating.toDouble(),
                    min: 1,
                    max: 5,
                    divisions: 4, 
                    label: _selectedRating.round().toString(),
                    onChanged: (value) {
                      setState(() => _selectedRating = value);
                    },
                  ),
                ),
                Text("${_selectedRating.round()} ⭐", style: TextStyle(fontSize: 18)),
              ],
            ),

            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Save Entry"),
              onPressed: () async {
                if (_descriptionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter a description")));
                  return;
                }
                try {
                  await _controller.addEntry(DiaryEntry(
                    date: _selectedDate!,
                    description: _descriptionController.text,
                    rating: _selectedRating.round(), 
                  ));

                  Navigator.pop(context); 
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
