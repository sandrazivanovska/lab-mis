import '../models/exam.dart';

class ExamData {
  static List<Exam> getExams() {
    final now = DateTime.now();
    final baseDate = DateTime(now.year, now.month, now.day);

    DateTime schedule(int dayOffset, int hour, [int minute = 0]) {
      return baseDate.add(Duration(days: dayOffset, hours: hour, minutes: minute));
    }
    
    return [
      Exam(
        subjectName: 'Веб програмирање',
        dateTime: schedule(-15, 13),
        rooms: ['Лаб 3', 'Лаб 2'],
      ),
      Exam(
        subjectName: 'Бази на податоци',
        dateTime: schedule(-10, 8),
        rooms: ['200аб', '200в'],
      ),
      Exam(
        subjectName: 'Структурно програмирање',
        dateTime: schedule(-5, 11),
        rooms: ['Лаб 13'],
      ),
      Exam(
        subjectName: 'Компјутерски мрежи',
        dateTime: schedule(2, 9),
        rooms: ['200аб'],
      ),
      Exam(
        subjectName: 'Веројатност и статистика',
        dateTime: schedule(5, 10),
        rooms: ['117', 'Лаб 12'],
      ),
      Exam(
        subjectName: 'Веб базирани системи',
        dateTime: schedule(8, 12),
        rooms: ['Лаб 13', 'Лаб 12'],
      ),
      Exam(
        subjectName: 'Дизај и архитектура на софтвер',
        dateTime: schedule(12, 14),
        rooms: ['215'],
      ),
      Exam(
        subjectName: 'Алгоритми и податочни структури',
        dateTime: schedule(15, 9, 30),
        rooms: ['200аб'],
      ),
      Exam(
        subjectName: 'Напредно програмирање',
        dateTime: schedule(18, 16),
        rooms: ['лаб 12', 'лаб 13'],
      ),
      Exam(
        subjectName: 'Вовед во науката на податоците',
        dateTime: schedule(22, 8, 30),
        rooms: ['117'],
      ),
      Exam(
        subjectName: 'Мобилни и информациски системи',
        dateTime: schedule(25, 11),
        rooms: ['117', '215'],
      ),
    ];
  }
}

