import 'package:flutter/material.dart';
import 'suleymank/temp_sk.dart';
import 'temp_bib.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIB Yazılım',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isHoveringSK = false;
  bool _isHoveringBIB = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Premium arka plan: gradient + blur daireler
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
          // Dekoratif blur efektli daireler
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
          // İçerik
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SK görseli
                MouseRegion(
                  onEnter: (_) => setState(() => _isHoveringSK = true),
                  onExit: (_) => setState(() => _isHoveringSK = false),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SKPage()),
                      );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                      margin: const EdgeInsets.symmetric(vertical: 18),
                      width: _isHoveringSK ? 230 : 200,
                      height: _isHoveringSK ? 230 : 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        boxShadow: _isHoveringSK
                            ? [
                                BoxShadow(
                                  color: Colors.blueAccent.withOpacity(0.25),
                                  blurRadius: 40,
                                  spreadRadius: 2,
                                ),
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.18),
                                  blurRadius: 0,
                                  spreadRadius: 0,
                                ),
                              ]
                            : [
                                BoxShadow(
                                  color: Colors.blueGrey.withOpacity(0.07),
                                  blurRadius: 12,
                                  spreadRadius: 1,
                                ),
                              ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(36),
                        child: Image.asset(
                          'assets/sk.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                // BIB görseli
                MouseRegion(
                  onEnter: (_) => setState(() => _isHoveringBIB = true),
                  onExit: (_) => setState(() => _isHoveringBIB = false),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BIBPage()),
                      );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                      margin: const EdgeInsets.symmetric(vertical: 18),
                      width: _isHoveringBIB ? 230 : 200,
                      height: _isHoveringBIB ? 230 : 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        boxShadow: _isHoveringBIB
                            ? [
                                BoxShadow(
                                  color: Colors.deepPurpleAccent.withOpacity(0.22),
                                  blurRadius: 40,
                                  spreadRadius: 2,
                                ),
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.15),
                                  blurRadius: 0,
                                  spreadRadius: 0,
                                ),
                              ]
                            : [
                                BoxShadow(
                                  color: Colors.blueGrey.withOpacity(0.07),
                                  blurRadius: 12,
                                  spreadRadius: 1,
                                ),
                              ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(36),
                        child: Image.asset(
                          'assets/bib.png',
                          fit: BoxFit.cover,
                        ),
                      ),
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