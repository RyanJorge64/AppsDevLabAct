import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> with TickerProviderStateMixin {
  final List<AnimationController> _controllers = [];
  final List<Animation<Offset>> _slideAnimations = [];
  final List<Animation<double>> _fadeAnimations = [];

  final List<Map<String, String>> notifications = [
    {'title': 'New comment', 'subtitle': 'Anna left a comment on your post', 'icon': 'notifications_active'},
    {'title': 'Meeting reminder', 'subtitle': 'Project review at 3:00 PM', 'icon': 'calendar_today'},
    {'title': 'Task completed', 'subtitle': 'You finished the onboarding task', 'icon': 'check_circle'},
    {'title': 'New Message', 'subtitle': 'You have an incoming message from an unknown user, check your requests box', 'icon': 'warning'},
    {'title': 'New notification', 'subtitle': 'You have a new notification', 'icon': 'notifications_active'}
  ];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < notifications.length; i++) {
      _buildAnimation(delayFactor: i);
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _buildAnimation({int delayFactor = 0}) {
    final controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _slideAnimations.add(
      Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
          .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut)),
    );
    _fadeAnimations.add(
      Tween<double>(begin: 0, end: 1)
          .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn)),
    );

    _controllers.add(controller);

    Future.delayed(Duration(milliseconds: delayFactor * 120), () {
      if (mounted) controller.forward();
    });
  }

  void _addNotification() {
    setState(() {
      notifications.add({
        'title': 'New notification',
        'subtitle': 'You have a new notification',
        'icon': 'notifications_active',
      });
      _buildAnimation(); // No delayFactor — plays instantly
    });
  }

  IconData _getIcon(String name) {
    switch (name) {
      case 'notifications_active':
        return Icons.notifications_active;
      case 'calendar_today':
        return Icons.calendar_today;
      case 'check_circle':
        return Icons.check_circle;
      case 'warning':
        return Icons.person_add_alt;
      default:
        return Icons.notifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addNotification,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ── HEADER
              const Text(
                'Notifications',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // ── NOTIFICATION LIST 
              Expanded(
                child: ListView.separated(
                  itemCount: notifications.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final notif = notifications[index];
                    return SlideTransition(
                      position: _slideAnimations[index],
                      child: FadeTransition(
                        opacity: _fadeAnimations[index],
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Icon(_getIcon(notif['icon']!)),
                            title: Text(notif['title']!),
                            subtitle: Text(notif['subtitle']!),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}