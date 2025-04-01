import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  const Avatar({
    super.key,
    required this.imageUrl,
    required this.onUpload,
  });

  final String? imageUrl;
  final void Function(String) onUpload;

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.imageUrl == null || widget.imageUrl!.isEmpty)
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person,
              size: 60,
              color: Colors.white,
            ),
          )
        else
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(widget.imageUrl!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: _isLoading ? null : _mockUpload,
          icon: const Icon(Icons.upload),
          label: Text(_isLoading ? 'Uploading...' : 'Upload Avatar'),
        ),
      ],
    );
  }

  // Placeholder for image upload functionality
  void _mockUpload() {
    setState(() => _isLoading = true);
    
    // Simulate upload delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        // This is just a placeholder - your colleague will implement actual image upload
        widget.onUpload('https://i.pravatar.cc/150?img=3');
        setState(() => _isLoading = false);
      }
    });
  }
}

