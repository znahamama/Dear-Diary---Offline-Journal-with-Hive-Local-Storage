import '../model/diary_entry.dart';
import '../boxes.dart';

class DiaryController {
  Future<void> addEntry(DiaryEntry entry) async {
    String entryKey = entry.date.toIso8601String().split('T')[0]; // Store only the date part

    if (boxDiaryEntry.containsKey(entryKey)) {
      throw Exception("An entry for this date already exists.");
    }

    await boxDiaryEntry.put(entryKey, entry);
  }

  Future<void> deleteEntry(DateTime date) async {
    String entryKey = date.toIso8601String().split('T')[0]; // Use only date part
    if (boxDiaryEntry.containsKey(entryKey)) {
      await boxDiaryEntry.delete(entryKey);
    } else {
      throw Exception("Entry not found.");
    }
  }
}