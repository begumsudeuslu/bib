import 'package:flutter/material.dart';
import 'temp_sk.dart';
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
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHoveringSK = false;
  bool _isHoveringBIB = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF1A237E), // Koyu mavi
              const Color(0xFF0D47A1), // Orta mavi
              const Color(0xFF01579B), // Açık mavi
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: const Text(
                    'BIB Yazılım',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHoveringSK = true),
                    onExit: (_) => setState(() => _isHoveringSK = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      transform: Matrix4.identity()
                        ..scale(_isHoveringSK ? 1.1 : 1.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: _isHoveringSK ? 15 : 10,
                              spreadRadius: _isHoveringSK ? 5 : 2,
                            ),
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withOpacity(0.9),
                              Colors.white.withOpacity(0.8),
                            ],
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const SKPage(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  var curve = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
                                  return FadeTransition(
                                    opacity: curve,
                                    child: Transform.scale(
                                      scale: curve.value,
                                      child: child,
                                    ),
                                  );
                                },
                                transitionDuration: const Duration(milliseconds: 500),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(25),
                            child: Image.asset(
                              'assets/sk.png',
                              width: 180,
                              height: 180,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHoveringBIB = true),
                    onExit: (_) => setState(() => _isHoveringBIB = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      transform: Matrix4.identity()
                        ..scale(_isHoveringBIB ? 1.1 : 1.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: _isHoveringBIB ? 15 : 10,
                              spreadRadius: _isHoveringBIB ? 5 : 2,
                            ),
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withOpacity(0.9),
                              Colors.white.withOpacity(0.8),
                            ],
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const BIBPage(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  var curve = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
                                  return FadeTransition(
                                    opacity: curve,
                                    child: Transform.scale(
                                      scale: curve.value,
                                      child: child,
                                    ),
                                  );
                                },
                                transitionDuration: const Duration(milliseconds: 500),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(25),
                            child: Image.asset(
                              'assets/bib.png',
                              width: 180,
                              height: 180,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ), // Column
            ), // Center
          ), // ScaleTransition
        ], // Stack'in children'ı
      ), // Stack
    ), // SafeArea
  ), // Container
); // Scaffold
  }
} // _HomePageState class sonu