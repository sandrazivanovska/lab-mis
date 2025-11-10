import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../data/exam_data.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exams = ExamData.getExams();
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    
    final now = DateTime.now();
    final pastExams = exams.where((exam) => exam.dateTime.isBefore(now)).toList();
    final upcomingExams = exams.where((exam) => exam.dateTime.isAfter(now)).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 221152'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                final isPast = exam.dateTime.isBefore(now);
                
                return Card(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  elevation: 2,
                  color: isPast ? Colors.grey[300] : Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExamDetailScreen(exam: exam),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(4.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.book,
                                color: isPast ? Colors.grey[600] : Colors.blue[700],
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  exam.subjectName,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: isPast ? Colors.grey[600] : Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12.0),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 18,
                                color: isPast ? Colors.grey[600] : Colors.orange[700],
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                '${exam.dateTime.day}/${exam.dateTime.month}/${exam.dateTime.year}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: isPast ? Colors.grey[600] : Colors.black87,
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Icon(
                                Icons.access_time,
                                size: 18,
                                color: isPast ? Colors.grey[600] : Colors.green[700],
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                '${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: isPast ? Colors.grey[600] : Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Icon(
                                Icons.room,
                                size: 18,
                                color: isPast ? Colors.grey[600] : Colors.purple[700],
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  exam.rooms.join(', '),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isPast ? Colors.grey[600] : Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              border: Border(
                top: BorderSide(color: Colors.blue[200]!),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    'Вкупно испити: ${exams.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

