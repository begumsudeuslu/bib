import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> _events = {}; // Tarihe göre olayları saklayacak
  TextEditingController _eventController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  Importance _selectedImportance = Importance.low; // Önem düzeyi için varsayılan

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  // Belirli bir tarih için olayları döndüren fonksiyon
  List<Event> _getEventsForDay(DateTime day) {
    return _events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  // Olay ekleme/düzenleme iletişim kutusu
  void _showAddEditEventDialog({Event? eventToEdit, DateTime? date}) {
    // Eğer düzenlenecek bir olay varsa değerleri doldur
    if (eventToEdit != null) {
      _eventController.text = eventToEdit.title;
      _descriptionController.text = eventToEdit.description;
      _selectedImportance = eventToEdit.importance;
    } else {
      // Yeni olay için alanları temizle
      _eventController.clear();
      _descriptionController.clear();
      _selectedImportance = Importance.low; // Varsayılana sıfırla
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(eventToEdit == null ? 'Yeni Not Ekle' : 'Notu Düzenle'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _eventController,
                decoration: const InputDecoration(labelText: 'Başlık'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Açıklama (İsteğe Bağlı)'),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<Importance>(
                value: _selectedImportance,
                decoration: const InputDecoration(labelText: 'Önem Düzeyi'),
                items: Importance.values.map((Importance importance) {
                  return DropdownMenuItem(
                    value: importance,
                    child: Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _getImportanceColor(importance),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(_getImportanceText(importance)),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (Importance? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedImportance = newValue;
                    });
                  }
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_eventController.text.isEmpty) return;

              setState(() {
                final newEvent = Event(
                  title: _eventController.text,
                  description: _descriptionController.text,
                  importance: _selectedImportance,
                );

                if (eventToEdit != null) {
                  // Mevcut olayı güncelle
                  _events[_selectedDay!] = _events[_selectedDay!]!
                      .map((e) => e == eventToEdit ? newEvent : e)
                      .toList();
                } else if (date != null) {
                  // Yeni olay ekle
                  final dayWithoutTime = DateTime(date.year, date.month, date.day);
                  _events.update(
                    dayWithoutTime,
                    (value) => [...value, newEvent],
                    ifAbsent: () => [newEvent],
                  );
                }
              });
              Navigator.pop(context);
            },
            child: Text(eventToEdit == null ? 'Ekle' : 'Kaydet'),
          ),
        ],
      ),
    );
  }

  // Önem düzeyine göre renk döndüren yardımcı fonksiyon
  Color _getImportanceColor(Importance importance) {
    switch (importance) {
      case Importance.low:
        return Colors.green;
      case Importance.medium:
        return Colors.orange;
      case Importance.high:
        return Colors.red;
    }
  }

  // Önem düzeyine göre metin döndüren yardımcı fonksiyon
  String _getImportanceText(Importance importance) {
    switch (importance) {
      case Importance.low:
        return 'Düşük';
      case Importance.medium:
        return 'Orta';
      case Importance.high:
        return 'Yüksek';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Takvim ve Zaman Yönetimi', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Arka plan gradient ve blur daireler
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFe0e7ff),
                  Color(0xFFf8fafc),
                  Color(0xFFc7d2fe),
                ],
              ),
            ),
          ),
          Positioned(
            top: -60,
            left: -60,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent.withOpacity(0.18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.25),
                    blurRadius: 80,
                    spreadRadius: 30,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: -40,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurpleAccent.withOpacity(0.13),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurpleAccent.withOpacity(0.18),
                    blurRadius: 60,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          // Takvim içeriği
          SafeArea(
            child: Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  color: Colors.white.withOpacity(0.95),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay; // Güncel odağı da ayarla
                      });
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    eventLoader: _getEventsForDay, // Olayları yükleyen fonksiyon
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: const BoxDecoration(
                        color: Color(0xFF0D47A1),
                        shape: BoxShape.circle,
                      ),
                      markerDecoration: const BoxDecoration(
                        color: Colors.amber, // Not olan günleri işaretler
                        shape: BoxShape.circle,
                      ),
                      // Diğer özelleştirmeler
                    ),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false, // Format düğmesini gizle
                      titleCentered: true,
                      leftChevronIcon: Icon(Icons.chevron_left, color: Color(0xFF1A237E)),
                      rightChevronIcon: Icon(Icons.chevron_right, color: Color(0xFF1A237E)),
                      titleTextStyle: TextStyle(
                        color: Color(0xFF1A237E),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: Color(0xFF1A237E)),
                      weekendStyle: TextStyle(color: Colors.redAccent),
                    ),
                    // Gün numaraları için stil
                    // defaultTextStyle: const TextStyle(color: Colors.black87),
                    // weekendTextStyle: const TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: _getEventsForDay(_selectedDay!).length,
                    itemBuilder: (context, index) {
                      final event = _getEventsForDay(_selectedDay!)[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                        elevation: 3,
                        color: Colors.white.withOpacity(0.9),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: _getImportanceColor(event.importance),
                            radius: 10,
                          ),
                          title: Text(
                            event.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: event.description.isNotEmpty
                              ? Text(event.description)
                              : null,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  _showAddEditEventDialog(eventToEdit: event, date: _selectedDay);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    _events[_selectedDay!]?.remove(event);
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Not silindi.')),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_selectedDay != null) {
            _showAddEditEventDialog(date: _selectedDay);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Not eklemek için bir gün seçin.')),
            );
          }
        },
        label: const Text('Not Ekle'),
        icon: const Icon(Icons.add),
        backgroundColor: const Color(0xFF0D47A1), // FAB rengi temaya uyarlandı
      ),
    );
  }
}

// Olay sınıfı
class Event {
  final String title;
  final String description;
  final Importance importance;

  const Event({
    required this.title,
    this.description = '',
    this.importance = Importance.low,
  });

  @override
  String toString() => title;
}

// Önem düzeyi enum'ı
enum Importance {
  low,
  medium,
  high,
}