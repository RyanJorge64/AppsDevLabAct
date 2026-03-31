import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ── HEADER ──────────────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.color
                              ?.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/defaultProfile.jpg'),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ── TODAY CARD ───────────────────────────────────────────────
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'You have 4 new notifications and 1 new message(s) waiting.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          _StatusChip(
                            icon: Icons.feed,
                            label: 'Posts',
                            value: '10',
                          ),
                          SizedBox(width: 12),
                          _StatusChip(
                            icon: Icons.person,
                            label: 'Friends',
                            value: '5',
                          ),
                          SizedBox(width: 12),
                          _StatusChip(
                            icon: Icons.message,
                            label: 'New Message/s',
                            value: '1',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ── QUICK ACTIONS
              const Text(
                'Quick actions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.person_add),
                      label: const Text('Add friend'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.post_add),
                      label: const Text('Post'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ── FOR YOU (POST FEED)
              const Text(
                'For You',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              PostCard(
                name: 'Jane Doe',
                content: 'Just finished my project!',
                time: '2h ago',
                onLike: () => debugPrint("Jane's post liked!"),
                onComment: () => debugPrint("Comment on Jane's post!"),
                onShare: () => debugPrint("Share Jane's post!"),
              ),

              const SizedBox(height: 12),

              PostCard(
                name: 'Billy',
                content: 'Anyone up for gaming later?',
                time: '5h ago',
                onLike: () => debugPrint("Billy's post liked!"),
                onComment: () => debugPrint("Comment on Billy's post!"),
                onShare: () => debugPrint("Share Billy's post!"),
              ),

              const SizedBox(height: 12),

              PostCard(
                name: 'Alex',
                content:
                    'Learning Flutter is (not) actually fun... Trust me, it goes deeper than you think',
                time: '1d ago',
                onLike: () => debugPrint("Alex's post liked!"),
                onComment: () => debugPrint("Comment on Alex's post!"),
                onShare: () => debugPrint("Share Alex's post!"),
              ),

              const SizedBox(height: 12),

              PostCard(
                name: 'Jack',
                content: 'Cool Scenery',
                time: '6h ago',
                imagePath: 'assets/post1.jpg',
                onLike: () => debugPrint("Jack's post liked!"),
                onComment: () => debugPrint("Comment on Jack's post!"),
                onShare: () => debugPrint("Share Jack's post!"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

// ── POST CARD
class PostCard extends StatelessWidget {
  final String name;
  final String content;
  final String? imagePath;
  final String time;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;

  const PostCard({
    super.key,
    required this.name,
    required this.content,
    this.imagePath,
    required this.time,
    this.onLike,
    this.onComment,
    this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // User row
            Row(
              children: [
                const CircleAvatar(child: Icon(Icons.person)),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      time,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Post content
            Text(content),

            const SizedBox(height: 12),

            // Optional image
            if (imagePath != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath!,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
            ],

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ActionIcon(icon: Icons.favorite_border, onTap: onLike),
                _ActionIcon(icon: Icons.comment_outlined, onTap: onComment),
                _ActionIcon(icon: Icons.share, onTap: onShare),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

// ── TAPPABLE ICON
class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _ActionIcon({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(icon, size: 24),
      ),
    );
  }
}

// ── STATUS CHIP
class _StatusChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatusChip({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: theme.colorScheme.primary, size: 20),
            const SizedBox(height: 12),
            Text(value, style: theme.textTheme.titleLarge),
            const SizedBox(height: 6),
            Text(
              label,
              style: theme.textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // fixes the expanding box bug
            ),
          ],
        ),
      ),
    );
  }
}