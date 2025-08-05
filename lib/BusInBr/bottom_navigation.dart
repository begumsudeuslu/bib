import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_calendar.dart';
import 'about_us_page.dart';
import 'projects_page.dart';
import 'messages_page.dart';
import 'announcements_page.dart';

class BIBBottomNavigationBar extends StatefulWidget {
  const BIBBottomNavigationBar({super.key});

  @override
  State<BIBBottomNavigationBar> createState() => _BIBBottomNavigationBarState();
}

class _BIBBottomNavigationBarState extends State<BIBBottomNavigationBar> {
  int _selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Widget? page;
    switch (index) {
      case 0: // Dashboard
        return;
      case 1: // Takvim
        page = const CalendarPage();
        break;
      case 2: // Projeler
        page = const ProjectsPage();
        break;
      case 3: // Mesajlar
        page = const MessagesPage();
        break;
      case 4: // Duyurular
        page = const AnnouncementsPage();
        break;
      case 5: // İK
        //page = const HrPage();
        break;
      case 6: // Hakkımızda
        page = const AboutUsPage();
        break;
    }
    
    // Sadece Dashboard dışındaki tüm butonlar için yeni bir sayfa aç
    if (page != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Sol ok
                  IconButton(
                    icon: Icon(Icons.chevron_left_rounded, color: Colors.blueGrey[600]),
                    onPressed: () {
                      _scrollController.animateTo(
                        _scrollController.offset - 100,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  // Kaydırılabilir navigasyon
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildNavItem(0, Icons.grid_view_rounded, 'Dashboard'),
                          _buildNavItem(1, Icons.event_note_rounded, 'Takvim'),
                          _buildNavItem(2, Icons.work_outline_rounded, 'Projeler'),
                          _buildNavItem(3, Icons.chat_bubble_outline_rounded, 'Mesajlar'),
                          _buildNavItem(4, Icons.campaign_outlined, 'Duyurular'),
                          _buildNavItem(5, Icons.groups_rounded, 'İK'),
                          _buildNavItem(6, Icons.info_outline_rounded, 'Hakkımızda'),
                          // Ekstra boşluk için
                          const SizedBox(width: 50),
                        ],
                      ),
                    ),
                  ),
                  // Sağ ok
                  IconButton(
                    icon: Icon(Icons.chevron_right_rounded, color: Colors.blueGrey[600]),
                    onPressed: () {
                      _scrollController.animateTo(
                        _scrollController.offset + 100,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueGrey.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.blueGrey[700] : Colors.blueGrey[400],
              size: isSelected ? 26 : 22,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.quicksand(
                color: isSelected ? Colors.blueGrey[800] : Colors.blueGrey[600],
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}