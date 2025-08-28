import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchableLinkSection extends StatelessWidget {
  final String text;
  final String url;
  final IconData icon;

  const LaunchableLinkSection ({super.key, required this.text, required this.url, required this.icon,});

  @override
  Widget build(BuildContext context)  {
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
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Container(
          width: 40,
          height: 40,
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
            icon,
            color: Colors.blueGrey[700],
            size: 24,
          ),
        ),
        title: Text(
          text,
          style: GoogleFonts.quicksand(
            color: Colors.blueGrey[700],
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
          ),
        ),
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Bağlantı açılamadı: $url')),
            );
          }
        },
      ),
    );
  }
}