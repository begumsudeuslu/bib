import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../pages/home/sections/BusInBr/employee_pages/employee_list_page.dart';

class EmployeeCardSection extends StatelessWidget{
  const EmployeeCardSection({super.key});

  @override
  Widget build(BuildContext context)  {
    return Container(
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmployeeListPage()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.groups_rounded,
                    color: Colors.blueGrey[700],
                    size: 28,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ekibimizle Tanışın',
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueGrey[800],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Yetenekli ve deneyimli ekibimizi keşfedin.',
                        style: GoogleFonts.quicksand(
                          fontSize: 14,
                          color: Colors.blueGrey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    size: 20, color: Colors.blueGrey[600]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}