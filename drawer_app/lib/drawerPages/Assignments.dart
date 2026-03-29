import 'package:flutter/material.dart';

class AnimationsDemoPage extends StatefulWidget {
  const AnimationsDemoPage({super.key});

  @override
  State<AnimationsDemoPage> createState() => _AnimationsDemoPageState();
}

class _AnimationsDemoPageState extends State<AnimationsDemoPage>
    with SingleTickerProviderStateMixin {
  bool _visible = true;
  bool _expanded = false;

  late AnimationController _controller;
  late List<Animation<double>> _staggeredAnimations;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _staggeredAnimations = List.generate(4, (index) {
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * 0.2, 1.0, curve: Curves.easeOut),
        ),
      );
    });
  }

  void _startStaggered() {
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openHeroPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const HeroSecondPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Animations Demo")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            // 🔵 FADE ANIMATION
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Fade Animation",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),

            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _visible ? 1.0 : 0.0,
              child: Container(
                height: 80,
                width: double.infinity,
                color: theme.colorScheme.primary,
              ),
            ),

            TextButton(
              onPressed: () {
                setState(() => _visible = !_visible);
              },
              child: const Text("Toggle Fade"),
            ),

            const SizedBox(height: 30),

            // 🟢 IMPLICIT ANIMATION
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Implicit Animation",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),

            GestureDetector(
              onTap: () {
                setState(() => _expanded = !_expanded);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: _expanded ? 150 : 80,
                width: _expanded ? 150 : 80,
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary,
                  borderRadius:
                      BorderRadius.circular(_expanded ? 30 : 10),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 🟣 HERO ANIMATION
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Hero Animation",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),

            GestureDetector(
              onTap: _openHeroPage,
              child: Hero(
                tag: "hero-box",
                child: Container(
                  height: 80,
                  width: 80,
                  color: theme.colorScheme.tertiary,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 🟠 STAGGERED ANIMATION
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Staggered Animation",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),

            Column(
              children: List.generate(4, (index) {
                return AnimatedBuilder(
                  animation: _staggeredAnimations[index],
                  builder: (context, child) {
                    return Opacity(
                      opacity: _staggeredAnimations[index].value,
                      child: Transform.translate(
                        offset: Offset(
                            0, 50 * (1 - _staggeredAnimations[index].value)),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    height: 50,
                    width: double.infinity,
                    color: theme.colorScheme.primaryContainer,
                  ),
                );
              }),
            ),

            ElevatedButton(
              onPressed: _startStaggered,
              child: const Text("Start Staggered Animation"),
            ),
          ],
        ),
      ),
    );
  }
}

// SECOND PAGE FOR HERO
class HeroSecondPage extends StatelessWidget {
  const HeroSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column (
        children: [
          Hero(
          tag: "hero-box",
          child: Container(
            height: 250,
            width: 550,
            color: theme.colorScheme.tertiary,
          ),
        ),
        ]
      )
    );
  }
}