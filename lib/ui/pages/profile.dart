import 'package:flutter/material.dart';
import 'package:flutter_application_2/ui/pages/profile_edit.dart';
import 'login.dart'; // 로그인 페이지
import 'post_storage.dart'; // 게시글 보관함 페이지
import 'customer.dart'; // 고객센터 페이지
import 'post.dart'; // 게시글 페이지

class Profile extends StatefulWidget {
  final String? token;

  const Profile({Key? key, this.token}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool showDetail = false; // 상세 보기 여부
  Map<String, dynamic>? selectedPet; // 선택된 반려동물 정보

  // 반려동물 정보
  final List<Map<String, dynamic>> pets = [
    {
      'id': 1,
      'author': '나의 반려견',
      'title': '우리 강아지 귀여운거 봐봐',
      'content': '나 처음으로 강아지 키우는데 너무 귀엽지 않아?',
      'profileImagePath': 'https://via.placeholder.com/50',
      'imageUrl': 'https://via.placeholder.com/500',
      'likes': 45,
      'comments': [
        {'author': '유저1', 'content': '너무 귀여워요!'},
        {'author': '유저2', 'content': '정말 귀엽네요 ㅎㅎ'},
      ],
      'createdAt': DateTime.now().subtract(const Duration(hours: 2)),
      'isLiked': false,
      'isScraped': false,
    },
    {
      'id': 2,
      'author': '나의 반려견',
      'title': '우리 강아지 귀여운거 봐봐',
      'content': '나 처음으로 강아지 키우는데 너무 귀엽지 않아?',
      'profileImagePath': 'https://via.placeholder.com/50',
      'imageUrl': 'https://via.placeholder.com/500',
      'likes': 45,
      'comments': [
        {'author': '유저1', 'content': '너무 귀여워요!'},
        {'author': '유저2', 'content': '정말 귀엽네요 ㅎㅎ'},
      ],
      'createdAt': DateTime.now().subtract(const Duration(hours: 3)),
      'isLiked': false,
      'isScraped': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(showDetail ? '상세보기' : '마이페이지', style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (showDetail) {
              setState(() {
                showDetail = false;
              });
            } else {
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            child: const Text('로그아웃', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: showDetail ? _buildDetailView() : _buildProfileView(),
    );
  }

  Widget _buildProfileView() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // 사용자 정보 섹션
        _buildUserInfo(),
        const SizedBox(height: 20),
        // 버튼 섹션
        _buildButtons(),
        const SizedBox(height: 20),
        const Text(
          'WE PET',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        const SizedBox(height: 10),
        // 반려동물 목록
        ...pets.map(_buildPetTile).toList(),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/profile_image.png'),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('나섬이 반려인 WELCOME!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileEdit(),
                  ),
                );
              },
              child: Text(
                '나섬이   MY 계정관리',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ProfileButton(
          icon: Icons.bookmark,
          label: '게시글 보관함',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PostStoragePage(),
              ),
            );
          },
        ),
        _ProfileButton(
          icon: Icons.headset_mic,
          label: '고객센터',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomerServicePage(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPetTile(Map<String, dynamic> pet) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPet = pet;
          showDetail = true;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 10,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(pet['imageUrl']),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(pet['profileImagePath']),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet['title'],
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      pet['author'],
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              pet['content'],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              '작성일: ${_formatDate(pet['createdAt'])}',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.favorite, size: 20, color: Colors.red),
                const SizedBox(width: 8),
                Text('${pet['likes']} Likes'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '날짜 없음'; // 날짜가 없으면 '날짜 없음'으로 표시
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour}:${date.minute.toString().padLeft(2, '0')}";
  }

  Widget _buildDetailView() {
    if (selectedPet == null) return const SizedBox.shrink(); // 선택된 반려동물이 없으면 빈 공간을 반환

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(selectedPet!['profileImagePath']),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedPet!['title'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    selectedPet!['author'],
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () async {
                  final updatedData = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Post(
                        title: selectedPet!['title'],
                        content: selectedPet!['content'],
                      ),
                    ),
                  );
                  if (updatedData != null) {
                    setState(() {
                      selectedPet!['title'] = updatedData['title'];
                      selectedPet!['content'] = updatedData['content'];
                    });
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  bool? shouldDelete = await _showDeleteDialog();
                  if (shouldDelete == true) {
                    setState(() {
                      pets.removeWhere((pet) => pet['id'] == selectedPet!['id']);
                      showDetail = false;
                      selectedPet = null;
                    });
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            selectedPet!['content'],
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Future<bool?> _showDeleteDialog() async {
    return await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('삭제 확인'),
          content: const Text('이 반려동물 정보를 삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false), // 취소
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true), // 삭제
              child: const Text('삭제'),
            ),
          ],
        );
      },
    );
  }
}

class _ProfileButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ProfileButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.green),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}
