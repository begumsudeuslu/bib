import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animations/animations.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> with SingleTickerProviderStateMixin {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> _events = {};
  final TextEditingController _eventController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  Importance _selectedImportance = Importance.low;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _eventController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  void _showEventDialog({Event? eventToEdit, DateTime? date}) {
    final isEditing = eventToEdit != null;
    
    _eventController.text = isEditing ? eventToEdit.title : '';
    _descriptionController.text = isEditing ? eventToEdit.description : '';
    _selectedImportance = isEditing ? eventToEdit.importance : Importance.low;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Transform.scale(
          scale: 1.0 - (_animationController.value * 0.1),
          child: Opacity(
            opacity: 1.0 - (_animationController.value * 0.3),
            child: child!,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEditing ? 'Notu Düzenle' : 'Yeni Not Ekle',
                style: GoogleFonts.quicksand(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueGrey[800],
                ),
              ),
              const SizedBox(height: 20),
              _buildAnimatedTextField(
                controller: _eventController,
                labelText: 'Başlık',
                icon: Icons.title_rounded,
              ),
              const SizedBox(height: 15),
              _buildAnimatedTextField(
                controller: _descriptionController,
                labelText: 'Açıklama (İsteğe Bağlı)',
                maxLines: 3,
                icon: Icons.description_rounded,
              ),
              const SizedBox(height: 20),
              _buildImportanceSelector(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'İptal',
                      style: GoogleFonts.quicksand(
                        color: Colors.blueGrey[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              if (_eventController.text.isEmpty) return;

              setState(() {
                final newEvent = Event(
                  title: _eventController.text,
                  description: _descriptionController.text,
                  importance: _selectedImportance,
                );

                        if (isEditing) {
                  _events[_selectedDay!] = _events[_selectedDay!]!
                      .map((e) => e == eventToEdit ? newEvent : e)
                      .toList();
                } else if (date != null) {
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      isEditing ? 'Güncelle' : 'Ekle',
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ).then((_) {
      _animationController.reverse();
    });
    
    _animationController.forward();
  }

  Widget _buildAnimatedTextField({
    required TextEditingController controller,
    required String labelText,
    int maxLines = 1,
    required IconData icon,
  }) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.9 + (value * 0.1),
          child: Opacity(
            opacity: value,
            child: TextField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                labelText: labelText,
                prefixIcon: Icon(icon, color: Colors.blueGrey[300]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.blueGrey[200]!,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.blueGrey[100]!,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.blueGrey[700]!,
                    width: 2,
                  ),
                ),
                labelStyle: GoogleFonts.quicksand(
                  color: Colors.blueGrey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImportanceSelector() {
    return Row(
      children: [
        Text(
          'Önem Düzeyi:',
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey[700],
          ),
        ),
        const SizedBox(width: 15),
        ...Importance.values.map((importance) {
          final isSelected = _selectedImportance == importance;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() {
                  _selectedImportance = importance;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: _getImportanceColor(importance),
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: Colors.white, width: 3)
                      : null,
                  boxShadow: [
                    BoxShadow(
                      color: _getImportanceColor(importance).withOpacity(0.5),
                      blurRadius: isSelected ? 15 : 10,
                      spreadRadius: isSelected ? 3 : 2,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Center(
                  child: isSelected
                      ? Icon(Icons.check, color: Colors.white, size: 28)
                      : null,
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Zaman Yönetimi',
          style: GoogleFonts.quicksand(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.blueGrey[800],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
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
                  eventLoader: _getEventsForDay,
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.blueGrey[700],
                        shape: BoxShape.circle,
                      ),
                    markerDecoration: BoxDecoration(
                      color: Colors.amber[700],
                        shape: BoxShape.circle,
                      ),
                    defaultTextStyle: GoogleFonts.quicksand(
                      color: Colors.blueGrey[800],
                      fontWeight: FontWeight.w600,
                    ),
                    weekendTextStyle: GoogleFonts.quicksand(
                      color: Colors.red[600],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    titleTextStyle: GoogleFonts.quicksand(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueGrey[800],
                    ),
                    formatButtonVisible: false,
                      titleCentered: true,
                    leftChevronIcon: Icon(
                      Icons.chevron_left_rounded,
                      color: Colors.blueGrey[700],
                      size: 30,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.blueGrey[700],
                      size: 30,
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: GoogleFonts.quicksand(
                      color: Colors.blueGrey[700],
                      fontWeight: FontWeight.w600,
                    ),
                    weekendStyle: GoogleFonts.quicksand(
                      color: Colors.red[600],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
                Expanded(
              child: _getEventsForDay(_selectedDay!).isEmpty
                  ? _buildEmptyState()
                  : PageTransitionSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation, secondaryAnimation) {
                        return SharedAxisTransition(
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.scaled,
                          child: child,
                        );
                      },
                  child: ListView.builder(
                        key: ValueKey(_selectedDay),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _getEventsForDay(_selectedDay!).length,
                    itemBuilder: (context, index) {
                      final event = _getEventsForDay(_selectedDay!)[index];
                          return _buildEventCard(event, index);
                    },
                  ),
                ),
            ),
          ],
          ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_selectedDay != null) {
            _showEventDialog(date: _selectedDay);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Not eklemek için bir gün seçin.')),
            );
          }
        },
        label: Text(
          'Not Ekle',
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        backgroundColor: Colors.blueGrey[700],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_today_rounded,
            size: 100,
            color: Colors.blueGrey[200],
          ),
          const SizedBox(height: 20),
          Text(
            'Henüz not eklenmemiş',
            style: GoogleFonts.quicksand(
              fontSize: 20,
              color: Colors.blueGrey[600],
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Takvimde bir gün seçip not ekleyebilirsiniz',
            style: GoogleFonts.quicksand(
              color: Colors.blueGrey[400],
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(Event event, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _getImportanceColor(event.importance),
            boxShadow: [
              BoxShadow(
                color: _getImportanceColor(event.importance).withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 2,
              )
            ],
          ),
        ),
        title: Text(
          event.title,
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w700,
            color: Colors.blueGrey[800],
            fontSize: 18,
          ),
        ),
        subtitle: event.description.isNotEmpty
            ? Text(
                event.description,
                style: GoogleFonts.quicksand(
                  color: Colors.blueGrey[600],
                  fontWeight: FontWeight.w500,
                ),
              )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit_rounded, color: Colors.blueGrey[600]),
              onPressed: () {
                _showEventDialog(eventToEdit: event, date: _selectedDay);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete_rounded, color: Colors.red[600]),
              onPressed: () {
                setState(() {
                  _events[_selectedDay!]?.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Not silindi.',
                      style: GoogleFonts.quicksand(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

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

enum Importance {
  low,
  medium,
  high,
}