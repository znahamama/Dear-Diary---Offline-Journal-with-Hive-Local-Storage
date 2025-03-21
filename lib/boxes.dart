import 'package:hive/hive.dart';
import '../model/diary_entry.dart';

late Box<DiaryEntry> boxDiaryEntry;

Future<void> openHiveBox() async {
  boxDiaryEntry = await Hive.openBox<DiaryEntry>('DiaryEntryBox');
}
