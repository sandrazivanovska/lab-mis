import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String getTimeRemaining() {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);
    
    if (difference.isNegative) {
      return 'Испитот е поминат';
    }
    
    final days = difference.inDays;
    final hours = difference.inHours.remainder(24);
    
    return '$days дена, $hours часа';
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали за испит'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Card(
        margin: const EdgeInsets.all(16.0),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.book,
                    size: 32,
                    color: isPast ? Colors.grey[600] : Colors.blue[700],
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Text(
                      exam.subjectName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isPast ? Colors.grey[600] : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              _buildDetailRow(
                icon: Icons.calendar_today,
                label: 'Датум',
                value: '${exam.dateTime.day}/${exam.dateTime.month}/${exam.dateTime.year}',
                color: isPast ? Colors.grey[600] : Colors.orange[700],
              ),
              const SizedBox(height: 16.0),
              _buildDetailRow(
                icon: Icons.access_time,
                label: 'Време',
                value: '${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}',
                color: isPast ? Colors.grey[600] : Colors.green[700],
              ),
              const SizedBox(height: 16.0),
              _buildDetailRow(
                icon: Icons.room,
                label: 'Простории',
                value: exam.rooms.join(', '),
                color: isPast ? Colors.grey[600] : Colors.purple[700],
              ),
              const SizedBox(height: 24.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: isPast ? Colors.grey[100] : Colors.blue[50],
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: isPast ? Colors.grey[300]! : Colors.blue[200]!,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: isPast ? Colors.grey[600] : Colors.blue[700],
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isPast ? 'Статус' : 'Преостанува',
                            style: TextStyle(
                              fontSize: 12,
                              color: isPast ? Colors.grey[600] : Colors.blue[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            getTimeRemaining(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isPast ? Colors.grey[600] : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    required Color? color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 24,
          color: color,
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

