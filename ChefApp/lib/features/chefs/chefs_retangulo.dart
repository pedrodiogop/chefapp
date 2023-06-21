import 'package:flutter/material.dart';

class RetanguloInfoChef extends StatelessWidget {
  final String banner;
  final String profileImage;
  final String name;
  final String description;
  final int postCount;
  final int likeCount;
  final int followerCount;

  const RetanguloInfoChef({super.key, 
  required this.banner,
    required this.profileImage,
    required this.name,
    required this.description,
    required this.postCount,
    required this.likeCount,
    required this.followerCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(banner),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profileImage),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                //child: Image.asset(
                //  profileImage,
                // width: 50,
                // height: 50,
                // fit: BoxFit.cover,
                //   ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoItem('Posts', postCount),
              _buildInfoItem('Likes', likeCount),
              _buildInfoItem('Seguidores', followerCount),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, int count) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          count.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
